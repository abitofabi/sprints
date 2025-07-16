# AWS Data Services Comparison Cheat Sheet

| # | Criteria                          | Highest Rank(s) / Best Suited For                                                                                                          |
|---|-----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| 1 | **Large File Size (TB–PB)**      | 🥇 **S3 + Athena** – Unlimited storage, query large datasets<br>🥈 Redshift RA3<br>🥉 EMR                                                   |
| 2 | **Number of Records (Scale)**    | 🥇 **DynamoDB** – Billions of key-value records<br>🥈 Redshift<br>🥉 EMR                                                                     |
| 3 | **Data Processing Time**         | 🥇 **Kinesis (Real-Time)**<br>🥈 Lambda / Firehose (Near Real-Time)<br>🥉 Glue, Athena, Redshift (Batch)                                    |
| 4 | **Latency**                      | 🥇 **DynamoDB (ms)**<br>🥈 OpenSearch (~100ms)<br>🥉 Kinesis → Lambda                                                                        |
| 5 | **Cost Effectiveness**           | 🥇 **Athena (pay-per-query)**<br>🥈 S3 (cheap storage)<br>🥉 Glue (serverless billing per job)                                               |
| 6 | **Security & Compliance**        | 🥇 **S3 + KMS + IAM Policies**<br>🥈 Redshift (SSL, KMS, VPC, IAM)<br>🥉 DynamoDB (fine-grained access)                                     |
| 7 | **External Sharing**             | 🥇 **S3 (pre-signed URLs, cross-account)**<br>🥈 Athena (via JDBC)<br>🥉 Redshift (data sharing on RA3)                                     |
| 8 | **Auditing & Logging**           | 🥇 **S3 + CloudTrail**<br>🥈 Athena (query CloudTrail)<br>🥉 Redshift (system tables)                                                       |
| 9 | **Memory / Query Power**         | 🥇 **Redshift (MPP, columnar)**<br>🥈 EMR (Spark in-memory)<br>🥉 Glue (Spark under the hood)                                               |
|10 | **Compute Power**                | 🥇 **EMR (tunable clusters)**<br>🥈 Redshift (compute-optimized)<br>🥉 Glue (DPU-based)                                                      |
|11 | **Server vs Serverless**         | 🟩 **Serverless:** Glue, Athena, Lambda, DynamoDB<br>🟥 **Server-Based:** Redshift, EMR, OpenSearch                                        |

---

## 🔗 Use Case Mapping

| Service     | Best Use Case                                                                                 | Mode        |
|-------------|-----------------------------------------------------------------------------------------------|-------------|
| **S3**      | Data lake, backups, archiving, raw storage                                                    | Serverless  |
| **Athena**  | Ad-hoc querying over S3 data                                                                  | Serverless  |
| **Redshift**| OLAP queries, BI dashboards, large-scale structured data                                      | Server      |
| **EMR**     | Big data processing, ML, in-memory Spark/Hadoop pipelines                                     | Server      |
| **Glue**    | ETL/ELT pipelines, metadata cataloging                                                        | Serverless  |
| **DynamoDB**| Low-latency key-value store, session state, NoSQL document DB                                 | Serverless  |
| **Kinesis** | Real-time data ingestion (clickstream, logs, IoT, social media)                               | Serverless  |
| **OpenSearch**| Text search, log analytics, near real-time dashboarding                                    | Server      |

---

> 📌 **Tips**:
> - For **cost optimization**, prefer serverless (Athena, Glue, S3) unless you have fixed 24x7 workloads.
> - Use **Redshift** or **EMR** only if your data pipeline is large, structured, and needs power or tuning.
> - **Athena** is perfect for **audit queries** over logs (CloudTrail, ELB, S3 access).
> - Combine **Glue + S3 + Athena** for a lightweight serverless pipeline.

---

## 🧠 Rule of Thumb:

Glue → Best for serverless batch ETL (medium scale).

EMR → Best for massive batch jobs, custom Spark/Hadoop.

Kinesis + Lambda → Best for real-time pipelines.

Redshift → Best for fast querying/reporting (not real-time compute).