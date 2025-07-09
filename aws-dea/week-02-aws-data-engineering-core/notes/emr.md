# 🔥 AWS EMR (Elastic MapReduce) – Demystified

## 🧠 What is EMR?

- AWS EMR = **Managed Big Data Platform**
- Supports Apache tools like:
  - **Spark**, **Hive**, **Presto**, **Hadoop**, **HBase**, **Flink**
- Used for **ETL**, **machine learning**, **log analysis**, **big data crunching**

💡 You can choose between:
- **EMR on EC2** (cluster-based)
- **EMR Serverless** (truly serverless)

---

## 🚀 EMR Architecture – Cluster Mode (EC2-based)

| Node Type   | Role                        |
|-------------|-----------------------------|
| Master Node | Orchestrates tasks          |
| Core Node   | Runs tasks + stores HDFS    |
| Task Node   | Runs tasks (no storage)     |

📦 Can scale with Spot, On-Demand, and Reserved EC2  
🧹 You must manage provisioning, scaling, termination (unless automated)

---

## ☁️ EMR Serverless

💡 Think: **Glue-style serverless Spark/Hive**

| Feature            | EMR Serverless                              |
|--------------------|---------------------------------------------|
| Cluster setup      | ❌ None – AWS manages infra                 |
| Autoscaling        | ✅ Automatic scaling per job                |
| Tools supported    | Spark, Hive                                 |
| Pricing            | Per second for vCPU + memory used          |
| Good for           | Ad-hoc ETL, streaming, scheduled workloads  |
| Limitations        | Less control, slower cold start for large jobs |

~~~python
# PySpark in EMR Serverless
df = spark.read.json("s3://my-bucket/input/")
df.filter("event = 'purchase'").groupBy("item").count().show()
~~~

---

## 🗃️ Storage in EMR

| Type         | Used For                                | Description |
|--------------|------------------------------------------|-------------|
| **HDFS**     | Core/Task nodes (EC2 EMR only)           | Block storage tied to EC2, not durable |
| **EMRFS**    | S3-backed file system                    | Durable, supports Spark, partitioning |
| **EBS**      | Boot volumes for EC2 EMR nodes           | Fast disk, not shared |
| **Local FS** | Temp data while job runs (e.g., /tmp)    | Vanishes after node terminates |

💡 For **durability**, EMRFS with S3 is the de-facto standard now.

---

## 🤝 EMR Integrations with AWS

| Service         | Integration Use Case                               |
|------------------|-----------------------------------------------------|
| **S3**           | Store input/output data, logs                       |
| **Glue Catalog** | Schema registry for Spark, Hive, Presto             |
| **Athena**       | Query EMR output directly using SQL                 |
| **Redshift**     | Load processed data into Redshift for BI            |
| **Lake Formation** | Access control on tables, partitions in EMR jobs |
| **CloudWatch**   | Logs + metrics for EMR job monitoring               |
| **Step Functions** | Orchestrate EMR jobs with other AWS services      |
| **IAM**          | Role-based execution (service role, EC2 role, etc)  |

---

## 🆚 EMR vs EMR Serverless

| Feature             | EMR (EC2)            | EMR Serverless       |
|---------------------|----------------------|-----------------------|
| Cluster control     | Full control         | No cluster to manage  |
| Custom networking   | ✅                    | 🔸 Limited             |
| Spot instances      | ✅                    | ❌                    |
| Cold start time     | Fast (once running)  | May be slow initially |
| Cost model          | Pay per node-hour    | Pay per usage         |
| Good for            | Persistent heavy jobs| Ad-hoc or short jobs  |

---

## 🧪 Submitting Spark Jobs via CLI (EMR EC2)

~~~bash
aws emr add-steps \
  --cluster-id j-123ABC \
  --steps Type=Spark,Name="MyJob",ActionOnFailure=CONTINUE,Args=[--class,com.abinaya.App,s3://my-bucket/app.jar]
~~~

---

## 📊 Real-World Analogy

| Tool             | Analogy                                      |
|------------------|-----------------------------------------------|
| EMR (EC2)        | Renting a big kitchen – you bring ingredients, set it up |
| EMR Serverless   | Cloud kitchen – you just send the recipe      |
| Glue             | Chef who preps common meals for you           |
| Athena           | Takeout SQL – just query without any cooking  |

---

## 🧠 TL;DR Flash Notes

- EMR = Big Data platform for Spark/Hadoop/etc.
- Two modes:
  - Cluster-based (EC2)
  - Serverless (no infra to manage)
- Common Storage = S3 via EMRFS
- Integrates with Glue Catalog, Lake Formation, Redshift, Athena
- Serverless = Pay per use, easier setup, but slower for massive jobs

