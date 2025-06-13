# AWS DEA - Day 6 (Light) 🧘‍♀️ - Amazon CloudWatch ☁️⏱️

Amazon CloudWatch is a **monitoring and observability** service for AWS cloud resources and applications.

---

## 🪞 Core Features

| Feature        | What It Does |
|----------------|--------------|
| **Metrics**    | Predefined performance data (e.g., EC2 CPU, Lambda Invocations) |
| **Custom Metrics** | Send your own app-specific metrics (e.g., queue size, API latency) |
| **Dashboards** | Visual dashboards to track and graph metrics |
| **Alarms**     | Automatically alert when a metric crosses a threshold |
| **Logs**       | Collect and monitor logs from EC2, Lambda, ECS, etc. |
| **Log Groups** | Organize logs into logical containers |
| **Log Streams**| Actual sequence of log events for a resource |
| **CloudWatch Agent** | Installable on EC2 to push OS-level metrics and logs |

---

## 🔔 Common Use Cases

- Monitor EC2 CPU/memory/disk
- Trigger alarm if Lambda errors spike
- Visualize app performance
- Debug apps via logs (Lambda, ECS, EC2)
- Set alarms to auto-recover EC2 if it fails

---

## 🌐 Real-World Mapping

| AWS Service | CloudWatch Use |
|-------------|----------------|
| **EC2**     | CPU metrics, disk I/O, instance recovery alarm |
| **Lambda**  | Logs, invocations, errors, duration |
| **S3**      | Bucket metrics (via CloudWatch metrics) |
| **Glue**    | Job run logs & alerts |
| **Athena**  | Query performance logs (in CloudWatch if enabled) |

---

## 🧪 Optional Hands-on Steps 

1. Launch a **t2.micro EC2** (Free Tier)
2. Go to **Monitoring** tab → View default CloudWatch metrics
3. Create a simple **Alarm** for `CPUUtilization > 10%`
4. Check **Logs** tab in Lambda (if you've used it before)

---

🎯 **Pro Tip for Exam**  
- CloudWatch = Monitoring + Logging  
- CloudTrail = Governance + Audit Logs  
→ These two are different!

---

