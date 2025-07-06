# 🌍 Amazon Route 53 – AWS SAA Notes

---

## 📌 What is Route 53?

Amazon Route 53 is a **highly available and scalable DNS web service**. It connects user requests to:
- **Applications running in AWS** (like EC2, S3, ELB)
- **External domains or endpoints**
- It also performs **health checks** and **intelligent routing**

---

## 🧠 Why is it called “Route 53”?

- “53” = port 53, used for DNS protocol  
- “Route” = traffic routing decisions

---

## 🧭 Common DNS Record Types

| Type       | Description                        |
|------------|------------------------------------|
| **A Record**     | Maps domain → IPv4 address         |
| **AAAA Record**  | Maps domain → IPv6 address         |
| **CNAME**        | Alias for another domain (not root) |
| **Alias Record** | AWS-specific; maps domain to AWS resources like ELB, S3, CloudFront |
| **MX, TXT, SRV** | Email routing, verification, service metadata |

> ✅ Alias records are **better than CNAME** at the root domain level (e.g., `example.com`)

---

## 🌐 Routing Policies

| Routing Type         | Purpose |
|----------------------|---------|
| **Simple Routing**   | Basic DNS mapping (no logic) |
| **Failover Routing** | Route to secondary if primary fails |
| **Latency-based**    | Route to the AWS region with lowest latency |
| **Weighted Routing** | Split traffic by % (A/B testing) |
| **Geolocation**      | Route based on user’s location (country, region) |
| **Geoproximity**     | Route based on location + bias (requires Traffic Flow) |
| **Multi-value Answer** | Returns multiple IPs with health check support |

---

## 🧪 Route 53 Health Checks

- Can monitor:
  - HTTP(s) endpoints
  - TCP ports
  - CloudWatch alarms
- Used with **Failover**, **Multi-value**, and sometimes **Latency** routing
- If a record becomes unhealthy → Route 53 removes it from DNS responses

> ✅ ELB does health checks for its instances; no need to duplicate in Route 53

---

## 🔐 SSL/TLS with Route 53

- **Route 53 itself doesn't manage SSL certs**
- But it **routes traffic** to services like:
  - CloudFront
  - ALB/ELB
  - S3 static websites
- These services **terminate TLS/SSL**, usually using:
  - **AWS Certificate Manager (ACM)** for public certs
  - **IAM Certificate Store** for CLI/manual setups

---

## 🧠 Latency vs Geoproximity vs Geolocation

| Concept       | Based On              | Route 53 Feature  | Requires Traffic Flow |
|---------------|-----------------------|-------------------|------------------------|
| **Latency**   | Lowest network ping   | Latency-based     | ❌ No                  |
| **Geolocation** | User's country/region | Geolocation       | ❌ No                  |
| **Geoproximity** | Physical location + traffic bias | Geoproximity | ✅ Yes                 |

---

## 📌 Private Hosted Zones

- Used for **internal DNS** inside a VPC
- Not accessible over internet
- Common for microservices or internal APIs

---

## ✅ Most Common Exam Use Cases

| Scenario                              | Use This Routing |
|---------------------------------------|------------------|
| Users in India → Mumbai app           | Geolocation      |
| 80% traffic to v1, 20% to v2          | Weighted         |
| Primary app + disaster recovery site  | Failover         |
| Deploy app in 3 regions, fastest ping | Latency-based    |
| Return 4 IPs, skip unhealthy ones     | Multi-value      |
| Internal microservice DNS             | Private hosted zone |

---

## 🧠 Quick Tips

- **Alias Record** is better than CNAME for root domain (e.g., `example.com`)
- Route 53 is **Global**, not regional
- You pay **per hosted zone + per query**
- Supports domain registration too (`.com`, `.org`, etc.)

---

## ✅ Summary

| Feature               | Notes |
|-----------------------|-------|
| DNS Management        | Public and private |
| Health Checks         | HTTP/TCP/CloudWatch |
| Intelligent Routing   | Failover, Latency, Weighted, etc. |
| SSL Integration       | Via ALB, CloudFront, ACM |
| Exam Scenarios        | Very common in HA setups and global apps |
