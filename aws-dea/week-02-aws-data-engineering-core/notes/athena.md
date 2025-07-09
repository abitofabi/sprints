# 📊 AWS Athena
## 🧃 What is Athena?

- Athena is a **query engine**
- You can write SQL directly on files in **S3** — like CSV, JSON, or Parquet
- It's **serverless**: no clusters, no EC2s, no infra to manage
- Based on **Presto (now Trino)** open-source engine

🧪 TL;DR: Athena = "SELECT * FROM your-S3-file.csv" 💡

---

## 🧱 What You Need for Athena to Work

1. **Data in S3**  
   → Format: CSV, JSON, Parquet, ORC, Avro  
2. **Schema**  
   → You define a table (e.g., via Glue Crawler or manually)  

Example:

```
CREATE EXTERNAL TABLE customers (
  name STRING, age INT, city STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
LOCATION 's3://your-bucket/customers/';
```

---

## 🚀 What Makes Athena Powerful?

| Feature               | Explanation                                        |
|------------------------|----------------------------------------------------|
| ✅ No Infra            | Serverless, pay-per-query                          |
| 🤝 Works with Glue     | Can use Glue Catalog as schema source              |
| 🚀 Supports Partitioning | Speeds up queries if S3 is well organized         |
| 🔥 Can Read Parquet     | Columnar = fast, cheap                             |
| 📊 Integrates with QuickSight | Dashboards on S3 data                     |

---

## 🧊 What’s “Partitioning” in Athena?

Partitioning = **organizing S3 files by folder structure**

Example S3 path:

"s3://my-logs/year=2024/month=07/day=06/logfile.parquet"

SQL query:

```
SELECT * FROM logs
WHERE year = '2024' AND month = '07';
```

✅ Athena will **only scan those folders**, not entire S3 bucket  
💰 Saves $$$ by reducing scanned data

---

## 🧪 Iceberg, ACID — What’s That Buzz?

Athena now supports **Apache Iceberg** table format.

| Concept     | Meaning                                                                 |
|-------------|-------------------------------------------------------------------------|
| **Iceberg** | A smarter table format for S3 — supports updates, deletes, time travel |
| **ACID**    | Athena can now do insert/update/delete on Iceberg tables               |
| **Use Case**| Good for modern “data lakehouse” setups                                |

📌 Traditional Athena tables = read-only  
📌 Iceberg tables = read + write with schema evolution

---

## 🏁 Summary – Why Use Athena?

| Use Case                                      | Athena? |
|-----------------------------------------------|---------|
| Run SQL on S3 files                           | ✅      |
| Avoid Redshift setup                          | ✅      |
| Update or delete rows                         | 🔸 Only with Iceberg |
| Visualize with QuickSight                     | ✅      |
| Real-time updates                             | ❌      |

---

## 🧠 Interview Style Flash Notes

- Athena = serverless SQL on S3
- Based on **Presto**
- Schema stored in **Glue Data Catalog**
- Supports **partitioned data**
- Supports **Parquet**, **ORC**, **JSON**, **CSV**
- **Cost**: $5 per TB scanned → partition + compress!

