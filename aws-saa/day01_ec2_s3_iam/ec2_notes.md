# 🖥️ AWS EC2 – Notes & Cheat Sheet

Amazon EC2 (Elastic Compute Cloud) allows you to rent virtual servers to run applications in the cloud. It's one of the most fundamental AWS services.

---

## 🧠 Core Concepts

| Term | Description |
|------|-------------|
| **EC2 Instance** | A virtual server in the cloud |
| **AMI (Amazon Machine Image)** | Preconfigured OS + software template for launching instances |
| **Instance Type** | Defines CPU, memory, storage (e.g., t2.micro, m5.large) |
| **EBS (Elastic Block Store)** | Persistent disk attached to EC2 instance |
| **Instance Store** | Temporary, non-persistent storage directly attached to host |
| **Security Group** | Virtual firewall that controls inbound and outbound traffic |
| **Key Pair** | SSH key pair used for secure login to EC2 |
| **Elastic IP** | Static IPv4 address that can be re-mapped between instances |
| **Placement Group** | Strategy for placing instances together (cluster/spread/partition) |
| **Elastic Load Balancer (ELB)** | Distributes traffic across instances |

---

## 🧾 Common EC2 Instance Families

| Family | Purpose |
|--------|---------|
| **t** | General purpose burstable (e.g., t3.micro) |
| **m** | General purpose (balanced CPU/memory) |
| **c** | Compute optimized |
| **r** | Memory optimized |
| **i** | Storage optimized |
| **g / p / inf** | GPU-based (machine learning, graphics) |
| **d / h / z** | High IOPS / storage / special use |

---

## 🔐 Security & Networking

- **Security Group**: Acts like a stateful firewall at the **instance level**
  - Inbound + outbound rules
  - Works only on **allow rules**
- **NACL**: Works at the **subnet level**, supports **allow & deny**
- **SSH access**: Linux instances are accessed using `.pem` key from your key pair
- **Elastic IP**: Useful for static public IP mapping (only 1 free per account)

---

## 🛠️ Storage Options

| Storage Type | Description |
|--------------|-------------|
| **EBS (gp2, gp3, io1, sc1, st1)** | Persistent storage; survives instance stop/start |
| **Instance Store (Ephemeral)** | High-speed, temporary storage; lost on stop/terminate |
| **EFS (Elastic File System)** | Shared NFS-based storage; mounted across instances |
| **AMI** | Contains OS and pre-installed software for instance launch |

---

## 📦 AMI = Like Docker Image

- AMI is a snapshot of the **OS + environment**
- You can create your **custom AMIs**
- **Public AMIs** available for Windows, Ubuntu, Amazon Linux, etc.

---

## ⚙️ EC2 Lifecycle States

| State | Description |
|-------|-------------|
| **Pending** | Instance is being launched |
| **Running** | Instance is live and billing starts |
| **Stopped** | Instance shut down (EBS persists) |
| **Terminated** | Instance deleted (storage lost unless EBS = persisted) |

---

## 🧬 EC2 Placement Groups

| Type | Description |
|------|-------------|
| **Cluster** | Same AZ, low latency/high throughput (e.g., HPC apps) |
| **Spread** | Instances across AZs to reduce correlated failure |
| **Partition** | Group instances across partitions (e.g., big data nodes) |

---

## 🚦 Load Balancing + Health Checks

- **ALB (Application Load Balancer)**: L7 (HTTP/S), supports routing & path rules
- **NLB (Network Load Balancer)**: L4 (TCP/UDP), high performance
- **CLB (Classic Load Balancer)**: Legacy

- **Connection Draining**: Let in-flight requests finish before terminating instance
- **Auto Scaling Group (ASG)**: Adds/removes EC2s based on demand

---

## 🛡️ ENI (Elastic Network Interface)

- **Primary network card** attached to an EC2 instance
- You can attach **secondary ENIs** too
- Useful for failover, low-level networking, custom routing

---

## 🔐 EC2 + Encryption

