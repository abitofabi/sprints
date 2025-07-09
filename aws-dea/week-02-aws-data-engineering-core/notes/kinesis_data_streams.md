# 🔄 AWS Kinesis Data Streams (KDS) – Real-time Data on Steroids

## 💡 What is Kinesis Data Streams?

- Managed **real-time data ingestion & streaming service**
- Ideal for collecting GBs of data per second from multiple sources
- Use cases: logs, clickstreams, IoT events, telemetry, social media feeds

🧠 TL;DR: Kafka-style **Pub-Sub stream**, but AWS-managed

---

## 👨‍💻 Producers (Data Writers)

Anything that **sends data** to the stream:
- Web/mobile apps
- CloudWatch Logs, IoT sensors
- Custom applications (using AWS SDK)
- Kinesis Agent (for servers/EC2 logs)
- AWS Firehose can also write to a Kinesis Stream

~~~python
# Sample producer using boto3
import boto3
client = boto3.client('kinesis')
client.put_record(
  StreamName='clickstream-data',
  Data='{"user":"abinaya","event":"viewed_product"}',
  PartitionKey='user123'
)
~~~

🪪 `PartitionKey` is used to decide which shard the data goes to.

---

## 🧑‍💻 Consumers (Data Readers)

Anything that **reads data** from the stream:
- AWS Lambda
- Kinesis Client Library (KCL)
- Kinesis Data Analytics (for real-time SQL)
- Custom apps (e.g. Spark, Flink, Python scripts)

---

## 📦 Shards: The Unit of Scaling

| Concept      | Detail |
|--------------|--------|
| Shard        | 1 write unit + 1 read unit |
| Capacity     | 1MB/sec write or 1000 records/sec<br>2MB/sec read |
| Scaling      | Add/remove shards manually or with **On-Demand** mode |
| Parallelism  | Each shard gets its own ordered stream of records |

🧱 More shards = higher throughput = more parallel processing

---

## 🚀 Enhanced Fan-Out

By default, **all consumers share the 2MB/sec read limit per shard**.

With **Enhanced Fan-Out**:
- Each consumer gets its **own 2MB/sec pipe**
- Parallel processing for multiple downstream apps

💸 But you pay per consumer + throughput

---

## 🔁 Data Retention & Replay

- Default retention: **24 hours**
- Can extend to **7 days**
- **Replay supported** → you can reprocess past events

🧠 Like a Kafka-like message log with replay built-in

---

## 🛡️ Security in Kinesis

| Area         | Features |
|--------------|----------|
| Encryption   | **At-rest**: AWS KMS integrated<br>**In-transit**: HTTPS |
| Access Control | IAM policies & roles |
| VPC Support  | Private connectivity to stream from your VPC |
| Audit        | Integrated with CloudTrail for access logs |

---

## 📈 Scaling Strategies

| Strategy               | Description |
|------------------------|-------------|
| Manual Shard Split/Merge | Add/remove shards manually |
| On-Demand Scaling        | Auto-scales shards (💰 slightly higher cost) |
| PartitionKey Tuning      | Spread data evenly to avoid "hot shards" |

---

## 🧠 Handling Stream Data

| Option              | Use Case                                |
|---------------------|------------------------------------------|
| Lambda              | Lightweight serverless processing        |
| Kinesis Data Firehose | Stream → S3/Redshift/ES (no code)       |
| Kinesis Data Analytics | Run SQL directly on the stream          |
| KCL (Java)          | Stateful, checkpointed consumers         |
| Spark / Flink       | Heavy processing, joins, aggregations    |

---

## 🔄 Flow Diagram Summary

[Producer Apps / EC2 Logs / IoT Sensors]

                    ↓
         Kinesis Data Stream
                    ↓
      ┌────────┬────────────┬────────────┐
      ↓        ↓            ↓            ↓
      Lambda Firehose Analytics KCL / Spark
                  ↓ ↓ ↓
       S3 Redshift Real-time ML, Alerts

---

## 🧠 TL;DR Flash Notes

- Kinesis = AWS-native Kafka-like service
- Stream = made of shards (scale unit)
- **PartitionKey** decides data routing
- **Lambda, KCL, Analytics** can consume
- **Enhanced Fan-Out** = better parallel read throughput
- **Encryption**: KMS + IAM + VPC + TLS
- Supports **replay** (retention = 1–7 days)
- Choose **On-Demand** mode for auto scaling

