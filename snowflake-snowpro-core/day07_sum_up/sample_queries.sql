-- Streams Example
CREATE OR REPLACE STREAM customer_changes_stream ON TABLE customers;

-- Append-only Stream
CREATE OR REPLACE STREAM new_orders_append_only_stream 
ON TABLE orders 
APPEND_ONLY = TRUE;

-- Snowpipe creation
CREATE OR REPLACE PIPE my_pipe 
AS COPY INTO my_table 
FROM @my_stage;

-- Task for transformation
CREATE OR REPLACE TASK daily_sales_summary
WAREHOUSE = my_wh
SCHEDULE = '1 DAY'
AS
INSERT INTO sales_summary
SELECT region, SUM(sales) FROM sales GROUP BY region;

-- Task tree structure (chained tasks)
CREATE OR REPLACE TASK task_root
SCHEDULE = 'USING CRON 0 * * * * UTC'
AS
-- base transformation logic

CREATE OR REPLACE TASK task_child
AFTER task_root
AS
-- next level processing logic

-- Role privileges for data sharing
GRANT USAGE ON DATABASE shared_db TO ROLE consumer_role;
GRANT SELECT ON TABLE shared_db.sales TO ROLE consumer_role;
