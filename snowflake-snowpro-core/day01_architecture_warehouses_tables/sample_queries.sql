-- Create a warehouse
CREATE WAREHOUSE my_wh WITH WAREHOUSE_SIZE = 'XSMALL' AUTO_SUSPEND = 60;

-- Create database and schema
CREATE DATABASE movies_db;
CREATE SCHEMA tamil_schema;

-- Create different table types
CREATE TABLE permanent_table (id INT, name STRING);
CREATE TEMPORARY TABLE temp_table (id INT);
CREATE TRANSIENT TABLE trans_table (id INT);
