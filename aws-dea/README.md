# ☁️ AWS DEA Sprint (DEA-C01)

🚀 Goal: Build strong AWS foundations to clear the **AWS Certified Data Engineer – Associate** exam and apply skills in real-world data engineering projects.

🗓️ Plan: 2 hours/day · 5 days/week · 3 weeks

📚 Based on [Stephen Maarek’s AWS DEA Udemy course](https://www.udemy.com/course/aws-data-engineer-associate/)  
📁 All code, notes, and projects live in weekly folders.

---

## ✅ Week 1: Storage + Compute Essentials

| Day | Topics | Course Sections |
|-----|--------|------------------|
| 1 | S3 (Storage Classes, Lifecycle, CLI, Access Policies) | S3 |
| 2 | EBS, EFS, AWS Backup | EBS, EFS, Backup |
| 3 | EC2 Basics, AMIs, Key Pairs, IPs | EC2 |
| 4 | IAM, KMS, Roles | IAM, KMS |
| 5 | VPC, Subnets, Security Groups | VPC |

📁 Folder: `week1/`

---

## 📊 Week 2: Data Engineering Core

| Day | Topics | Course Sections |
|-----|--------|------------------|
| 1 | Glue Crawler, Catalog, ETL Jobs | Glue |
| 2 | Athena + Lake Formation | Athena, Lake Formation |
| 3 | Kinesis Data Streams + Firehose | Kinesis |
| 4 | SQS, SNS, EventBridge | Messaging |
| 5 | CloudWatch, CloudTrail | Monitoring |

📁 Folder: `week2/`

---

## 🧪 Week 3: Databases + Exam Prep

| Day | Topics | Course Sections |
|-----|--------|------------------|
| 1 | RDS, Aurora, Backups | RDS |
| 2 | DynamoDB (GSI, LSI, TTL) | DynamoDB |
| 3 | Redshift (Compression, COPY, Design) | Redshift |
| 4 | Glue Studio + Practice Mocks | Glue Studio |
| 5 | Final Mock + Revision + GitHub Cleanup | Summary |

📁 Folder: `week3/`

---

### 📝 Structure

Each week has:
- `notes.md` → Personal notes
- `code.md` → CLI/SDK practice
- `miniprojects.md` → Mini real-world scenario (optional) links

---

### 📌 Checklist Progress

- [x] Week 1: Storage & Compute  
- [ ] Week 2: Core Data Services  
- [ ] Week 3: Databases & Prep

---
# AWS DEA 4-Week Sprint Plan Summary

| Week | Day | Topic                                         | Complexity | Stephen Maarek Section(s)                   | Mini Project / Hands-on Use Case                                  |
|-------|-----|-----------------------------------------------|------------|---------------------------------------------|------------------------------------------------------------------|
| 1     | 1   | Amazon S3 Deep Dive + CLI, Storage Classes    | Easy       | Section 3: Storage                          | Create and manage S3 buckets with lifecycle policies             |
| 1     | 2   | EBS, EFS, AWS Backup                          | Medium     | Sections 5, 6, 10: EBS, EFS, Backup         | Setup EBS volumes, EFS shares, and backup plan                   |
| 1     | 3   | EC2 Basics (AMIs, Key Pairs, Elastic IPs)    | Medium     | Section 4: Compute                          | Launch EC2 instances with proper key pairs and volumes           |
| 1     | 4   | IAM, KMS, Roles for S3/EC2                    | Medium     | Sections 7, 11: IAM, KMS                    | Write IAM policies and encrypt S3 buckets using KMS keys         |
| 1     | 5   | VPC & Networking Basics (Subnets, SGs, Routes) | Medium     | Section 8: VPC                             | Design simple VPC with public/private subnets and security groups|
|-------|-----|-----------------------------------------------|------------|---------------------------------------------|------------------------------------------------------------------|
| 2     | 1   | Glue Catalog, Crawler, ETL Jobs (PySpark)     | Medium     | Section 12: Glue                           | Build ETL pipelines with Glue and PySpark                        |
| 2     | 2   | Athena, Lake Formation                         | Medium     | Sections 13, 15: Athena, Lake Formation     | Query data using Athena and secure it via Lake Formation         |
| 2     | 3   | Kinesis Data Streams & Firehose                | Hard       | Section 14: Kinesis                         | Stream data ingestion using Kinesis                              |
| 2     | 4   | SQS, SNS, EventBridge                          | Medium     | Section 16: Messaging                       | Build event-driven architecture with SQS, SNS, EventBridge      |
| 2     | 5   | CloudWatch, CloudTrail, Logs                   | Medium     | Section 18: Monitoring                      | Setup monitoring, alarms and logging                             |
|-------|-----|-----------------------------------------------|------------|---------------------------------------------|------------------------------------------------------------------|
| 3     | 1   | RDS, Aurora (HA, Backups, Failover)           | Medium     | Section 9: RDS                              | Deploy highly available RDS/Aurora cluster                       |
| 3     | 2   | DynamoDB (Partition Key, GSI, LSI, TTL)       | Medium     | Section 17: DynamoDB                        | Design NoSQL tables with proper keys and TTL                     |
| 3     | 3   | Redshift (Columnar Storage, Compression, Copy)| Hard       | Section 19: Redshift                        | Setup Redshift cluster and load compressed data                  |
| 3     | 4   | Glue Studio Visual ETL + Mock Tests            | Medium     | Sections 20, 21: Glue Studio, Practice      | Create visual ETL jobs and take practice tests                   |
| 3     | 5   | Final Mock Test + Revision + GitHub/LinkedIn Cleanup | Easy   | Summary                                   | Take final mocks, revise concepts, update portfolio              |
|-------|-----|-----------------------------------------------|------------|---------------------------------------------|------------------------------------------------------------------|
| 4     | 1   | Migration & Transfer (Snowball, DataSync)     | Medium     | Section 5: Migration & Transfer             | Simulate data migration using DataSync                           |
| 4     | 2   | Containers (ECS, EKS basics)                   | Hard       | Section 7: Containers                       | Deploy containerized app on ECS Fargate                          |
| 4     | 3   | Analytics (Athena, QuickSight intro)           | Medium     | Section 8: Analytics                        | Visualize Athena data with QuickSight                            |
| 4     | 4   | Application Integration (Step Functions, Lambda intro) | Medium | Section 9: Application Integration          | Build workflow with Step Functions and Lambda                   |
| 4     | 5   | Security, Identity & Compliance (IAM advanced, GuardDuty) | Medium | Section 10: Security, Identity & Compliance | Setup GuardDuty, create least privilege IAM policies            |
| 4     | 6   | Management & Governance (CloudTrail, Config)  | Medium     | Section 12: Management & Governance          | Configure CloudTrail and AWS Config for auditing                 |
| 4     | 7   | Machine Learning & Dev Tools (SageMaker, CodePipeline) | Hard | Sections 13 & 14: ML & Dev Tools              | Deploy SageMaker notebook, automate deployments with CodePipeline|

---

## Notes
- Complexity levels: Easy < Medium < Hard
- Mini projects focus on cost-effective hands-on practice, leveraging AWS Free Tier.
- Remember to delete AWS resources after use to avoid unexpected charges.
- This sprint plan is fully aligned with the 2025 AWS DEA-C01 exam syllabus and Stephen Maarek’s course.
- Use this as a structured roadmap to build expertise and confidence for the exam and real-world data engineering.

---

> Built with 💙 for consistency, depth, and public learning.
