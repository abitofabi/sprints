# 📦 Amazon S3 – Advanced Features Add-on

---

## 🌐 CORS (Cross-Origin Resource Sharing)

Defines **who can access** your S3 bucket from **a different domain** (e.g., browser apps).

Required when frontend apps (React, Angular) fetch from S3.

Defined using **XML CORS policy** on the bucket:

~~~
<CORSConfiguration>
  <CORSRule>
    <AllowedOrigin>*</AllowedOrigin>
    <AllowedMethod>GET</AllowedMethod>
    <AllowedHeader>*</AllowedHeader>
  </CORSRule>
</CORSConfiguration>
~~~

---

## 🔐 MFA Delete

- Adds an extra layer of protection for deleting objects in **versioned buckets**
- Requires **MFA token** for permanent deletions
- Must be enabled via **CLI only**
- Great for compliance, protection from accidental/malicious deletion

---

## 🔍 S3 Access Logs

- Logs all **read and write access** to S3 objects
- Stored in another bucket of your choice
- Useful for:
  - Audit & Compliance
  - Billing analysis
  - Detecting unexpected access patterns

---

## 🔐 S3 Access Points

- Create **custom access policies** for different applications or VPCs
- Simplifies access for **shared datasets** (like data lakes)
- Lets you expose **only specific prefixes/folders**

---

## 🧠 S3 Object Lambda

- Run a **Lambda function inline** with an S3 GET request
- Use cases:
  - Redacting PII
  - Watermarking images
  - Data format conversion (e.g., JSON → CSV)
- The original object stays unchanged — only the **response** is transformed

---

## 📦 S3 Batch Operations

- Run operations on **millions/billions of objects**
- Supply a **manifest file** (CSV or S3 inventory)
- Common ops:
  - COPY
  - DELETE
  - TAGGING
  - Lambda processing

---

## 🧊 Glacier Vault vs Object Lock

| Feature         | Purpose                              | Use Case                |
|-----------------|--------------------------------------|--------------------------|
| **Glacier Vault** | Legacy Glacier archive container    | Used with access policies and vault locks |
| **Object Lock**   | WORM – Write Once Read Many mode    | Compliance, legal hold   |

**Object Lock Modes:**
- **Governance** – AWS users with special IAM perms can still delete
- **Compliance** – No one (not even root) can delete until expiry

---

## 💸 Requester Pays Buckets

- **Requester** pays for the download cost (not the bucket owner)
- Great for public/open data use cases
- Must be explicitly enabled on the bucket

---

## ⚙️ S3 Performance Optimization

| Practice                         | Benefit                     |
|----------------------------------|-----------------------------|
| **Multi-part uploads**           | Faster, parallel upload     |
| **Prefix-based key naming**      | Better distribution          |
| **Transfer Acceleration**        | Faster global uploads via edge locations |
| **Byte-range fetch**             | Parallel reads of large files |
| **Intelligent-Tiering**          | Auto optimization of cost    |

---

## 📈 S3 Storage Lens

- Org-wide **analytics tool** for S3 usage
- Dashboards for:
  - Object count
  - Data age
  - Access frequency
  - Cost optimization
- Can integrate with **CloudWatch Metrics** and set alerts

---

## 📣 S3 Event Notifications

- Triggers on:
  - **Object Created**
  - **Object Removed**
  - **Object Restore (from Glacier)**
- Supported targets:
  - **SNS**
  - **SQS**
  - **Lambda**
- Limited to **one event config per bucket** (must filter with prefix/suffix)

---

## ✅ Pro Tip Summary

| Feature            | Use Case |
|--------------------|----------|
| CORS               | Frontend app requesting S3 asset |
| MFA Delete         | Prevent accidental version deletions |
| Access Logs        | Track who accessed what and when |
| Access Points      | Per-client access policies |
| Object Lambda      | On-demand object transformation |
| Batch Ops          | Modify millions of objects easily |
| Glacier Vaults     | Secure long-term archives |
| Object Lock        | Compliance and legal hold |
| Requester Pays     | Offload download costs to users |
| Storage Lens       | Analyze and optimize storage |
| Event Notifications| Trigger compute after upload |
