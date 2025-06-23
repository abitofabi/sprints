-- =========================
-- 1. Task Scheduling Example
-- =========================
CREATE OR REPLACE TASK my_task
  WAREHOUSE = my_wh
  SCHEDULE = '5 MINUTE'
AS
  INSERT INTO target_table SELECT * FROM source_table;

ALTER TASK my_task RESUME;

-- To execute manually:
-- EXECUTE TASK my_task;

-- =========================
-- 2. Loading JSON Data Example
-- =========================
CREATE FILE FORMAT my_json_format TYPE = 'JSON';

CREATE OR REPLACE STAGE my_stage FILE_FORMAT = my_json_format;

COPY INTO my_table
FROM @my_stage
FILE_FORMAT = (TYPE = 'JSON');

-- =========================
-- 3. Loading Parquet Data Example
-- =========================
CREATE FILE FORMAT my_parquet_format TYPE = 'PARQUET';

COPY INTO my_table
FROM @my_stage
FILE_FORMAT = (TYPE = 'PARQUET');

-- =========================
-- 4. Performance Optimization Example: Clustering
-- =========================
CREATE TABLE my_table (
  id INT,
  name STRING,
  customer_id INT
)
CLUSTER BY (customer_id);

-- =========================
-- 5. Fail-safe Explanation (no SQL, just note)
-- =========================
-- Fail-safe is a Snowflake-managed 7-day recovery period after Time Travel.
-- Applies only to permanent tables and is not user-accessible.

-- =========================
-- 6. Table Types Quick Example
-- =========================
-- Permanent Table
CREATE TABLE permanent_table (
  id INT,
  data STRING
);

-- Transient Table
CREATE TRANSIENT TABLE transient_table (
  id INT,
  data STRING
);

-- Temporary Table
CREATE TEMPORARY TABLE temp_table (
  id INT,
  data STRING
);

-- =========================
-- 7. Zero-Copy Cloning Example
-- =========================
CREATE TABLE new_table CLONE original_table;

-- Original table can be dropped safely without affecting the clone.
