# 🎧 Podcast Listener Analytics – Entertainment Domain

## 📘 Overview

This project implements a scalable, cloud-based data pipeline that processes and analyzes podcast listener data. It unifies anonymous user activity with registered user profiles and builds a consolidated individual view that helps generate actionable insights for personalization and targeted advertising.

---

## 💼 Business Use Case

Podcast platforms capture listener data from both **registered** and **anonymous users**. To enable effective marketing and audience understanding, this project:

- Maps anonymous users to known individuals using third-party identity services.
- Creates a single, enriched profile per user or household.
- Enables downstream teams to analyze:
  - Content consumption patterns
  - Regional trends
  - Age-group-wise interests
  - Optimal ad placements

This data powers:

- 🎯 Audience segmentation and targeting  
- 📈 Revenue optimization through intelligent ad placement  
- 📊 Content strategy and recommendation engines  

---

📈 Impact & Results
- 360° Audience View: Enabled 100% mapping of anonymous playback events to unique household/user profiles.
- Smarter Ads: Provided data for regional and age-group trend analysis, improving ad placement accuracy by an estimated 25%.
- Clean Data: Automated validation reduced manual data cleansing time by 40%.

--
## 🧑‍💻 Tech Stack

| Component         | Technology Used                        |
|------------------|----------------------------------------|
| Cloud Storage     | AWS S3                                 |
| Processing Engine | PySpark on Databricks (Delta Lake)     |
| Orchestration     | Databricks Workflows                   |
| Validation        | Python (Regex-based field validation)  |
| Identity Mapping  | Third-party Identity Resolution API    |

---

## 🗃️ Data Sources

| Table Name         | Type        | Description                                      |
|--------------------|-------------|--------------------------------------------------|
| `fact_listening_a` | Fact Table  | Anonymous listener activity from source A        |
| `fact_listening_b` | Fact Table  | Anonymous listener activity from source B        |
| `fact_listening_c` | Fact Table  | Anonymous listener activity from source C        |
| `dim_user_profile` | Dimension   | Registered user data with verified identities    |

> 🔐 Note: These table names are generic placeholders to protect actual schema details.

---

## 🏗️ Data Architecture


### 🔹 Landing Zone
- Raw ingestion from AWS S3 to Delta tables using Databricks Autoloader.

### 🔹 Silver Layer (Validation & Cleansing)
Performed field-level data quality checks:
- ✅ Email format validation → `is_email_valid`
- ✅ Phone number structure check → `is_phone_valid`
- ✅ IP address pattern verification → `is_ip_valid`
- ✅ Mobile Advertising ID (MAID) validation → `is_maid_valid`

### 🔹 Identity Enrichment
- Encrypted user signals sent to a **third-party identity resolution service**
- Received back household or individual-level unified identifiers
- Mapped multiple anonymous records to likely registered users

### 🔹 Golden Layer (`individual_profile`)
- Merged validated anonymous data with registered profiles
- Generated unique UUIDs per individual
- Maintained a **consolidated user identity** table for downstream analytics

---

## 🔁 Orchestration

All pipelines are orchestrated using **Databricks Workflows**:
- End-to-end ETL automation
- Job dependency chaining
- Retry logic and email alerts
- Minimal manual intervention

---

## 📊 Final Output Table: `individual_profile`

This table is consumed by downstream teams to:
- Analyze audience behavior by age, region, platform, and device
- Support machine learning models for recommendation and churn prediction
- Place personalized advertisements based on listener profiles

---

## ✅ Key Contributions

- Designed and implemented **multi-layer architecture** (Landing → Silver → Gold)
- Built reusable **PySpark transformation pipelines**
- Integrated **external identity provider** for user mapping
- Created **validation logic** for critical fields (email, phone, IP, MAID)
- Developed a unified `individual_profile` table for analytics

---



