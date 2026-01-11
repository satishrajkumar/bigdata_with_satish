import boto3
import logging
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job
from pyspark.sql.functions import lit, from_utc_timestamp, lower

# Setup logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s %(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

# Glue + Spark Context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session
job = Job(glueContext)
job.init("sample_rds_loader_job", {})

# ----------------------------
# 🔧 Dummy Configs (Hardcoded)
# ----------------------------

SOURCE_TABLES = ["dummy_schema.source_table"]
TARGET_SCHEMA = "target_schema"
TARGET_TABLE = "target_table"
ERROR_TARGET_TABLE = "target_table_err"
BATCH_ID = "20250930"
BULK_SIZE = 1000
USER = "data_engineer"
STEP_ID = "103"  # Change to '104' or '105' to test error flow
INCLUDE_ERROR_FLOW = True
SUB_SOURCE_SYSTEM_CODE = "SRC01"

# Mock DB connection details
DB_NAME = "mock_db"
DB_HOST = "mock-host"
DB_PORT = 5432
DB_USER = "mock_user"
DB_PASSWORD = "mock_password"

# -----------------------
# 🔁 Example SQL Query
# -----------------------
QUERY = """
SELECT col1, col2, col3, 'N' as err_indicator FROM dummy_schema.source_table
"""

# ----------------------------
# 🧪 Dummy custom function sim
# ----------------------------
def write_to_rds(df, schema, table):
    logger.info(f"Writing to RDS Table: {schema}.{table}")
    df.show(5)
    logger.info(f"✔️ Successfully wrote data to {schema}.{table} (mocked)")

# ----------------------------
# 🚀 Main Logic Starts Here
# ----------------------------
def main():
    try:
        # Simulate table read via query
        logger.info(f"Running query for source tables: {SOURCE_TABLES}")
        df = spark.sql(QUERY)

        # Error Flow Logic
        if STEP_ID in ["104", "105"] and INCLUDE_ERROR_FLOW:
            error_df = df.filter(lower(df.err_indicator) == "y")
            valid_df = df.filter(lower(df.err_indicator) == "n").drop("err_indicator")

            error_df = error_df.withColumn("batch_id", lit(BATCH_ID)) \
                               .withColumn("batch_load_datetime_sg", from_utc_timestamp("current_timestamp()", "UTC+08:00")) \
                               .withColumn("batch_loaded_by", lit(USER))
            write_to_rds(error_df, TARGET_SCHEMA, ERROR_TARGET_TABLE)
        else:
            valid_df = df

        # Add batch columns
        valid_df = valid_df.withColumn("batch_id", lit(BATCH_ID)) \
                           .withColumn("batch_load_datetime_sg", from_utc_timestamp("current_timestamp()", "UTC+08:00")) \
                           .withColumn("batch_loaded_by", lit(USER))

        # Optional extra column for STEP_ID 103
        if STEP_ID == "103":
            valid_df = valid_df.withColumn("sub_source_system_code", lit(SUB_SOURCE_SYSTEM_CODE))

        write_to_rds(valid_df, TARGET_SCHEMA, TARGET_TABLE)

    except Exception as e:
        logger.error(f"❌ Exception occurred: {e}")
        raise
    finally:
        logger.info("✅ Job completed")

if __name__ == "__main__":
    main()
