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