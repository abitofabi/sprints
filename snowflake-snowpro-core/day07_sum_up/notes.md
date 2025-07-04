# SnowPro Core – Day 7 Notes

## ✅ Streams in Snowflake

- Streams use **offset tracking** internally to record changes to source objects.
- **Staleness** occurs when the stream offset is no longer within the table’s Time Travel window.
- A **stale stream** cannot query changes; you must recreate it.
- Streams only track the **latest version** of a modified row (not every change).
- Use **append-only streams** to track only INSERT operations (less overhead).

## ✅ Snowpipe vs Tasks

| Feature        | Snowpipe                          | Tasks                               |
|----------------|-----------------------------------|--------------------------------------|
| Triggering     | Auto-triggered (event-based)      | Scheduled or conditional             |
| Use Case       | Continuous Data Ingestion         | Post-processing/Transformations      |
| Cost Behavior  | Per-file ingestion cost           | Depends on virtual warehouse usage   |

- Snowpipe is ideal for **real-time ingestion**.
- Tasks are great for **scheduled logic or chaining transformations**.
- Use Streams + Tasks for **end-to-end ELT** pipelines.

## ✅ ETL vs ELT

- Snowflake favors **ELT**:
  - Load raw data first using Snowpipe or COPY.
  - Use SQL or Tasks to transform later.
- ELT is cost-effective due to **separate compute-storage model**.

## ✅ Exam Preparation Tips

- Syntax knowledge: understand structure & usage.
- Know:
  - Table types
  - Stream behavior
  - Role-based access control
  - Data loading/unloading stages
  - Snowpipe, Tasks, Time Travel, Fail-safe
- Cheat sheet helps with quick recall during revision.

## ✅ Data Sharing Summary

- **Share**: A named object created by data providers.
- Reader Account:
  - Compute billed to provider.
  - Can only access **secure objects**.
- Regular Account:
  - Consumer pays compute cost.
  - Can access both secure and standard views.

## 🧠 Key Concepts

- **Staleness in Stream**: Happens when retention period is exceeded.
- **Secure View**: Obscures SQL logic; ideal for sharing.
- **Fail-safe**: 7-day non-configurable backup (for enterprise).
- **Append-Only Streams**: Use when DELETE/UPDATE are not needed.
