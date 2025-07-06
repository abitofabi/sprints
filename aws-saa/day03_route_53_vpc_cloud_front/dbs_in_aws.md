# 🗄️ Databases in AWS – Overview for SAA Exam

---

## 🧠 Key Categories

| Category             | Services                      |
|----------------------|-------------------------------|
| **Relational (SQL)** | RDS, Aurora, RDS Custom       |
| **Key-Value / NoSQL**| DynamoDB                      |
| **Document**         | DocumentDB, DynamoDB          |
| **In-Memory**        | ElastiCache (Redis, Memcached)|
| **Analytics / OLAP** | Redshift                      |
| **Graph**            | Neptune                       |
| **Ledger**           | QLDB                          |
| **Time Series**      | Timestream                    |
| **Cassandra**        | Keyspaces                     |
|Object storage (key-value, flat namespace) | S3        |
---

## 🧮 1. Relational Databases (SQL)

| Service     | Description                              | Use Case                          |
|-------------|------------------------------------------|-----------------------------------|
| **RDS**     | Managed relational DB with engines like MySQL, PostgreSQL, SQL Server, Oracle | Traditional apps, migrations     |
| **Aurora**  | AWS-built, high-perf compatible with MySQL/PostgreSQL | Modern, high-scale apps          |
| **RDS Custom** | Gives root OS access for legacy/custom workloads | Oracle license-bound apps        |

> 🧪 Exam Tip: RDS = Standard SQL; Aurora = Cloud-native SQL with better perf

---

## 🧾 2. NoSQL / Key-Value Stores

| Service     | Description                      | Use Case                           |
|-------------|----------------------------------|------------------------------------|
| **DynamoDB**| Serverless, millisecond latency  | Shopping carts, game states, IoT  |

> Supports auto scaling, TTL, streams, DAX cache  
> Ideal for **event-driven**, **high throughput**, and **predictable latency**

---

## 📄 3. Document Databases

| Service        | Description                        | Use Case                          |
|----------------|------------------------------------|-----------------------------------|
| **DocumentDB** | MongoDB-compatible document store  | JSON-heavy apps, content systems  |
| **DynamoDB**   | Also supports document-style JSON  | Lightweight doc structures        |

---

## 💥 4. In-Memory Databases

| Service       | Description                        | Use Case                          |
|---------------|------------------------------------|-----------------------------------|
| **ElastiCache**| Redis / Memcached, ultra-low latency | Leaderboards, caching, session mgmt |

> Redis supports persistence + pub/sub  
> Memcached is simpler and stateless

---

## 📊 5. Analytics / OLAP (Read-heavy)

| Service     | Description                        | Use Case                           |
|-------------|------------------------------------|------------------------------------|
| **Redshift**| Petabyte-scale data warehouse      | BI tools, dashboards, aggregates   |

> Columnar store optimized for **analytical queries**, not transactions

---

## 🧬 6. Graph Database

| Service    | Description               | Use Case                          |
|------------|---------------------------|-----------------------------------|
| **Neptune**| Stores relationships using Gremlin/SPARQL | Social networks, recommendations  |

---

## 📜 7. Ledger Database

| Service   | Description                        | Use Case                         |
|-----------|------------------------------------|----------------------------------|
| **QLDB**  | Immutable, cryptographically verifiable ledger | Financial systems, audit logs  |

---

## 🕒 8. Time Series DB

| Service      | Description                      | Use Case                          |
|--------------|----------------------------------|-----------------------------------|
| **Timestream**| Purpose-built for time-stamped data | IoT sensors, telemetry, metrics  |

## 🕒 9. Wide Column / Cassandra-style DB

| Service      | Description                      | Use Case                          |
|--------------|----------------------------------|-----------------------------------|
| **Amazon Keyspaces**| Managed Cassandra-compatible wide-column DB | Time-series apps, telemetry, logs  |

- Fully managed, serverless, and compatible with Apache Cassandra CQL
- Scales automatically for millions of writes per second
- Great for IoT telemetry, recommendation engines, event data

## 🕒 10. Object Storage / Data Lake

| Service      | Description                      | Use Case                          |
|--------------|----------------------------------|-----------------------------------|
| **S3**| Object storage (key-value, flat namespace) | Data lake, backups, logs, static files  |

---

## 🧠 When to Use What (Cheat Table)

| Requirement                        | Choose This                     |
|------------------------------------|---------------------------------|
| Traditional SQL                   | RDS                              |
| Cloud-native SQL                  | Aurora                           |
| High speed + NoSQL                | DynamoDB                         |
| Document-oriented (MongoDB)       | DocumentDB                       |
| Cache / Session Store             | ElastiCache (Redis)              |
| Analytics at scale (BI/OLAP)      | Redshift                         |
| Time-stamped data (IoT/metrics)   | Timestream                       |
| Ledger with audit trail           | QLDB                             |
| Relationship-heavy queries        | Neptune                          |
|Wide-column schema (Cassandra)	    | Keyspaces                        |
|Object storage (key-value, flat namespace) | S3                       |
---

## 🔐 Exam Tricky Areas

- **DynamoDB** is serverless, autoscaling, and supports **TTL + Streams**
- **Aurora** is **MySQL/PostgreSQL compatible** and **auto-replicates across 3 AZs**
- **Redshift** is **not transactional** — it’s for analytics
- **ElastiCache Redis** supports **persistence**, **pub/sub**, and is **multi-AZ**
- **RDS** Multi-AZ = HA (sync replica); Read Replica = Scaling (async)
- **Neptune** ≠ DocumentDB. Neptune = **Graph**

---

