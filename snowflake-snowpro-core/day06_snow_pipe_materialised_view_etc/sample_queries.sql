-- ============================
-- 1. 🕰️ Time Travel
-- ============================

-- Query data as it existed 1 hour ago
SELECT * FROM orders AT (OFFSET => -3600);

-- Restore a dropped table
UNDROP TABLE orders;

-- Clone table as it existed at a specific timestamp
CREATE TABLE orders_clone CLONE orders 
AT (TIMESTAMP => '2024-06-26 12:00:00');



-- ============================
-- 2. 🚀 Snowpipe
-- ============================

-- Create Snowpipe with auto-ingest enabled
CREATE OR REPLACE PIPE my_pipe
  AUTO_INGEST = TRUE
  AS
  COPY INTO raw_data
  FROM @my_stage
  FILE_FORMAT = (TYPE = 'CSV');



-- ============================
-- 3. 🛡️ Data Masking
-- ============================

-- Create a masking policy
CREATE OR REPLACE MASKING POLICY ssn_mask AS (val STRING) RETURNS STRING ->
  CASE
    WHEN CURRENT_ROLE() = 'HR_VIEWER' THEN val
    ELSE 'XXX-XX-XXXX'
  END;

-- Apply the masking policy to a column
ALTER TABLE employees
MODIFY COLUMN ssn
SET MASKING POLICY ssn_mask;



-- ============================
