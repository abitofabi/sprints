# Amazon Redshift – AWS Data Engineer Associate Notes

---

## 🧠 What is Redshift?

- Fully managed **cloud data warehouse**  
- Based on PostgreSQL  
- Optimized for **OLAP** (Online Analytical Processing)  
- Handles **petabyte-scale** data analytics  
- Columnar storage, massively parallel processing (MPP)  

---

## 🏗️ Architecture Overview

| Component           | Role                                                      |
|---------------------|-----------------------------------------------------------|
| **Leader Node**     | Receives queries, generates execution plans               |
| **Compute Nodes**   | Store and process data in parallel                        |
| **Node Types**      | RA3 (storage optimized), DC2 (dense compute)              |
| **Redshift Serverless** | Automatically provisions resources, no cluster to manage |

---

## 🧩 Data Loading & Integration

- **COPY Command**: Fastest way to bulk load data from S3, DynamoDB, Kinesis, or EMR  
  `COPY tablename FROM 's3://bucket/file' IAM_ROLE 'arn:aws:iam::...';`

- **UNLOAD Command**: Export query results back to S3  
- **Data Sharing**: Share data across accounts without duplicating  
- **Federated Queries**: Query data from Amazon RDS, Aurora, or Redshift Spectrum (external tables)

---

## 📦 Storage Formats

- Columnar storage for compression & performance  
- Supports **Parquet, ORC, JSON, CSV**  
- Redshift Spectrum queries data directly in S3  

---

## 💡 Redshift Spectrum

- Enables querying S3 data **without loading into Redshift**  
- Requires an **external schema and table**  
- Integrates with **AWS Glue Data Catalog**  

---

## 📊 Performance Features

| Feature                 | Description                                                    |
|--------------------------|----------------------------------------------------------------|
| **Materialized Views**   | Precompute and store query results                            |
| **Result Caching**       | Speeds up repeated queries with same result                   |
| **Concurrency Scaling**  | Automatically adds capacity to handle concurrent queries      |
| **Sort Keys**            | Improves query performance on sorted columns                  |
| **Distribution Styles**  | Controls how data is spread across nodes (KEY, EVEN, ALL)     |

---

## 🧠 Distribution Styles

| Type    | Description                                               |
|---------|-----------------------------------------------------------|
| KEY     | Distribute rows by specific column                        |
| EVEN    | Distribute rows evenly across nodes                       |
| ALL     | Copy entire table to every node (small lookup tables)     |

---

## 🧱 Compression & Encoding

- Redshift applies **column-level compression (encoding)**  
- Use `ANALYZE COMPRESSION` to get optimal encoding suggestions  
- Compression reduces disk usage and I/O  

---

## 🔒 Security

- **Encryption**: At rest using AWS KMS or hardware-based HSM  
- **VPC Support**: Can launch in private VPC subnet  
- **IAM-based Access Control**  
- **SSL/TLS** encryption in-transit  
- **Row-level & column-level access control** (with late 2023 updates)

---

## 🕒 Backup & Restore

- **Automated Snapshots**: Daily, retained up to 35 days  
- **Manual Snapshots**: User-created, retained until deleted  
- **Cross-region snapshot copy** for DR  

---

## 🧠 Redshift Serverless

- No cluster management  
- Pay per query and per-second compute  
- Ideal for unpredictable or ad hoc workloads  
- Same features as provisioned Redshift (Spectrum, Data Sharing, etc.)

---

## 💸 Pricing Tips

- Charged by:
  - **Node type & hours** (for provisioned)
  - **Query time** (for serverless)
  - **Storage used**
  - **Spectrum queries** (per TB scanned)

- **Use compression and sort keys** to reduce cost  
- **Unload old data to S3**, use Spectrum for infrequent access  

---

## 🧩 Redshift + Other AWS Services

| Service       | Use Case                                                                 |
|---------------|--------------------------------------------------------------------------|
| **S3**        | Data lake storage, bulk load (COPY), Spectrum queries                    |
| **Glue**      | Catalog for external tables, ETL for data prep                           |
| **Kinesis**   | Ingest real-time data, then batch into Redshift                          |
| **DynamoDB**  | COPY directly from DynamoDB to Redshift                                  |
| **Athena**    | Shared S3 layer, can query the same lake as Spectrum                     |
| **SageMaker** | Train ML models on Redshift data using SQL ML or UNLOAD datasets         |

---

## 🧪 Querying & Language

- Uses **PostgreSQL-compatible SQL**  
- Supports **CTAS** (Create Table As Select)  
- **Materialized Views** for performance  
- Redshift ML supports **SageMaker Autopilot** to create models using SQL  

---

## 🧠 Common Exam Topics (Data Engineer Focus)

- Difference between Redshift & Redshift Spectrum  
- Choosing between Redshift vs Athena vs EMR  
- COPY/UNLOAD for data movement  
- Concurrency Scaling, Materialized Views, Distribution Styles  
- Use Redshift Serverless for unpredictable workloads  
- Understand when to use Glue, Kinesis, DynamoDB, etc. with Redshift  
- Optimize with compression, sort keys, and distribution keys  

---

## ❓ FAQs for Exam

**Q: What’s the best way to analyze data from S3 using Redshift?**  
A: Redshift Spectrum — external tables on S3 using Glue Catalog  

**Q: When to use Redshift Serverless?**  
A: For unpredictable, bursty workloads or ad hoc analytics  

**Q: How to improve query performance?**  
A: Use sort keys, distribution styles, materialized views, result cache  

**Q: How does Redshift integrate with Glue?**  
A: Uses Glue Data Catalog for Spectrum external schemas/tables  

---

You're now Redshift-ready 🔥  
