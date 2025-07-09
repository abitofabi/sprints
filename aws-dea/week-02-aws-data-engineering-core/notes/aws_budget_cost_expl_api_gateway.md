# 💸 AWS Budgets, Cost Explorer & API Gateway

---

## 🧾 AWS Budgets

**Purpose:**  
Track your AWS usage and costs proactively.

**Types of Budgets:**
- **Cost Budget** – Alerts when spend > threshold
- **Usage Budget** – Alerts based on resource use (e.g., GB, hours)
- **Savings Plan & RI Budgets** – Tracks commitment usage

**Example Use Case:**
> Alert when monthly S3 cost crosses $50

**Features:**
- Sends alerts via **SNS**
- Supports **linked accounts** in Organizations
- **Budgets Actions** – auto-disable services or apply SCPs (optional)

---

## 📊 AWS Cost Explorer

**Purpose:**  
Visualize and analyze AWS costs over time.

**Features:**
- Hourly, daily, monthly breakdowns
- Group by service, tag, linked account, etc.
- Forecast future spend
- Helps identify **cost anomalies**

**Use Case:**
> “Which service is causing a spike in usage this month?”

---

## 🔐 Permissions

To access Budgets or Cost Explorer:
- User needs `budgets:*` and `ce:*` permissions
- Often attached via `Billing` managed policy

---

## 🌐 Amazon API Gateway

**Purpose:**  
Create, publish, and manage REST/HTTP/WebSocket APIs.

**Supports:**
- **REST APIs** – Traditional RESTful endpoints
- **HTTP APIs** – Lighter, faster, cheaper (newer)
- **WebSocket APIs** – For real-time 2-way communication

**Example Use Cases:**
- Create an API for Lambda or Glue jobs
- Mobile app hitting backend via API Gateway
- Real-time dashboard using WebSockets

**Architecture Sample:**
```
Client -> API Gateway -> Lambda -> DynamoDB
```

---

### 💡 Key Features

| Feature                | Description                                       |
|------------------------|---------------------------------------------------|
| **Throttling**         | Control traffic (requests/sec)                    |
| **Caching**            | Reduce backend load via result caching            |
| **Authentication**     | IAM, Cognito, Lambda authorizer                   |
| **Monitoring**         | Integrated with **CloudWatch metrics/logs**       |
| **SDK Generation**     | Auto-generate SDKs for iOS/Android/JS             |
| **Custom Domain**      | Map APIs to your own domain (via Route 53 + ACM)  |

---

### REST API vs HTTP API (Quick Comparison)

| Feature        | REST API              | HTTP API             |
|----------------|------------------------|-----------------------|
| **Speed**      | Slower                 | 60% faster            |
| **Cost**       | Higher                 | Cheaper               |
| **Features**   | Full IAM + authorizers | Limited               |
| **Use Case**   | Complex APIs           | Simple + fast APIs    |

---

## 📌 Exam Tips

- Budget alerts are **proactive** — Cost Explorer is **reactive**
- Use API Gateway with **Lambda**, **Step Functions**, or **DynamoDB**
- Know **REST vs HTTP API** tradeoffs
- Caching is optional; requires enabling and adds cost

---

Let me know if you want:
- Sample API Gateway + Lambda config
- Budget alert setup using SNS
- Cost-saving checklist for exam wrap-up

