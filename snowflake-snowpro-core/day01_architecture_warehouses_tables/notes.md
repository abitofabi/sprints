# 🧊 SnowPro Sprint – Day 1 Notes

## 📘 Topics Covered:
- Snowflake Architecture
- Virtual Warehouses
- Databases & Schemas
- Tables (Permanent, Temporary, Transient)

---

## 🧠 Key Concepts:

### ❄️ Snowflake Architecture
- Multi-cluster shared data architecture
- Separation of compute (Virtual Warehouses) and storage
- Three layers: Database Storage, Query Processing, Cloud Services

### ⚙️ Virtual Warehouses
- Independent compute clusters
- Can auto-scale (multi-cluster)
- Can suspend/resume to save costs
- Warehouses consume credits (billed per second)

### 🗂️ Databases & Schemas
- Logical storage units
- A schema groups tables, views, and other objects
- Commands:
  ```sql
  CREATE DATABASE my_db;
  CREATE SCHEMA my_schema;
  ```
 ### 📦 Table Types
- Permanent – default, persists data
- Temporary – lives during session
- Transient – no Fail-safe, cheaper
