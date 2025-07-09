# 🔥 AWS Kinesis: Firehose & Analytics

---

## 🔥 1. Kinesis Data Firehose – Fully Managed Data Delivery

### 💡 What is Firehose?

- **Zero-code** streaming data delivery service
- Ingest → Buffer → Transform (optional) → Store
- Targets:
  - **S3**
  - **Redshift**
  - **OpenSearch**
  - **HTTP endpoints**
  - **Datadog**, **Splunk**, **New Relic**

### 🛠️ How It Works
  [Data Producers] → Firehose → [S3 / Redshift / ES / Custom]

- No need to manage shards or scaling
- Auto-batches and compresses data (gzip/snappy/parquet)
- Built-in transformation with Lambda

### ✅ Features

| Feature              | Description                              |
|----------------------|------------------------------------------|
| **Buffering**        | Waits for buffer size/time before delivery |
| **Transforms**       | Run a Lambda function to modify records |
| **Compression**      | GZIP/SNAPPY/PARQUET supported            |
| **Retries**          | Built-in with S3 backup on failure       |
| **Encryption**       | KMS integrated, supports IAM & VPC       |

### 🧠 Use Case

- Streaming logs → S3 → Athena
- IoT sensor data → Firehose → Redshift (warehouse)
- App telemetry → OpenSearch for real-time dashboarding

---

## 💸 Firehose Pricing

- **Per GB ingested**
- **Optional costs**:
  - Lambda transform
  - Compression
  - Destination charges (like Redshift/S3)

---

## 🔎 Sample Delivery Stream Definition

~~~json
{
  "DeliveryStreamName": "my-firehose-stream",
  "DeliveryStreamType": "DirectPut",
  "S3DestinationConfiguration": {
    "RoleARN": "arn:aws:iam::1234:role/firehose-role",
    "BucketARN": "arn:aws:s3:::abinaya-bucket",
    "CompressionFormat": "UNCOMPRESSED"
  }
}
~~~

---

## 🧠 2. Kinesis Data Analytics (KDA) – SQL on Streams

### 💡 What is KDA?

- Run **real-time SQL queries** on Kinesis Streams or Firehose
- Examples:
  - Detect fraud patterns
  - Aggregate metrics (avg, sum, windowed ops)
  - Clean/transform data before S3

Supports:
- **Standard SQL** (w/ streaming extensions like `TUMBLING`, `SLIDING` windows)
- **ML Inference** using **Random Forest** or **XGBoost** models

### 🔥 Sample Query

~~~sql
CREATE OR REPLACE STREAM "high_value_txns" (
    user_id VARCHAR(64),
    amount INTEGER
);

CREATE OR REPLACE PUMP "p1" AS INSERT INTO "high_value_txns"
SELECT user_id, amount
FROM "input_stream"
WHERE amount > 1000;
~~~

---

## 🔍 Analytics + ML Inference

You can **import your trained model** into KDA to do live predictions:

~~~sql
SELECT STREAM 
  user_id,
  amount,
  ML_INFER("rf_model", amount, txn_type, location) AS risk_score
FROM "input_stream";
~~~

- Models must be in **XGBoost or Random Forest** format (PMML)
- Uploaded to S3, then imported into KDA

---

## ⚠️ Deprecation Note

- **KDA for Java/Flink** is deprecated (EOL in 2025)
- **KDA for SQL** is still supported & exam-relevant
- Alternative: **Apache Flink on MSK / Self-managed**

---

## 💸 Pricing – Kinesis Data Analytics

- Charged per **KPU (Kinesis Processing Unit)** per hour  
  1 KPU = 1 vCPU + 4 GB memory  
- Charged separately for:
  - **Durable storage** (if enabled)
  - **ML Inference**

---

## 🔁 Summary: Firehose vs Analytics

| Feature                 | Firehose                        | Kinesis Data Analytics          |
|--------------------------|----------------------------------|----------------------------------|
| Purpose                  | Stream → Destination            | Real-time processing on stream  |
| Serverless?              | ✅                               | ✅                               |
| Transformation           | Lambda                          | SQL (streaming SQL)             |
| Custom Logic             | ❌ (limited)                    | ✅ (windows, filters, ML)       |
| Output                   | S3, Redshift, OpenSearch        | Back into Firehose or S3        |
| ML Integration           | ❌                              | ✅ Random Forest/XGBoost         |
| Cost Model               | Per GB                          | Per KPU                         |

---

## 🧠 TL;DR Flash Notes

- **Firehose** = Pipe → Store (S3, Redshift, ES, etc.)
  - Serverless, simple, good for delivery
  - Buffering, compression, retry, Lambda transform
- **Kinesis Data Analytics (SQL)** = Run SQL on data stream
  - Tumble/sliding windows
  - ML model scoring
  - Writes back into Firehose/S3

---
