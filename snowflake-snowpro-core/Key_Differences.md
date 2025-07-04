# ⚖️ Snowflake – Key Differences 

---

## ✅ Streams vs Materialized Views

| Feature                | Streams                                 | Materialized Views                      |
|------------------------|------------------------------------------|------------------------------------------|
| Purpose                | Track **data changes** in a table        | Store **precomputed** query results      |
| Refresh Type           | Manual (via query)                       | Automatic (managed by Snowflake)         |
| Use Case               | CDC, ELT triggers                        | Fast SELECTs on complex logic            |
| Storage Impact         | Minimal                                  | Consumes storage                         |
| Row History            | Tracks latest change per row             | Doesn’t track changes                    |
| Query Type             | SELECT from stream to get changes        | SELECT from materialized view directly   |

---

## ✅ Tasks vs Snowpipe

| Feature                | Tasks                                      | Snowpipe                                |
|------------------------|---------------------------------------------|------------------------------------------|
| Execution Trigger      | **Scheduled or Conditional**               | **Event-driven or Manual**               |
| Purpose                | Run SQL logic, transformations             | Load data into Snowflake                 |
| Granularity            | SQL processing tasks                       | Data ingestion from stage                |
| Frequency              | Min 1-minute schedule                      | Near real-time via auto ingestion        |
| Uses Streams?          | Yes, often paired                          | No, unless combined                      |

---

## ✅ Transient vs Temporary vs Permanent Tables

| Feature         | Permanent Table     | Transient Table     | Temporary Table     |
|-----------------|----------------------|----------------------|----------------------|
| Metadata Retention | Full (Time Travel + Fail-safe) | Time Travel only       | Session only         |
| Fail-safe       | ✅ Yes (7 days, Enterprise) | ❌ No                 | ❌ No                 |
| Persistence     | Survives sessions    | Survives sessions    | Auto-drops after session |
| Ideal For       | Prod data            | Staging/intermediate | Scratchpad/temp work  |

---

## ✅ Snowpipe vs COPY INTO

| Feature         | Snowpipe                      | COPY INTO                       |
|-----------------|-------------------------------|----------------------------------|
| Triggering      | **Auto** (event-based)        | **Manual** (run as needed)       |
| Monitoring      | PIPE_USAGE_HISTORY            | Query History                    |
| Use Case        | Frequent ingestion            | Bulk or one-time loads           |
| Cost            | Per file ingested             | Per execution (based on compute) |

---

## ✅ ETL vs ELT in Snowflake

| Aspect          | ETL                           | ELT (Snowflake Preferred)       |
|-----------------|-------------------------------|----------------------------------|
| Transformation  | Before loading                | After loading (inside Snowflake) |
| Speed           | Slower for large data         | Faster (leverage Snowflake compute) |
| Use Case        | Legacy pipelines              | Cloud-native pipelines           |

---

## ✅ Secure View vs Regular View

| Feature         | Secure View                  | Regular View                    |
|-----------------|------------------------------|----------------------------------|
| SQL Visibility  | Hidden from consumers         | Visible                          |
| Data Sharing    | Safe for Reader Account       | Not recommended to share         |
| Syntax          | `CREATE SECURE VIEW ...`     | `CREATE VIEW ...`                |

---

## ✅ Reader Account vs Regular Consumer Account

| Feature              | Reader Account                         | Consumer Snowflake Account             |
|----------------------|----------------------------------------|----------------------------------------|
| Billing              | Provider pays compute cost             | Consumer pays their own compute        |
| Access Type          | Limited (managed by provider)          | Full-featured                          |
| Object Sharing       | Secure objects only                    | Secure + non-secure (if allowed)       |

---

## ✅ Cloning vs Copying

| Feature              | Zero-Copy Clone                        | Traditional Copy                        |
|----------------------|----------------------------------------|------------------------------------------|
| Time & Storage       | Instant + metadata only                | Slow + duplicates data                   |
| Independence         | Yes, post-modification                 | Yes                                      |
| Use Case             | Dev/Test/Backup                        | Data migration/export                    |

---

## ✅ Append-only Streams vs Default Streams

| Feature         | Append-only Stream              | Standard Stream                     |
|-----------------|----------------------------------|--------------------------------------|
| Tracks          | Only `INSERT`s                  | `INSERT`, `UPDATE`, `DELETE`         |
| Storage Cost    | Lower                           | Higher (due to full DML tracking)    |
| Use Case        | Immutable audit logs            | General change data capture          |

---

## ✅ Internal vs External Stage

| Feature         | Internal Stage                  | External Stage (S3/GCS/Azure)        |
|-----------------|----------------------------------|--------------------------------------|
| Hosted By       | Snowflake                       | Cloud storage                        |
| Auth            | No extra config                 | Needs external integration           |
| Cost            | Paid under Snowflake account    | Cost on external cloud account       |

---

## ✅ Scoped URL vs Pre-signed URL

| Feature           | Scoped URL                        | Pre-signed URL                      |
|-------------------|------------------------------------|-------------------------------------|
| Duration          | 6 hours (default)                  | Up to 7 days (more flexible)        |
| Authentication    | Scoped to session/token            | Embedded auth in URL                |
| Usage             | External stage file access         | Public-ish access for specific files|

---

Let me know if you want this grouped into a single `snowflake_cheatsheet.md` file with the theory + differences + examples all in one!
