---

## 🧪 Redshift Sample Queries

---

### 📥 COPY Command – Load data from S3
```sql
COPY sales
FROM 's3://my-bucket/sales-data.csv'
IAM_ROLE 'arn:aws:iam::1234567890:role/MyRedshiftRole'
CSV IGNOREHEADER 1;
```

---

### 📤 UNLOAD Command – Export query results to S3
```sql
UNLOAD ('SELECT * FROM sales WHERE year = 2025')
TO 's3://my-bucket/output/sales_2025_'
IAM_ROLE 'arn:aws:iam::1234567890:role/MyRedshiftRole'
PARALLEL OFF
FORMAT AS PARQUET;
```

---

### 📊 Create External Table – Redshift Spectrum (S3 query)
```sql
CREATE EXTERNAL SCHEMA spectrum_schema
FROM DATA CATALOG
DATABASE 'my_glue_db'
IAM_ROLE 'arn:aws:iam::1234567890:role/MyRedshiftRole'
CREATE EXTERNAL DATABASE IF NOT EXISTS;

CREATE EXTERNAL TABLE spectrum_schema.clickstream_logs (
  user_id STRING,
  event_time TIMESTAMP,
  url STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
LOCATION 's3://my-logs-bucket/clickstream/';
```

---

### 📐 Create Table with Sort Key and Distribution Key
```sql
CREATE TABLE sales_facts (
  sales_id INT,
  product_id INT,
  quantity INT,
  sale_date DATE
)
DISTKEY (product_id)
SORTKEY (sale_date);
```

---

### 🧱 Materialized View
```sql
CREATE MATERIALIZED VIEW top_customers AS
SELECT customer_id, SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC;
```

---

### ⚙️ CTAS – Create Table As Select
```sql
CREATE TABLE top_products AS
SELECT product_id, COUNT(*) AS orders
FROM sales
GROUP BY product_id
ORDER BY orders DESC;
```

---

### 🤖 Redshift ML – Train Model using SQL
```sql
CREATE MODEL churn_prediction
FROM (SELECT * FROM customers)
TARGET churn
FUNCTION 'binary_classification'
IAM_ROLE 'arn:aws:iam::1234567890:role/MyRedshiftMLRole';
```

---

### ⏳ Analyze Compression
```sql
ANALYZE COMPRESSION sales_facts;
```

---

### 🔍 Federated Query from RDS/Aurora
```sql
CREATE EXTERNAL SCHEMA rds_schema
FROM POSTGRES
DATABASE 'mydb'
URI 'my-rds-instance.abcdefg.us-east-1.rds.amazonaws.com'
IAM_ROLE 'arn:aws:iam::1234567890:role/MyRedshiftRole'
SECRET_ARN 'arn:aws:secretsmanager:...';
```

---

## 🎯 Pro Tips

- Always use `DISTKEY` and `SORTKEY` based on access/query patterns  
- Redshift Spectrum = seamless querying on S3  
- Redshift ML helps build ML models using SQL (great for predictions in-place)  
- Use materialized views for repeat-heavy queries  

---

Let me know if you want:
- A real-world pipeline example (S3 → Glue → Redshift → QuickSight)  
- Troubleshooting COPY/UNLOAD issues  
- Spectrum partitioned tables  
- Practice Q&A set  
