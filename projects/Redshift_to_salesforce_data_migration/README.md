# 🔄 Redshift to Salesforce Migration

**Tech Stack**: AWS Glue • AWS S3 • PySpark • Python • Salesforce Bulk API v2

## 📌 Overview

This project showcases a robust end-to-end **data migration pipeline** designed to migrate over **17 million member records** from data files in **Amazon S3** into **Salesforce** using a combination of **AWS Glue**, **PySpark**, and the **Salesforce Bulk API v2**.

The pipeline is part of a larger portfolio of Data Engineering solutions and follows a modular, config-driven architecture to allow easy scaling and adaptability.

---

## 🚀 Project Highlights

- ✅ Migrated **17M+ records** across 6 critical Salesforce objects with <1% error rate.
- 🔁 Designed **initial load** and **delta load** pipelines (2–3 million records per delta).
- 🧩 Developed using **PySpark** for transformations and column mapping.
- ☁️ Used **AWS Glue workflows** to orchestrate end-to-end processing.
- 📥 **Extracted** source files from **AWS S3**, applied business logic, and loaded transformed data back to S3 before ingestion.
- 📤 Used **Python with Bulk API v2** for high-volume Salesforce ingestion (Insert & Upsert support).
- 🏆 Received a **Certificate of Excellence** from the client for delivery and performance.

---

## 🛠️ Architecture

```text
        +-------------+
        |  AWS S3     |  <- Raw Data Files (CSV)
        +-------------+
               |
               v
        +------------------+
        |  AWS Glue (ETL)  |  <- PySpark Jobs
        +------------------+
               |
               v
        +----------------------+
        |  AWS S3 (Processed)  |  <- Transformed Output
        +----------------------+
               |
               v
        +---------------------------+
        |  Python Bulk API v2      |  <- Salesforce Ingestion
        +---------------------------+
