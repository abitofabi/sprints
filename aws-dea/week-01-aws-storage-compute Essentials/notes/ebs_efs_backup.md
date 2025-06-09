# 📦 AWS Storage – Part 2: EBS, EFS & AWS Backup

---

## 🧊 EBS (Elastic Block Store)
### 📌 Key Concepts:
- **Block-level storage** for EC2 instances.
- Works like a virtual hard drive (SSD or HDD).
- **Tightly coupled** with one EC2 at a time.
- gp2 IO increase if size increase , gp3 decoupled
- to move to another AZ take snapshots
- if instance terminated this will be still available

### 🔸 Volume Types:
| Type | Use Case | Performance |
|------|----------|-------------|
| gp3 (General Purpose SSD) | Most workloads | Balanced cost/perf |
| io1/io2 | High IOPS needs (DBs) | Expensive, predictable |
| st1 (Throughput HDD) | Big data, logs | High throughput |
| sc1 (Cold HDD) | Archival | Lowest cost |

### 🔐 Features:
- **Snapshots** (incremental backups to S3)
- **Encryption** at rest using KMS
- **Resizing** volumes without downtime

---

## 🗃️ EFS (Elastic File System)
### 📌 Key Concepts:
- **File-level storage**, scalable across **multiple EC2s**.
- Supports NFS protocol.
- Grows & shrinks automatically – **pay per use**.
- only for linux (POSIX)

### 🔸 Use Cases:
- Shared access for apps on multiple servers.
- Machine learning data input.
- CMS/WordPress hosting.

### 🔐 Features:
- **Lifecycle management** (move to IA)
- **Access points** (user/group permissions)
- **Encryption** at rest and in transit
- **Mount targets** in VPC subnets

---

## 🛡️ AWS Backup
### 📌 Key Concepts:
- Centralized **backup management** service.
- Supports **EBS, EFS, RDS, DynamoDB, S3, Aurora**, etc.

### 🔸 Features:
- **Backup vaults** for secure storage
- **Backup plans & schedules**
- **Cross-region backup** support
- **Compliance reports** & monitoring

---

## 📌 EBS vs EFS Summary

| Feature | EBS | EFS |
|--------|-----|-----|
| Storage Type | Block | File |
| Multi-Instance Access | ❌ No | ✅ Yes |
| Use Case | One EC2 | Shared across EC2s |
| Pricing | Fixed provisioned | Auto-scale, pay-per-use |
| Protocol | — | NFS |

---

## ✅ Hands-on Done:
- Created and attached EBS volumes in EC2
- Explored volume snapshots
- Created EFS file system, added mount targets
- Configured AWS Backup with a test EBS backup plan

---
## 🧠 TL;DR
| Feature         | Think of it like...                                |
|-----------------|----------------------------------------------------|
|EBS              | Private USB stick                                  |
|EFS              | Shared Google Drive                                |
|AWS Backup       | Magic time-travel folder that saves all your stuff |
