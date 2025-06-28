# ❄️ Snowflake Sprint Notes – Day 6 (Full Theory + SQL)
🗓️ Topics: Time Travel, Snowpipe, Data Masking, Materialized Views, Data Sampling

---

## 1. 🕰️ Time Travel

**Definition**:  
Time Travel allows you to access historical data (queries, clone, restore dropped objects) from a specific point in time.

- **Default retention**: 1 day
- **Max retention**: 90 days (Enterprise Edition)
- **Applies to**: Tables, schemas, and databases
- Can be used for:
  - Accident recovery
  - Cloning past versions
  - Auditing changes

### 🔹 Sample Queries
```sql
-- View data as it existed 1 hour ago
SELECT * FROM orders AT (OFFSET => -3600);

-- Restore a dropped table
UNDROP TABLE orders;

-- Clone a table at a past timestamp
CREATE TABLE orders_clone CLONE orders AT (TIMESTAMP => '2024-06-26 12:00:00');
```

---

## 2. 🚀 Snowpipe

**Definition**:  
Snowpipe is Snowflake’s continuous data ingestion service for loading data in near real-time.

- Loads data as soon as it lands in cloud storage
- Uses metadata tracking to avoid duplicate loads
- Supports:
  - Manual load via REST API
  - Auto-ingest using event notifications from AWS S3, GCS, or Azure

### 🔹 Sample Query
```sql
CREATE OR REPLACE PIPE my_pipe
  AUTO_INGEST = TRUE
  AS
  COPY INTO raw_data
  FROM @my_stage
  FILE_FORMAT = (TYPE = 'CSV');
```

---

## 3. 🛡️ Data Masking

**Definition**:  
Masking policies allow column-level data protection based on user role.

- Uses `CURRENT_ROLE()` in logic
- Policies are applied directly to columns
- Even `ACCOUNTADMIN` cannot see real data unless explicitly allowed by logic

### 🔹 Example Masking Policy
```sql
CREATE MASKING POLICY ssn_mask AS (val STRING) RETURNS STRING ->
  CASE
    WHEN CURRENT_ROLE() = 'HR_VIEWER' THEN val
    ELSE 'XXX-XX-XXXX'
  END;
```

### 🔹 Apply to a column
```sql
ALTER TABLE employees
MODIFY COLUMN ssn
SET MASKING POLICY ssn_mask;
```

---

## 4. 🧮 Materialized Views

**Definition**:  
Materialized Views (MViews) are precomputed views that store the result of a query physically and refresh automatically when data changes.

- Boosts performance for repeat queries
- Uses storage and compute resources
- Cannot include joins, sequences, UDFs, or external tables

### 🔹 Sample Query
```sql
CREATE MATERIALIZED VIEW top_customers_mv AS
SELECT customer_id, SUM(amount) AS total_spent
FROM sales
GROUP BY customer_id;
```

---

## 5. 🔍 Data Sampling

**Definition**:  
Sampling retrieves a subset of rows from a table — useful for testing or exploring large datasets.

- Methods: `SAMPLE`, `SYSTEM`, `BERNOULLI`
- SYSTEM: Block-level sampling (faster)
- BERNOULLI: Row-level (more accurate)

### 🔹 Sample Queries
```sql
-- Simple 10% sample
SELECT * FROM sales SAMPLE (10);

-- Bernoulli sampling
SELECT * FROM sales SAMPLE BERNOULLI (25);

-- System sampling
SELECT * FROM sales SAMPLE SYSTEM (5);
```

---