| Component | Encrypted By |
|-----------|--------------|
| **EBS Volumes** | Can be encrypted using AWS KMS |
| **Data in transit (SSH, HTTPS)** | TLS encryption |
| **Custom AMIs** | Based on encrypted volumes (optional) |

---

## 💡 EC2 Tips for Interviews

- EC2 is **stateful**, use **stateless design** with Load Balancers + Auto Scaling
- Always use **roles** (not access keys) for EC2 to access other AWS services
- **Placement groups** are critical for latency-sensitive workloads
- Understand difference between **Security Groups (stateful)** vs **NACLs (stateless)**

---

## 📌 Common Troubleshooting

| Problem | Fix |
|---------|-----|
| Can’t SSH into EC2 | Check SG inbound rule for port 22 |
| Can't ping EC2 | ICMP is not allowed by default in SG |
| Instance terminated suddenly | Spot instance interruption or billing alert |
| No internet | Check public IP + route table + IGW + SG/NACL |

---

## 🧠 TL;DR Summary

| Concept | Summary |
|--------|---------|
| EC2 = Virtual machine in cloud | Use AMIs + instance types |
| Secure with SG + key pair | Use roles for access |
| EBS = Persistent, Instance Store = Temporary | Choose based on need |
| Load balancer + ASG = scalable architecture | Use health checks & draining |
| Encrypt storage with KMS | Monitor with CloudWatch |

---

> ✅ EC2 is your compute foundation. Master its networking, storage, scaling, and security to design resilient cloud apps.
---

## 🔄 EC2 Optional Topics (Exam-Ready Extras)

These aren't always tested but are useful for real-world + edge-case AWS SAA exam questions.

---

### ☁️ EC2 Pricing Models

| Type | Description | Use Case |
|------|-------------|----------|
| **On-Demand** | Pay by the second, no long-term commitment | Spiky workloads, dev/test |
| **Reserved** | Commit 1 or 3 years for discount (up to 75%) | Predictable workloads |
| **Spot** | Buy unused capacity at discount (up to 90%) | Fault-tolerant jobs (batch, ML) |
| **Savings Plan** | Commitment to $/hr usage across services | Flexible across instance types |

> ❗ Spot instances can be interrupted by AWS with 2-min warning.

---

### 🛌 EC2 Hibernate

- Preserves **RAM content** + EBS root volume
- Faster boot time than stop/start
- Available only on supported instance types
- Useful for **long startup time** apps (e.g. in-memory cache)

---

### 🧠 EC2 Nitro vs Xen Hypervisor

| Hypervisor | Description |
|------------|-------------|
| **Xen** | Older virtualization tech used in early EC2 |
| **Nitro** | Modern, lightweight hypervisor with better performance and security |
| Nitro benefits: | Bare-metal support, hardware-enforced isolation, faster I/O |

> Newer instance families (e.g., M5, C5, T3, etc.) use **Nitro** by default

---

### 🧰 EC2Rescue Tool

- AWS-provided troubleshooting utility
- Helps diagnose & fix Windows and Linux instance issues (boot failure, password reset, etc.)
- Run it on:
  - A stopped EBS-backed volume (mount as secondary on helper instance)
  - Or, download directly if you can SSH

---

### 🧮 EC2 Launch Templates vs Launch Configurations

| Feature | Launch Config | Launch Template |
|---------|----------------|------------------|
| Versioning | ❌ | ✅ |
| Latest features (e.g., T4g, Nitro) | ❌ | ✅ |
| Flexible, recommended | ❌ Deprecated | ✅ Use this |

> Always use **Launch Templates** for Auto Scaling, as Launch Config is outdated.

---

## 💡 Pro Tips

- Spot interruptions = 2-minute warning → Handle via ASG lifecycle hooks
- Hibernate ≠ Stop → Hibernate preserves memory; stop does not
- Nitro ≠ Service → It’s an underlying **platform/hardware layer**
- Pricing models = Core for **cost optimization questions**

---
