# ☁️ On-Premises to AWS – Key Data Transfer Services Compared

Here's a quick overview of AWS services used to **connect or transfer data** between **on-premises** environments and **AWS**.

---

## 🔗 1. AWS Direct Connect

- **Purpose**: Dedicated, private, high-speed connection from your on-premises data center to AWS.
- **Use Case**: Low-latency, high-throughput workloads. Often used by large enterprises.
- **Replaces**: Public internet for connectivity.
- **Does NOT move files** — just a **pipe**.

---

## 🚛 2. AWS DataSync

- **Purpose**: Fast, automated **file transfer** between on-prem and AWS (S3, EFS, FSx).
- **Use Case**: Migrate file shares, periodic syncs, backup jobs.
- **Supports**: Encryption, incremental syncs, scheduling.
- **Network**: Over **public internet or Direct Connect**.

---

## 🛫 3. AWS Database Migration Service (DMS)

- **Purpose**: Migrate **databases** (e.g., Oracle, MySQL, PostgreSQL) from on-prem or cloud to AWS (RDS or Aurora).
- **Use Case**: Schema + data migration, ongoing replication.
- **Supports**: Homogeneous and heterogeneous DB engines.
- **Not for files or VMs** — only **structured DB data**.

---

## 🌐 4. Internet Gateway

- **Purpose**: Enables **internet access** for resources in public subnets (like EC2).
- **Use Case**: Allow VPC resources to access or be accessed via the internet.
- **Not for data transfer**, just **connectivity**.

---

## 🧰 5. AWS Storage Gateway

- **Purpose**: Seamlessly connect **on-premises apps** to cloud storage.
- **Use Case**: Local caching + cloud tiering.
- **Types**:
  - **File Gateway**: For file-based apps (NFS/SMB → S3).
  - **Tape Gateway**: For backup solutions.
  - **Volume Gateway**: Block storage that backs up to S3.

---

## 📦 6. AWS Snow Family (Snowcone, Snowball, Snowmobile)

- **Purpose**: **Physical data transfer** appliances for **huge datasets** when network transfer is slow or expensive.
- **Use Case**: Edge locations, air-gapped environments, bulk migration.
- **Snowmobile** can carry **exabytes**!

---

## 📡 7. VPN (Site-to-Site)

- **Purpose**: Encrypted connection over internet between on-prem and AWS.
- **Use Case**: Secure and fast, often used with **Direct Connect** as backup.
- **Latency is higher** than Direct Connect.

---

## 🔄 Summary Table

| Service              | Used For                       | Data Type     | Real-Time? | Internet-Based? | Storage Type |
|----------------------|-------------------------------|---------------|------------|------------------|---------------|
| AWS Direct Connect   | Dedicated line                | All           | Yes        | ❌ No             | N/A           |
| AWS DataSync         | File transfers                | Files         | Yes        | ✅ Yes (or DX)    | S3, EFS, FSx   |
| AWS DMS              | Database migration            | DB data       | Yes        | ✅ Yes            | RDS, Aurora   |
| AWS Storage Gateway  | File/block/tape gateway       | Files/Blocks  | Yes        | ✅ Yes            | S3            |
| AWS Snowball         | Bulk offline transfers        | All           | No         | ❌ No             | S3, Glacier   |
| Internet Gateway     | Public internet access        | All           | Yes        | ✅ Yes            | N/A           |
| Site-to-Site VPN     | Secure connection             | All           | Yes        | ✅ Yes            | N/A           |

---

📌 **Tip for CCP Exams**:
- If it’s **real-time DB migration** → Go with **DMS**.
- If it's **massive data, slow network** → Choose **Snowball**.
- If it's **file-based transfer, regular syncs** → Go with **DataSync**.
- If it’s **hybrid storage** and caching → Choose **Storage Gateway**.
- If question says **dedicated private connection** → It’s **Direct Connect**.

---