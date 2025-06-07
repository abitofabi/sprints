# 🪣 AWS S3 — Notes & Hands-on Summary

## 📌 What is S3?
- Object storage service
- Stores data as key-value pairs (object = data + metadata + unique key)
- Flat structure (no real folders)
- Ideal for data lakes, static file hosting, backups

---

## 📁 Key Concepts
### 🔹 Buckets
- Logical containers for storing objects
- Bucket names must be globally unique
- Region-specific (but S3 is global service)

### 🔹 Objects
- Individual files (with metadata)
- Max size: 5TB
- Can be versioned if enabled

### 🔹 Storage Classes
| Class | Use Case |
|-------|----------|
| Standard | Frequent access |
| IA | Infrequent Access |
| Glacier | Archive |
| Glacier Deep Archive | Long-term cold storage |

---

## 🔐 Security & Access
### IAM Policies
- Bucket-level and object-level permissions
- Policies can be attached to users/roles

### Bucket Policies
- JSON-based rules attached directly to buckets
- Good for cross-account access

### S3 Block Public Access
- Centralized switch to avoid accidental public exposure

---

## ⚙️ Features & Settings
- ✅ **Versioning**
- 🕒 **Lifecycle Rules** (e.g., move to Glacier after 30 days)
- ♻️ **Replication** (Cross-Region or Same-Region)
- 🧮 **Object Lock** (WORM (Write Once, Read Many) for compliance)
- 📋 **Logging & Events**

---

## Real-World Usage
- Used as the staging layer in ETL workflows
- Direct querying with Athena
- Output location for Glue ETL jobs
- Can trigger Lambda functions on object upload

## Info: 
- Bucket names are DNS-compliant (no uppercase, must be unique)
- Can’t rename objects → need to copy + delete
- Use presigned URLs for secure temporary access
- Avoid s3:// in Athena — use table references via Glue catalog

  ---
## Advanced features
## 🔒 Encryption in S3

### 🔒Encryption Types

#### ✅ Server-Side Encryption (SSE)
| Type | Who Manages Keys? | Notes |
|------|-------------------|-------|
| SSE-S3 | AWS | Simple, default, 256-bit AES |
| SSE-KMS | You (via AWS KMS) | Audit logs, key rotation, access control |
| SSE-C | You | Provide key with each request (rarely used) |

All encryption happens **after** data is received by S3.

### 🔐 Client-Side Encryption
- You encrypt the data before sending to S3 (less common) , Must manage keys and encryption yourself

---

## 🌐 S3 Access Points

- Provide **customized access to a shared bucket**
- Useful in **multi-tenant** environments or large data lakes
- Each access point has its own name and permissions
- Helps apply **different IAM policies** per app/team for same bucket without duplicating buckets
- Great for **large data lake buckets** with isolated workloads

---

## 🧠 S3 Object Lambda

- Let you **transform data on-the-fly** as it’s retrieved from S3
- Example: Mask PII before sending a file to the client , resize image , filter json
- Works with Lambda functions GET + access points
- You don’t need to store transformed copies — **compute on read!**

---

## 📈 S3 Storage Lens

- Analytics tool to **monitor and optimize storage usage**
- Gives visibility into:
  - Object counts
  - Cost by prefix or storage class
  - Unused data or access patterns
- Helps identify **cost-saving opportunities** in data lakes

-------------------------------------------------------------
Feature	            | Use Case
--------------------------------------------------------------
Encryption (SSE-KMS)|Enterprise-grade data compliance (e.g., healthcare, banking)
Access Points	      | Large data lakes with multiple teams
Object Lambda	      | Real-time masking/transformation of sensitive data
Storage Lens	      | Cost optimization and insights at scale


---


📌 These advanced features are **frequently tested** in AWS DEA exams, especially SSE-KMS, lifecycle, and replication.

## 🧠 TL;DR

| Feature         | Think of it like...                      |
| --------------- | ---------------------------------------- |
| Encryption      | Locking your diary so no one can read it |
| Access Points   | Custom doors for each person             |
| Object Lambda   | A filter that hides private info         |
| Storage Lens    | A magnifying glass to see storage stuff  |
| Versioning      | A time machine for your files            |
| Replication     | Backups in another place                 |
| Object Lock     | A file you’re not allowed to delete      |
| Lifecycle Rules | Auto-cleanup rules for old files         |
