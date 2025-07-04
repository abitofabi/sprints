# 🧾 Snowflake Editions – Full Comparison: Standard vs Enterprise vs Business Critical vs VPC PrivateLink

---

| Feature / Capability                            | Standard     | Enterprise   | Business Critical | VPC PrivateLink Edition     |
|--------------------------------------------------|--------------|--------------|--------------------|------------------------------|
| **Time Travel Max Retention**                   | 1 day        | 90 days      | 90 days            | 90 days                      |
| **Fail-safe**                                   | ❌           | ✅ 7 days     | ✅ 7 days           | ✅ 7 days                     |
| **Secure Data Sharing**                         | ✅           | ✅            | ✅                 | ✅                            |
| **Reader Accounts**                             | ✅           | ✅            | ✅                 | ✅                            |
| **Materialized Views**                          | ✅           | ✅            | ✅                 | ✅                            |
| **Row-Level Security (Row Access Policy)**      | ❌           | ✅            | ✅                 | ✅                            |
| **Dynamic Data Masking**                        | ✅ (limited) | ✅            | ✅                 | ✅                            |
| **External Functions / UDFs**                   | ❌           | ✅            | ✅                 | ✅                            |
| **Search Optimization**                         | ❌           | ✅            | ✅                 | ✅                            |
| **Multi-Cluster Virtual Warehouse**             | ❌           | ✅            | ✅                 | ✅                            |
| **Resource Monitors / Scaling**                 | ✅           | ✅            | ✅                 | ✅                            |
| **Private Connectivity (AWS/GCP/Azure)**        | ❌           | ❌            | ✅                 | ✅ (via PrivateLink or VNet) |
| **HIPAA / PCI / PHI Compliance**                | ❌           | ❌            | ✅                 | ✅                            |
| **Tri-Secret Secure** *(customer KMS + Snowflake)* | ❌         | ❌            | ❌                 | ✅                            |
| **Dedicated Metadata Store**                    | ❌           | ❌            | ✅                 | ✅                            |
| **Network Policy Enforcement**                  | ✅           | ✅            | ✅                 | ✅                            |
| **IP Whitelisting**                             | ✅           | ✅            | ✅                 | ✅                            |
| **Customer-Managed Keys (CMK)**                 | ❌           | ❌            | ✅                 | ✅                            |
| **Object Tagging & Classification**             | ✅           | ✅            | ✅                 | ✅                            |
| **Data Replication & Failover**                 | ❌           | ✅            | ✅                 | ✅                            |
| **SOX / FedRAMP / ITAR Controls**               | ❌           | ❌            | ✅ (some)           | ✅ (full)                     |

---

## 🧠 Notes

- **Business Critical** is essential if your workload requires advanced compliance or enterprise-level data security.
- **VPC PrivateLink Edition** includes **everything in Business Critical**, plus:
  - Isolation from public internet  
  - Support for **AWS PrivateLink**, **Azure Private Link**, or **GCP Private Service Connect**  
  - **Tri-Secret Secure**: Protects data with both Snowflake and your cloud KMS key  
  - **Dedicated Metadata Store** for increased data protection.

---

## 💡 How to Choose?

| Use Case                             | Best Fit Edition            |
|--------------------------------------|-----------------------------|
| Learning / Prototyping               | Standard                    |
| Enterprise workload / data scaling   | Enterprise                  |
| Regulated industries (Finance, PHI)  | Business Critical           |
| Highest security / network isolation| VPC PrivateLink Edition     |
