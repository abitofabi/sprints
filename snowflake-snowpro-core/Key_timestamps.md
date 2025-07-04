# ⏳ Snowflake – Important Time Limits & Durations

---

## 🔹 24 Hours
- **Scoped URL validity**: Expires in 6 hours by default (can go up to 24 hrs)
- **Presigned URL**: Up to 7 days, but 24 hours is common default.
- **GET/PUT file access** (with scoped URL): Valid for 6–24 hours
- **Stream offset staleness check**: Depends on data retention, but if stream is queried too late (post retention), it becomes *stale*.

---

## 🔹 7 Days
- **Fail-safe (Standard)**: ❌ Not available  
- **Fail-safe (Enterprise)**: Enabled – data retained for 7 days after time travel expires  
- **Time Travel (Standard)**: Max 1 day  
- **Time Travel (Enterprise)**: Up to 90 days (default 1 day)  
- **Undrop objects**: Must be within Time Travel window

---

## 🔹 31 Days
- **Query result cache**: Retained for 31 days if underlying data is unchanged  
- **Snowpipe file load history**: Metadata retained for 14 days (configurable)

---

## 🔹 64 Days
- **Metadata retention**: Snowflake maintains metadata history of tables for 64 days even beyond Time Travel.

---

## 🔹 365 Days
- **Auto-suspend inactivity timeout**: Max 1 year (for warehouses)

---

## 🧠 Pro Tips
- **Temporary tables**: Dropped at session end – no time travel/fail-safe.
- **Transient tables**: No fail-safe, only time travel (limited)
- **Permanent tables**: Time Travel + Fail-safe
