# ☁️ AWS RDS, Aurora & ElastiCache – Study Notes

## 📘 RDS (Relational Database Service)

Amazon RDS is a managed relational database service that supports multiple engines:
- MySQL
- PostgreSQL
- MariaDB
- Oracle
- SQL Server

### 🔧 Key Features
- Managed backups, patching, and monitoring
- Supports **Multi-AZ** for HA (synchronous replication)
- Supports **Read Replicas** for scaling reads (asynchronous)
- Integrated with IAM, KMS, CloudWatch

---

### 🛡️ High Availability (Multi-AZ)
- **Synchronous replication** to a standby DB in another AZ
- Automatic failover if primary fails
- Standby is not readable

### 📈 Read Replicas
- **Asynchronous replication**
- Can scale read-heavy workloads
- Can be promoted to standalone DBs
- Available in same or cross-region

---

### 💾 Backups

| Type               | Retention | Use Case |
|--------------------|-----------|----------|
| **Automated Backup** | Up to 35 days | Disaster recovery within recent window |
| **On-Demand Snapshot** | Manual, keep forever | Long-term archival (audits, DR) ✅ |
| **Aurora Backtrack** | Rewind within seconds | Only for Aurora MySQL, short-term "undo" |
| **Aurora Cloning** | Point-in-time writable copy | Testing or dev use only, not backup ❌ |

---

## 🌟 Aurora – Amazon's Cloud-Native Relational DB

Aurora is a high-performance, fully managed relational DB built for the cloud.

### 🚀 Key Features
- Compatible with MySQL and PostgreSQL
- Up to 5x faster than standard MySQL
- **Distributed, fault-tolerant storage**
  - 6 copies of data across 3 AZs
  - Auto-healing and self-repairing
- Auto-scaling, auto-replication, auto-failover
- Supports **Aurora Global Databases** (multi-region read + disaster recovery)

### 🧬 Aurora Cloning
- Creates a copy without duplicating data
- Ideal for test/dev
- Writes to clone = stored separately
- Original changes (new or delete) do **not** affect clone

---

## 🧠 RDS vs Aurora

| Feature             | RDS                     | Aurora                    |
|---------------------|-------------------------|---------------------------|
| Engines             | 6 major DBs             | MySQL, PostgreSQL only    |
| Performance         | Standard                | Up to 5x faster           |
| Storage scaling     | Manual (EBS)            | Auto-scaled up to 128TB   |
| Replica scaling     | Limited                 | 15 Aurora Replicas        |
| HA Support          | Multi-AZ                | Built-in HA + Auto healing|
| Cost                | Lower                   | Slightly higher           |

---

## 💡 RDS Proxy – Load Balancer for DB Connections

- Manages database connections efficiently
- Helps with **Lambda/serverless apps**, high concurrency
- Automatically handles **failovers** behind the scenes
- Stores DB credentials in **Secrets Manager**

Think of it like a **load balancer for DB connections**.

---

## ⚡ ElastiCache (Redis & Memcached)

ElastiCache is an in-memory cache service that boosts app performance by storing frequently accessed data in RAM.

### 🔁 What it does:
- Stores **query results**, session data, counters, etc.
- Reduces DB load and response time
- Fully managed Redis or Memcached

---

### 🔄 Redis vs Memcached

| Feature       | Redis                           | Memcached                     |
|---------------|----------------------------------|-------------------------------|
| Data types    | Strings, lists, sets, hashes...  | Simple key-value only         |
| Persistence   | Optional (can write to disk)     | No persistence                |
| Extra features| Pub/Sub, Streams, Scripts        | None                          |
| Clustering    | Yes                              | No native clustering          |
| Use case      | Complex caching, real-time apps  | Simple caching                |

---

### ⛓️ Common Use Cases

- Caching query results from RDS
- Caching session tokens (like login info)
- Building leaderboard systems
- Real-time analytics (Redis)

---

### 🧠 Analogy

Think of Redis/Memcached as a **fridge for hot data**:
- Super fast to access
- Keeps DB relaxed
- If it's not in the fridge, fetch from the "kitchen" (DB), then store it in the fridge for next time

---

### ✅ Today’s Concepts Summary

| Concept       | Key Idea |
|---------------|----------|
| RDS           | Managed relational DB |
| Aurora        | Cloud-native, fast, self-healing RDS |
| Multi-AZ      | High availability, synchronous standby |
| Read Replica  | Scale reads, async |
| On-Demand Backup | Long-term archival ✅ |
| Aurora Clone  | Lightweight dev copy |
| RDS Proxy     | DB connection pooler/load balancer |
| ElastiCache   | In-memory cache (Redis/Memcached) |

---

> 🧠 Learn it once, apply it everywhere — these services appear across **system design, certification, and interviews**.

---

## 🔐 RDS Security

| Layer         | Protection |
|---------------|------------|
| **IAM Policies** | Control who can create/manage RDS resources |
| **Security Groups (SGs)** | Controls which IPs/instances can connect to the DB |
| **KMS Encryption** | Encrypts data at rest (RDS storage, snapshots, logs) |
| **SSL/TLS**   | Encrypts data in transit (use RDS-provided certificates) |
| **Secrets Manager** | Store DB credentials securely instead of hardcoding |

> 🧠 RDS encrypts snapshots, replicas, backups **if the source DB is encrypted**.

---

## 🧰 RDS Custom

- Special flavor of RDS for workloads that require **custom OS-level configurations** or **legacy applications**
- Provides full **OS-level access** (like EC2 + RDS hybrid)
- Still managed by AWS, but **you are responsible** for patching and maintenance

🧠 Use RDS Custom when:
- You need to install **third-party agents/tools**
- You run **custom monitoring/security software**
- You want RDS benefits but with more control

---

## 🌐 Babelfish for Aurora PostgreSQL

- Lets **SQL Server applications talk to Aurora PostgreSQL** without changing app code
- Supports **T-SQL**, SQL Server protocol (Tabular Data Stream)
- Helps migrate off Microsoft SQL Server easily

> Think of it like an **SQL Server language translator** inside Aurora Postgres.

🧠 Example use:
- Legacy .NET/enterprise apps using SQL Server can move to Aurora without full rewrite.

---

## 📊 RDS Performance Insights

- Tool to monitor and troubleshoot query performance
- Visualizes top queries, wait time, CPU usage
- 7-day free retention (more with paid)
- Supports RDS + Aurora (Postgres, MySQL, Oracle, MariaDB)

> Enable it during DB creation or modify later → see bottlenecks instantly!

---

## ✅ Security & Extras Summary

| Feature           | Purpose |
|-------------------|---------|
| IAM, SG, SSL      | Protect access and data |
| KMS               | Encrypts at rest |
| Secrets Manager   | Secure credential store |
| RDS Custom        | Deep control + OS-level access |
| Babelfish         | SQL Server to Aurora Postgres |
| Performance Insights | Query & DB tuning view |
