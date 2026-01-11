from pyspark.sql import SparkSession
from pyspark.sql.functions import sha2, concat_ws, lit, current_date, to_date, when, col, from_utc_timestamp
from pyspark.sql.types import StructType, StructField, StringType, IntegerType, DateType

# ------------------------
# ⚙️ Initialize Spark
# ------------------------
spark = SparkSession.builder \
    .appName("Simplified_SCD2_Example") \
    .getOrCreate()

# ------------------------
# 📌 Sample Source Data
# ------------------------
source_data = [
    (1, "John", "Sales", "USA"),
    (2, "Jane", "Marketing", "UK"),
    (3, "Mike", "Finance", "USA")
]

source_schema = StructType([
    StructField("emp_id", IntegerType(), True),
    StructField("name", StringType(), True),
    StructField("department", StringType(), True),
    StructField("location", StringType(), True)
])

source_df = spark.createDataFrame(source_data, source_schema)
source_df = source_df.withColumn("hash_column", sha2(concat_ws("||", "name", "department", "location"), 256))
source_df.createOrReplaceTempView("source")

# ------------------------
# 📌 Sample Target Data (SCD2 Table)
# ------------------------
target_data = [
    (1, "John", "Sales", "USA", "Y", "2021-01-01", "9999-12-31", "abc123", 100),
    (2, "Jane", "Sales", "UK", "Y", "2022-01-01", "9999-12-31", "def456", 101)
]

target_schema = StructType([
    StructField("emp_id", IntegerType(), True),
    StructField("name", StringType(), True),
    StructField("department", StringType(), True),
    StructField("location", StringType(), True),
    StructField("active_flag", StringType(), True),
    StructField("eff_start_date", DateType(), True),
    StructField("eff_end_date", DateType(), True),
    StructField("hash_column", StringType(), True),
    StructField("sk", IntegerType(), True)
])

target_df = spark.createDataFrame(target_data, target_schema)
target_df.createOrReplaceTempView("target")

# ------------------------
# 🔍 Perform SCD2 Logic
# ------------------------

# Join source and target on emp_id (natural key)
merged_df = source_df.alias("src") \
    .join(target_df.alias("tgt"), col("src.emp_id") == col("tgt.emp_id") & (col("tgt.active_flag") == "Y"), "fullouter") \
    .select(
        col("src.emp_id").alias("emp_id_src"),
        col("tgt.emp_id").alias("emp_id_tgt"),
        col("src.name").alias("name_src"),
        col("tgt.name").alias("name_tgt"),
        col("src.department").alias("department_src"),
        col("tgt.department").alias("department_tgt"),
        col("src.location").alias("location_src"),
        col("tgt.location").alias("location_tgt"),
        col("src.hash_column").alias("hash_src"),
        col("tgt.hash_column").alias("hash_tgt"),
        col("tgt.sk").alias("sk_tgt")
    )

# Determine action
merged_df = merged_df.withColumn(
    "action",
    when(col("emp_id_tgt").isNull(), "INSERT")
    .when(col("hash_src") != col("hash_tgt"), "UPSERT")
    .otherwise("NOACTION")
)

merged_df.createOrReplaceTempView("merged")

# New surrogate key base
current_max_sk = target_df.agg({"sk": "max"}).collect()[0][0] or 100
next_sk_start = current_max_sk + 1

# ------------------------
# 💾 Prepare Final Inserts
# ------------------------

# Get INSERTs and UPSERTs with new SK
insert_upsert_df = spark.sql("""
    SELECT 
        emp_id_src AS emp_id,
        name_src AS name,
        department_src AS department,
        location_src AS location,
        'Y' AS active_flag,
        current_date() AS eff_start_date,
        to_date('9999-12-31') AS eff_end_date,
        hash_src AS hash_column
    FROM merged
    WHERE action IN ('INSERT', 'UPSERT')
""")

# Add new SK using row_number
from pyspark.sql.window import Window
from pyspark.sql.functions import row_number

window_spec = Window.orderBy("emp_id")
insert_upsert_df = insert_upsert_df.withColumn("sk", row_number().over(window_spec) + current_max_sk)

# Get UPDATEs (expire old record)
update_df = spark.sql("""
    SELECT 
        emp_id_tgt AS emp_id,
        name_tgt AS name,
        department_tgt AS department,
        location_tgt AS location,
        'N' AS active_flag,
        eff_start_date,
        current_date() AS eff_end_date,
        hash_tgt AS hash_column,
        sk_tgt AS sk
    FROM merged
    WHERE action = 'UPSERT'
""")

# Union final result
final_df = insert_upsert_df.unionByName(update_df)

# ------------------------
# ✅ Final Result
# ------------------------
print("🔄 Final SCD2 Output:")
final_df.orderBy("emp_id", "active_flag").show(truncate=False)

# Stop Spark
spark.stop()
