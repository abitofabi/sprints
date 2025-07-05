# ☁️ AWS High Availability & Scalability – ELB & Auto Scaling Notes

---

## 📌 What is High Availability (HA)?
A system is **highly available** if it stays operational even when parts of it fail.

Achieved through:
- **Multi-AZ deployments**
- **Load balancers (ELB)**
- **Auto scaling (ASG)**
- **Health checks & automatic recovery**

---

## ⚖️ Elastic Load Balancer (ELB)

ELB distributes incoming application or network traffic across multiple targets (like EC2 instances) for:
- **Scalability**
- **High availability**
- **Fault tolerance**

### 🔀 ELB Types

| Type             | Layer        | Ideal For                        |
|------------------|--------------|----------------------------------|
| **ALB** (Application LB) | Layer 7 | HTTP/HTTPS, microservices, path-based routing |
| **NLB** (Network LB)     | Layer 4 | TCP/UDP, low latency, static IPs |
| **CLB** (Classic LB)     | Layer 4/7 | Legacy applications (deprecated) |

---

### 💡 ELB Features

| Feature                | Description |
|------------------------|-------------|
| **Health Checks**      | Routes traffic only to healthy targets |
| **SSL/TLS Support**    | Supports HTTPS using SSL certs via ACM or IAM |
| **Sticky Sessions**    | Keeps users tied to one instance using cookies |
| **Cross-Zone Load Balancing** | Balances traffic evenly across all AZs |
| **Connection Draining** | Waits for inflight requests to finish before removing instance |
| **Host-based Routing** (ALB) | e.g., `/api/*` to one target group, `/admin/*` to another |
| **Path-based Routing** (ALB) | e.g., route by domain or path |
| **WebSockets** (ALB/NLB) | Supports long-lived connections |

---

### 🔐 SSL/TLS Certificates on ELB

- ELB (especially ALB & NLB) supports HTTPS (SSL/TLS)
- You can use:
  - **AWS Certificate Manager (ACM)** for public certs (free)
  - **IAM certificate store** for CLI/SDK use
- Supports automatic renewal for ACM-issued certs

> Use SSL termination at the ELB to decrypt incoming HTTPS, then forward as HTTP to backend (for performance)

---

### 🍪 Sticky Sessions (Session Affinity)

- Also called **session stickiness**
- Keeps a user tied to **the same EC2 instance**
- Useful when user session data is stored **locally**
- ALB: Uses **application cookie** or **duration-based cookie**
- CLB: Only **duration-based**

> ❗ Not scalable for apps that need distributed session state

---

### 🌐 Cross-Zone Load Balancing

- Without it: ELB routes requests **only to instances in the same AZ**
- With it: ELB spreads traffic **evenly across all registered instances**, **regardless of AZ**

✅ Recommended to keep cross-zone LB **enabled** (no extra cost for ALB/NLB)

---

## 🔁 Auto Scaling Group (ASG)

Automatically adds/removes EC2 instances to match demand.

### Core Concepts

| Term          | Meaning |
|---------------|---------|
| **Min/Max/Desired** | Controls the number of EC2 instances |
| **Launch Template** | Defines how EC2s should be created |
| **Scaling Policy** | Defines when/how scaling should happen |

---

### 🔄 Types of Scaling

| Type              | Trigger |
|-------------------|---------|
| **Dynamic Scaling** | Based on metrics like CPU, network |
| **Scheduled Scaling** | Based on time (e.g., scale up weekdays 9AM) |
| **Predictive Scaling** | Uses ML to forecast and auto-scale in advance |

---

### 🧪 Health Checks & Graceful Termination

- ASG can monitor **EC2 status** or **ELB health**
- Unhealthy instances are **terminated and replaced**
- **Connection Draining** (aka *deregistration delay*) lets in-flight requests complete before killing an instance

---

## 🔗 ELB + ASG = Auto Healing + HA

| Feature          | Benefit |
|------------------|---------|
| **Multi-AZ**     | ELB balances across AZs |
| **Health Checks**| Route traffic to healthy EC2s only |
| **Scaling**      | Add/remove instances automatically |
| **Recovery**     | ASG replaces unhealthy instances |
| **SSL Termination** | Offload encryption at ELB layer |
| **Sticky Sessions** | Useful for session-based apps (careful with scaling!) |

---

## 🧠 ELB vs ASG Analogy

| Component | Real-Life Role       | What It Does |
|-----------|----------------------|--------------|
| ELB       | Receptionist          | Distributes visitors (traffic) |
| ASG       | HR Department         | Hires/fires staff (EC2s) based on workload |
| Sticky Sessions | Regular Customers | Same visitor sees same staff |
| Cross-Zone LB | Reception with full staff rotation | Load spread evenly across all locations |

---

## ✅ Summary

| Concept              | Purpose |
|----------------------|---------|
| **ELB**              | Distribute traffic across healthy targets |
| **ASG**              | Auto-scale EC2 based on demand |
| **Sticky Sessions**  | Maintain user session to same EC2 |
| **Cross-Zone LB**    | Evenly distribute traffic across all AZs |
| **SSL Support**      | Secure connections using TLS certificates |
| **Connection Draining** | Let requests finish before shutting down EC2 |
| **Health Checks**    | Ensure only healthy instances serve traffic |

---

> 🧠 These are foundational building blocks in every **highly available**, **scalable**, and **secure** architecture in AWS.
