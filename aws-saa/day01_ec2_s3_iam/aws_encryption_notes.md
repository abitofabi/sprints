# 🔐 AWS Encryption Across Services – Explained

While **AWS KMS** (Key Management Service) powers encryption across most AWS services, **each service handles encryption differently** in terms of:

- 🔧 Configuration (default vs optional)
- 🗝️ Key control (AWS-managed vs Customer-managed)
- 🧱 Granularity (object, table, volume, etc.)
- 💰 Cost impact
- 🚦 Flexibility & usage

---

## ✅ KMS is the Encryption Backbone

> AWS KMS enables secure key storage, automatic rotation, fine-grained access control, and centralized audit logging via CloudTrail.

---

## 🔍 Why Encryption is Explained Per-Service

| Reason | Why It Matters |
|--------|----------------|
| 🔐 **Default vs Optional** | Some services encrypt by default (DynamoDB), others require enabling at creation (RDS, EBS) |
| 🧰 **Control Level** | AWS-managed keys (e.g., `aws/s3`) vs Customer Managed Keys (CMKs, e.g., `alias/my-key`) |
| 💸 **KMS Cost** | CMKs + API calls incur cost; some services trigger thousands of key lookups |
| 🧱 **Granularity** | Varies by service: object-level, table-level, volume-level, etc. |
| 🚫 **Toggling Support** | Some services (like RDS) cannot change encryption after creation |

---

## 🔐 Encryption Behavior by AWS Service

| Service | Default Encryption | User Control | Granularity | Notes |
|---------|---------------------|--------------|-------------|-------|
| **S3** | ❌ Optional | SSE-S3 / SSE-KMS / CSE | Per object | CSE = Client-Side Encryption |
| **EBS** | ❌ Optional (at volume creation) | CMK optional | Per volume | Can’t enable/disable after creation |
| **RDS** | ❌ Optional (at launch only) | CMK or default | Entire DB/cluster | Cannot toggle later |
| **Aurora** | ❌ Optional (cluster level) | CMK optional | Whole cluster | Recreate cluster to enable |
| **DynamoDB** | ✅ Enabled by default | AWS-managed or CMK | Per table | CMK adds auditability |
| **Lambda** | ✅ Enabled by default | CMK for env vars or layers | Per function + env vars | Option to use custom CMK |
| **Redshift** | ❌ Optional | CMK optional | Cluster-level / Column-level (RA3) | RA3 supports column-level encryption |
| **KMS** | N/A | Your key vault | N/A | Can create, rotate, audit custom CMKs |

---

## 🧬 KMS Key Types

| Key Type | Description |
|----------|-------------|
| **AWS-managed (e.g. aws/s3)** | Automatically created and rotated by AWS |
| **Customer-managed (CMK)** | Full control: policy, rotation, audit trail, grants |
| **Imported key (BYOK)** | Bring Your Own Key to AWS |
| **Custom key store (CloudHSM)** | For highest compliance requirements (FIPS 140-2) |

---

## 💡 Common Patterns

- Use **default AWS-managed keys** for simplicity and zero-config encryption
- Use **CMKs** when:
  - You need to audit who used the key
  - You want fine-grained IAM or cross-account control
  - You need to revoke access instantly
- Consider **KMS API usage limits and pricing** for high-volume services like S3 or DynamoDB

---

## 📌 TL;DR

| Statement | Truth |
|-----------|--------|
| “Everything is encrypted with KMS” | ✅ Yes |
| “So encryption works the same for all services” | ❌ No — configuration, granularity, and control vary |
| “You always need a custom CMK” | ❌ No — AWS-managed keys are fine for many use cases |
| “Encryption affects cost/performance” | ✅ Yes — especially CMKs and high-volume services |

---

## 🧠 Bonus: KMS Tips for Interviews

- Explain how **RDS encryption at rest** only works at DB launch (can’t toggle later)
- Contrast **DynamoDB’s default encryption** vs **S3’s optional SSE-KMS**
- Know the **difference between SSE-S3, SSE-KMS, and client-side encryption (CSE)** in S3
- Mention **CloudTrail + KMS** audit logs for compliance use cases

---

> 🔐 Want to go further? Add Terraform or CloudFormation examples for enabling KMS on each service.

