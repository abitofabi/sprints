-- Create role and user
CREATE ROLE analyst_role;
CREATE USER abinaya PASSWORD='StrongPwd!' DEFAULT_ROLE=analyst_role;
GRANT ROLE analyst_role TO USER abinaya;

-- Grant usage on warehouse
GRANT USAGE ON WAREHOUSE my_wh TO ROLE analyst_role;

-- create resource monitor 
CREATE RESOURCE MONITOR my_monitor
WITH CREDIT_QUOTA = 100
TRIGGERS ON 80 PERCENT DO NOTIFY
ON 100 PERCENT DO SUSPEND;

-- Create table with VARIANT
CREATE TABLE json_table (data VARIANT);

-- Query nested JSON
SELECT data:id::STRING, data:rating FROM json_table;

-- Flatten array
SELECT value FROM json_table, LATERAL FLATTEN(input => data:genres);
