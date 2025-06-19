# 🧊 SnowPro Sprint – Day 2 Notes

## 📘 Topics Covered:
- Data Loading & Unloading
- Stages & File Formats
- COPY INTO
- Snowflake Marketplace

---

## 🧠 Key Concepts:

### 📥 Data Loading
- External stages: AWS S3, GCS, Azure
- File formats: CSV, JSON, PARQUET
- Commands:
  ```sql
  CREATE FILE FORMAT my_csv_format TYPE = 'CSV';
  CREATE STAGE my_stage URL = 's3://mybucket/data/' FILE_FORMAT = my_csv_format;
  COPY INTO my_table FROM @my_stage;
  ```
### 📤 Data Unloading
#### Exporting data to cloud:

```sql
COPY INTO @my_stage FROM my_table;
```

### 🛍️ Snowflake Marketplace
#### Explore datasets published by 3rd parties

Read-only access, cannot modify shared datasets

Try querying:
```sql
SELECT * FROM "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."CUSTOMER";
```
