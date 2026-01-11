import boto3
import logging
from pyspark.context import SparkContext
from awsglue.context import GlueContext
from awsglue.job import Job

# Initialize logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s %(levelname)s: %(message)s')
logger = logging.getLogger(__name__)

# Glue and Spark Context
sc = SparkContext()
glueContext = GlueContext(sc)
spark = glueContext.spark_session

# Dummy job init
job = Job(glueContext)
job.init("sample_stage_to_raw_copy_job", {})

# -------------------------
# Dummy Configuration Setup
# -------------------------
SOURCE_BUCKET = "dummy-source-bucket"
TARGET_BUCKET = "dummy-target-bucket"
CONFIG_FILE_PATH = "s3://dummy-config-bucket/config/file_mapping.csv"
PARTITION_MONTH = "202509"

# AWS Clients
s3 = boto3.resource('s3')
s3_client = boto3.client('s3')
source_bucket = s3.Bucket(SOURCE_BUCKET)

def copy_file(src_key, dest_key):
    """Copy file from source to destination in S3."""
    logger.info(f"Copying {src_key} to {dest_key}")
    copy_source = {'Bucket': SOURCE_BUCKET, 'Key': src_key}
    s3.meta.client.copy(copy_source, TARGET_BUCKET, dest_key)
    logger.info(f"Copied: {src_key} -> {dest_key}")

def process_config_file():
    """Read the config CSV and copy matching files."""
    try:
        # Read config file (file_pattern, input_path, output_path)
        config_df = spark.read.option("header", True).option("delimiter", "|").csv(CONFIG_FILE_PATH)
        config_df.createOrReplaceTempView("config_vw")
        config_data = config_df.collect()

        for row in config_data:
            file_pattern = row["file_pattern"]
            input_path = row["input_file_path"]
            output_path = row["output_file_path"]

            logger.info(f"Processing pattern: {file_pattern}")

            matching_keys = [
                obj.key for obj in source_bucket.objects.filter(Prefix=input_path)
                if file_pattern in obj.key and not obj.key.endswith("/")
            ]

            ctrl_file = next((k for k in matching_keys if "_CTRL.csv" in k), None)
            data_file = next((k for k in matching_keys if "_CTRL.csv" not in k), None)

            if ctrl_file and data_file:
                # Basic validation: compare row counts
                df_ctrl = spark.read.option("header", True).csv(f"s3://{SOURCE_BUCKET}/{ctrl_file}")
                df_data = spark.read.option("header", True).csv(f"s3://{SOURCE_BUCKET}/{data_file}")

                expected_count = int(df_ctrl.collect()[0][0])
                actual_count = df_data.count()

                if expected_count == actual_count:
                    file_name = data_file.split("/")[-1]
                    dest_key = f"{output_path}{PARTITION_MONTH}/{file_name}"
                    copy_file(data_file, dest_key)
                else:
                    logger.warning(f"Count mismatch for {file_pattern}: expected {expected_count}, got {actual_count}")
            else:
                logger.warning(f"Control or data file missing for pattern: {file_pattern}")
    except Exception as e:
        logger.error(f"Error processing config: {str(e)}")
        raise

# Run main logic
if __name__ == "__main__":
    process_config_file()
    job.commit()
