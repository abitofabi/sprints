# 🧠 AWS DEA-C01 Decision Tree Cheatsheet

## 🔥 When you see data streaming in the question:

- **Does it mention S3?**
  - ✅ **Yes →** Use **Kinesis Firehose** (auto delivery to S3/Redshift, no code).
  - ❌ **No →** Use **Redshift Streaming Ingestion** (direct ingestion from Kinesis).

## 🧪 When data is queried:

- **Where is the data stored?**
  - 📂 **S3 + Large dataset →** Use **Athena**.
  - 📂 **S3 + Small subset →** Use **S3 Select**.
  - 🔴 **In Redshift + Real-time needs →** Use **Materialized Views + Auto Refresh** or **Redshift Streaming**.

## 🔄 When loading data into Redshift:

- **Where is the source data?**
  - 📂 **From S3 →** Use **COPY Command** (fast parallel bulk load).
  - 🔁 **Scheduled or recurring →** Use **AWS Data Pipeline** or **Glue Job**.
  - ⚡ **Real-time →** Use **Redshift Streaming** or **Firehose to Redshift**.

## 🧰 When transforming data:

- **How is the transformation done?**
  - 🧪 **Simple SQL-style →** Use **Athena**, **Redshift**, or **Glue SQL**.
  - 🧠 **Complex / Python / ETL pipelines →** Use **AWS Glue (Spark)** or **Lambda for small tasks**.

## 🪣 S3 Storage Decisions:

- ❓**Will user access it soon or maybe later?**
  - 🔁 **Yes →** Use **S3 Intelligent Tiering**.
  - 🧊 **Rarely needed →** Use **Glacier / Deep Archive**.
  - 📥 **Frequently accessed →** Use **S3 Standard**.

## 🤖 When using Lambda:

- ⏱️ **Short running (under 15 mins)? →** ✅ Yes.
- ⚙️ **Event-driven (S3, DynamoDB, Kinesis)? →** ✅ Yes.
- 🖥️ **Need full control or long-running? →** ❌ Use **Fargate / ECS / EC2**.

## 🧠 Rule of Thumb Shortcuts:

- **Athena** → Query large S3 data.
- **S3 Select** → Query a small part of a single S3 file.
- **Redshift COPY** → Bulk load from S3.
- **Firehose** → No-code streaming to S3/Redshift.
- **Redshift Streaming** → Real-time ingestion directly to Redshift.
- **Glue** → Serverless ETL; complex transformations.
- **Lambda** → Lightweight serverless compute.
- **Fargate** → Long-running or containerized jobs.

# 🧠 AWS DEA-C01 Decision Tree Cheat Sheet

---

## 🚀 Data Ingestion

| Scenario                            | Use                                         |
|-------------------------------------|---------------------------------------------|
| Real-time data from apps/devices    | Amazon Kinesis Data Streams                 |
| Want auto-batching to S3            | Kinesis Data Firehose                       |
| Need Kafka-compatible stream        | Amazon MSK                                  |
| IoT devices                         | AWS IoT Core → Kinesis/Firehose             |
| Uploading files to S3 from edge     | AWS Snowball or AWS DataSync                |
| One-time large DB or file transfer  | AWS DMS or Snowball                         |

---

## 🔄 Real-time Data Movement

| Source               | Destination | Use                                                              |
|----------------------|-------------|------------------------------------------------------------------|
| Kinesis Stream       | Redshift    | Redshift Streaming Ingestion (NEW, low latency)                  |
| Kinesis              | S3 → Redshift | Firehose to S3, then COPY to Redshift (Batch)                  |
| Kinesis              | Lambda      | Real-time processing, transformation                             |
| MSK                  | Redshift    | Use Kafka Connect + Redshift Sink Connector                      |

---

## 🧪 Analytics and Query

| Need                               | Use                                                 |
|------------------------------------|------------------------------------------------------|
| Query data in S3 (no load)         | Amazon Athena                                        |
| Scheduled ETL/ELT in S3            | AWS Glue Jobs + Glue Crawlers                       |
| Streaming ETL                      | Kinesis Data Analytics                              |
| Stream-to-dashboard (BI)           | Kinesis → Lambda → DynamoDB → QuickSight           |
| Query semi-structured data         | Athena or Redshift Spectrum                         |

---

## 🗄️ Storage Tiering Decisions (S3)

| Scenario                            | Storage Class                 |
|-------------------------------------|-------------------------------|
| Frequent access                     | S3 Standard                   |
| Infrequent, but might be accessed   | S3 Intelligent Tiering ✅     |
| Rarely accessed, cost-saving        | S3 Standard-IA                |
| Archived, restore within hours      | S3 Glacier                    |
| Archived, restore in days           | S3 Glacier Deep Archive       |
| Temporary, auto delete              | S3 Lifecycle + TTL            |

---

## 🔒 Security & Governance

| Requirement               | AWS Feature                            |
|---------------------------|-----------------------------------------|
| Data encryption at rest   | SSE-S3 / SSE-KMS                        |
| Column-level access       | Lake Formation or Redshift RBAC        |
| Auditing access           | AWS CloudTrail                         |
| VPC-only access           | VPC Endpoints + S3 Bucket Policy       |

---

## 📡 Data Transfer & Migration

| Need                               | Use                                                  |
|------------------------------------|-------------------------------------------------------|
| On-prem DB → AWS                   | AWS DMS                                              |
| Terabytes of files → S3            | AWS Snowball                                         |
| Hybrid (on-prem + cloud sync)      | AWS DataSync                                         |
| Serverless data lake               | S3 + Glue + Athena                                   |
| SQL warehouse                      | Redshift                                             |
| Fully managed lakehouse            | Amazon Redshift + Spectrum or EMR with Iceberg      |

---

## 🧰 Tip Patterns

- If **S3 is involved + streaming** → **Firehose**
- If **Redshift is direct target + stream** → **Redshift Streaming**
- If **data isn’t accessed often, but unsure** → **Intelligent Tiering**
- If **semi-structured data in S3 needs SQL** → **Athena**
- If **ingestion needs transformation** → **Lambda / Glue / Kinesis Data Analytics**

🧠 TL;DR Cheat Sheet for multiple databases

Need	Best Option

One-time or CDC migration	✅ DMS
Ad-hoc SQL query across sources	✅ Athena Federated Query
Spark join/transform across DBs	✅ Glue + JDBC
BI/Reports from multiple sources	✅ QuickSight
Real-time DB query from Redshift	✅ Redshift Federated
No-code syncing of data	✅ AppFlow or EventBridge


AWS VPC Concepts	Real-World Analogy	Purpose

VPC	🏢 Apartment complex boundary	Your isolated network
Subnet	🛏️ Individual apartment blocks	Divide areas for public/private use
Internet Gateway (IGW)	🌐 Main gate that lets you access the internet	Outbound internet for public subnets
NAT Gateway	🕵️ Secret exit door with one-way mirror	Lets private subnets go out to internet (but not get in)
Security Group	🚪 Door lock (per room)	Controls who can enter/exit a resource
NACL	👮 Society-level rules at the main gate	Rules for the whole subnet (stateless)
Endpoint (Gateway)	🛒 Amazon delivery pickup point inside complex	Lets private subnets talk to AWS services without internet