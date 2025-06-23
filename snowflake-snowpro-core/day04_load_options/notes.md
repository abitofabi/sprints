### Load Options 

COPY INTO 
FROM
----
1) FILE_FORMAT (TYPE = <TYPE> , FIELD_DELIMITER = '' , SKIP_HEADER=1
2) VALIDATION_MODE = RETURN_ERRORS / RETURN_N_ROWS
3) TRUNCATECOLUMNS = TRUE
4) SIZE_LIMIT = <SZIENUMBER>
5) RETURN_FAILED_ONLY=TRUE
6) FORCE = TRUE (copies/overwrites even if already added /duplicates

For history
SELECT * FROM <DB>.information_schema.load_history;
