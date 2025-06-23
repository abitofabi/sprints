# ❄️ Snowflake Sprint Notes – Day X
🗓️ Topics: Tasks, Unstructured Data Loading, Performance Optimization, Fail-safe, Table Types, Zero Copy Cloning

---

## ✅ 1. Task Scheduling in Snowflake

### 🔹 Purpose
- Automate SQL execution on a defined schedule or based on dependencies.
- Commonly used in data pipelines with Streams for CDC.

### 🔹 Syntax
```sql
CREATE OR REPLACE TASK my_task
  WAREHOUSE = my_wh
  SCHEDULE = '1 MINUTE'
AS
  INSERT INTO target_table SELECT * FROM source_table;
```

### 🔹 Task Lifecycle
- **Suspended by default** on creation — activate with:
```sql
ALTER TASK my_task RESUME;
```
- **Manual Execution:**
```sql
EXECUTE TASK my_task;
```
- **View history:**
```sql
SELECT * FROM TASK_HISTORY();
```

### 🔹 Task with Stream (Typical Pattern)
```sql
CREATE OR REPLACE TASK my_cdc_task
  WAREHOUSE = my_wh
  SCHEDULE = '5 MINUTE'
AS
  INSERT INTO target_table
  SELECT * FROM stream_table WHERE METADATA$ACTION = 'INSERT';
```

---

## ✅ 2. Loading Unstructured Data (JSON / PARQUET)

### 🔹 JSON Load
```sql
CREATE FILE FORMAT my_json_format TYPE = 'JSON';
CREATE STAGE my_stage FILE_FORMAT = my_json_format;
COPY INTO my_table FROM @my_stage FILE_FORMAT = (TYPE = JSON);
```

### 🔹 PARQUET Load
```sql
CREATE FILE FORMAT my_parquet_format TYPE = 'PARQUET';
COPY INTO my_table FROM @my_stage FILE_FORMAT = (TYPE = PARQUET);
```

- Use `VARIANT` for semi-structured columns
- Use `FLATTEN()` and `:field` notation to extract JSON elements
- `AUTO_DETECT = TRUE` enables schema inference

---

## ✅ 3. Performance Optimization

- **Caching**: Metadata, Result, and Data Caches for faster query returns.
- **Clustering**: Use `CLUSTER BY` to improve performance on large datasets.
- **Auto Suspend/Resume**: Save compute credits with warehouse settings.
- **Warehouse Sizing**: Adjust based on query concurrency and load.
- **Monitoring**: Use `QUERY_HISTORY()` and `WAREHOUSE_LOAD_HISTORY()`.

---

## ✅ 4. Fail-safe

- **7-day period** after Time Travel for Snowflake-managed disaster recovery
- **Only available to Snowflake support** — not end-users
- **Applies to Permanent tables only**
- Still incurs storage cost during Fail-safe period

---

## ✅ 5. Table Types in Snowflake

| Type        | Session Scope | Time Travel | Fail-safe | Typical Use Case |
|-------------|---------------|-------------|-----------|------------------|
| Permanent   | ❌            | ✅          | ✅        | Default for production tables |
| Transient   | ❌            | ✅          | ❌        | Cost-effective, short-lived data |
| Temporary   | ✅            | ❌          | ❌        | Scratchpad for session-only use |

---

## ✅ 6. Zero-Copy Cloning

### 🔹 Command
```sql
CREATE TABLE new_table CLONE original_table;
```

### 🔹 Key Points
- Instant creation using shared metadata and copy-on-write
- Works on tables, schemas, and databases
- Modifications are independent after clone
- Original can be dropped safely after cloning

---
## 🌳 Tree-Structured Tasks in Snowflake

### 🧠 What Are They?
- A **task tree** is a hierarchy of tasks where:
  - One task (the **root**) starts execution
  - It **triggers child tasks**, which in turn may trigger their own children
- Enables orchestration of **multi-step data pipelines**.

---

### 🧱 Example Structure

```
          root_task
         /         \
   task_child1    task_child2
                    |
                task_grandchild
```

---

### ✅ Step-by-Step Creation

#### Step 1: Create the Root Task
```sql
CREATE OR REPLACE TASK root_task
  WAREHOUSE = my_wh
  SCHEDULE = '5 MINUTE'
AS
  CALL load_stage_data();
```

#### Step 2: Create Child Tasks
```sql
CREATE OR REPLACE TASK task_child1
  WAREHOUSE = my_wh
  AFTER root_task
AS
  CALL clean_raw_data();
```

```sql
CREATE OR REPLACE TASK task_child2
  WAREHOUSE = my_wh
  AFTER root_task
AS
  CALL transform_cleaned_data();
```

#### Step 3: Create Grandchild Task
```sql
CREATE OR REPLACE TASK task_grandchild
  WAREHOUSE = my_wh
  AFTER task_child2
AS
  CALL generate_final_report();
```

---

### 🚀 Execution Behavior
- `root_task` triggers execution of children when scheduled or manually executed.
- Tasks run top-down, respecting dependencies.
- **All tasks must be resumed** to participate in execution.

---

### 🧼 Best Practices

| Tip                          | Why                                               |
|------------------------------|----------------------------------------------------|
| Use `CALL` for stored procs  | Clean, modular logic in tasks                    |
| Use `AFTER` to set sequence  | Builds clear dependency trees                    |
| Resume all tasks             | Tasks are suspended on creation                  |
| Avoid circular dependencies  | Snowflake won't allow cycles                     |

---

### 🔎 Monitoring Tools

```sql
-- View task dependencies
SELECT * FROM TABLE(INFORMATION_SCHEMA.TASK_DEPENDENTS('root_task'));

-- View task execution history
SELECT * FROM TABLE(INFORMATION_SCHEMA.TASK_HISTORY())
ORDER BY SCHEDULED_TIME DESC;
```

---
