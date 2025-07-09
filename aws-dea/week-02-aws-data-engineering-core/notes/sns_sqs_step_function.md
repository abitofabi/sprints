# 🔁 AWS Application Integration Overview

---

## 1️⃣ Amazon SQS – Simple Queue Service

### 💡 What is SQS?

- Fully managed **message queuing** service
- Decouples producers & consumers
- Ensures **asynchronous communication**

### 🔄 SQS Types

| Type     | Features                                              |
|----------|--------------------------------------------------------|
| Standard | Unlimited throughput, **at-least-once delivery**, best-effort ordering |
| FIFO     | Strict ordering, **exactly-once processing**, limited TPS (300/3,000 with batching) |

### 📦 Core Concepts

- **Message retention**: up to 14 days
- **Visibility timeout**: hide msg while being processed
- **Delay queues**: delay delivery by up to 15 mins
- **Long polling**: reduce empty responses, better cost

---

## 2️⃣ SQS vs Kinesis Data Streams

| Feature               | SQS                                | Kinesis Data Streams              |
|------------------------|-------------------------------------|-----------------------------------|
| Use case              | Task queues, decoupling microservices | Real-time analytics, ETL pipelines |
| Ordering              | FIFO (optional)                    | Per partition (shard)             |
| Delivery guarantees   | At-least-once (standard)           | At-least-once (default)           |
| Consumer model        | Pull (polling)                     | Push/pull                         |
| Throughput            | Scales with queue count            | Per-shard limits                  |
| Retention             | 14 days max                        | Up to 365 days (extended)         |

🧠 TL;DR:  
- **SQS** = Decouple apps  
- **Kinesis** = Real-time event streaming  

---

## 3️⃣ DLQ – Dead Letter Queues

### ☠️ What is a DLQ?

- A secondary queue to store **failed messages**
- Useful for:
  - Debugging
  - Avoid message loss
  - Prevent poison-pill loops

🧠 Messages go to DLQ after **maxReceiveCount** fails

---

## 4️⃣ Amazon SNS – Simple Notification Service

### 📢 What is SNS?

- **Pub/Sub** service for sending messages to **multiple subscribers**
- Subscribers can be:
  - SQS
  - Lambda
  - HTTPS endpoints
  - Email/SMS/Mobile push

---

## 5️⃣ Fan-Out Pattern (SNS + SQS)

🎯 **Decouple multiple consumers** from one publisher

~~~
Publisher → SNS Topic → SQS Queue 1
                             → SQS Queue 2
                             → Lambda
~~~

- Each queue gets **a copy** of the message
- Consumers process independently
- Great for **event replication**

---

## 6️⃣ AWS Step Functions

### 🔗 What is it?

- Serverless **workflow orchestration** tool
- Visual state machine for:
  - Microservice flows
  - Retry logic
  - Error handling
  - Parallel steps

### 🧠 Use Case

- ETL pipeline with branching
- ML inference → approval → storage
- Long-running stateful processes

~~~json
{
  "StartAt": "Fetch Data",
  "States": {
    "Fetch Data": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:...",
      "Next": "Process"
    },
    "Process": {
      "Type": "Task",
      "Resource": "arn:aws:lambda:...",
      "End": true
    }
  }
}
~~~

---

## 7️⃣ Amazon EventBridge

### 🧠 What is it?

- Modern **event bus** service for:
  - App-to-app communication
  - SaaS integrations
  - Event-driven architecture

### 📌 Highlights

- Schema registry
- Filters/events based on patterns
- Integrates with 3rd party (e.g., Zendesk, Datadog)
- Replaces CloudWatch Events

~~~json
{
  "source": ["myapp.orders"],
  "detail-type": ["OrderCreated"]
}
~~~

---

## 8️⃣ AWS AppFlow

### 🔄 What is it?

- Managed service to **move data between SaaS & AWS**
- E.g., Salesforce → Redshift

### 🚀 Features

- Scheduled / event-based / on-demand flows
- Built-in transformations
- Secure data transfer

Use cases:
- CRM → S3 for analytics
- Google Analytics → Redshift

---

## 9️⃣ Amazon MWAA – Managed Workflows for Apache Airflow

### 🧠 What is MWAA?

- Fully managed **Apache Airflow** environment
- Used for **complex DAG-based orchestration**
- Ideal for:
  - ETL pipelines
  - ML workflows
  - Multi-account deployments

🛠️ AWS manages:
- Scheduler
- Workers
- Web UI
- Integration with S3, IAM, CloudWatch, etc.

---

## 🧠 TL;DR Summary

| Service        | Purpose                            | Best For                                  |
|----------------|-------------------------------------|--------------------------------------------|
| **SQS**        | Queue, async messaging              | Decoupling microservices, task queues      |
| **SNS**        | Pub/Sub notification                | Broadcasting to many consumers             |
| **DLQ**        | Capture failed messages             | Retry later / debug                        |
| **Step Functions** | Workflow orchestration          | Visual logic, retries, sequences           |
| **EventBridge**| App integration via event bus       | SaaS → AWS, decoupled events               |
| **AppFlow**    | SaaS ↔ AWS data transfer            | Salesforce, Google Sheets → Redshift       |
| **MWAA**       | DAG-based orchestration             | Advanced ETL and ML pipelines              |

---

## 💡 Real-World Examples

- 🧾 Order Service sends to **SNS**, fans out to:
  - **Lambda** for email
  - **SQS** for audit log
  - **EventBridge** for analytics triggers

- 🧪 Data pipeline:
  - Airflow (MWAA) pulls data from S3
  - Processes with EMR
  - Sends event to Step Function to store results

---
