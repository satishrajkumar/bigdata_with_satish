import datetime
import time
import logging
from pyspark.sql import SparkSession
from pyspark.sql.functions import col, count, lit, trim, input_file_name, when
from pyspark.sql.window import Window
from pyspark.sql.types import StructType

# ---- Logging Setup ----
logging.basicConfig(level=logging.INFO, format='%(asctime)s %(levelname)s %(message)s')
logger = logging.getLogger()

# ---- Initialize Spark ----
spark = SparkSession.builder.appName("DQCheckSample").getOrCreate()

# ---- Constants ----
CURRENT_TIMESTAMP = datetime.datetime.now()
BATCH_ID = "20230930"
JOB_ID = "dq_job_001"
KEY_COLS = ["id"]
TARGET_TABLE_NAME = "sample_table"
ERROR_TABLE_NAME = "sample_table_err"
RESULT_TABLE_NAME = "dq_results"
SEVERITY = "High"

# ---- Sample Input DataFrame ----
data = [
    (1, "Alice", 100),
    (2, "Bob", None),
    (3, "", 300),
    (4, "Alice", 400),  # Duplicate name
    (5, "Alice", 100),  # Duplicate row
    (6, None, 600)
]

schema = "id int, name string, value int"
df = spark.createDataFrame(data, schema=schema)
df = df.withColumn("input_file_name", lit("sample.csv"))

# ---- Completeness Check ----
def completeness_check(df, columns):
    logger.info("Running completeness check...")
    for column in columns:
        df_nulls = df.filter(col(column).isNull() | (trim(col(column)) == ""))
        count_nulls = df_nulls.count()
        logger.info(f"Column '{column}' has {count_nulls} null/blank values.")
        if count_nulls > 0:
            df_nulls.show()
    return

# ---- Uniqueness Check ----
def uniqueness_check(df, key_columns):
    logger.info("Running uniqueness check...")
    w = Window.partitionBy([col(c) for c in key_columns])
    df_dupes = df.withColumn("dupe_count", count("*").over(w)) \
                 .filter(col("dupe_count") > 1) \
                 .drop("dupe_count")
    dupes_count = df_dupes.count()
    logger.info(f"Found {dupes_count} duplicate records based on keys: {key_columns}")
    if dupes_count > 0:
        df_dupes.show()
    return

# ---- Count Check (source vs target) ----
def count_check(source_count, target_count):
    logger.info("Running count check...")
    logger.info(f"Source count = {source_count}, Target count = {target_count}")
    if source_count != target_count:
        logger.warning("Count mismatch detected!")
    else:
        logger.info("Count check passed.")
    return

# ---- Run Checks ----
completeness_check(df, ["name", "value"])
uniqueness_check(df, ["name", "value"])
count_check(df.count(), 6)  # Let's assume target has 6 rows too

logger.info("DQ Checks Completed")
