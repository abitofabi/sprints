-- Load CSV file into table
COPY INTO my_table
FROM @my_stage/myfile.csv
FILE_FORMAT = (TYPE = 'CSV');

-- Unload data to cloud
COPY INTO @my_stage/output_ FROM my_table;

-- JSON load format example
CREATE FILE FORMAT my_json_format TYPE = 'JSON';
