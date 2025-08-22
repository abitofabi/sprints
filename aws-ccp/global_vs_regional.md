# 🌎 AWS Services by Scope Cheat Sheet

Understand the scope of AWS services – whether they are Global, Regional, or Zonal – to ace your exams and build better solutions.

---

## 🌐 Global Services

These are shared across all regions. Configuration is not region-specific.

| Service                   | Description                                           |
|---------------------------|--------------------------------------------------------|
| **IAM**                   | Identity & Access Management                          |
| **Amazon Route 53**       | Global DNS & routing                                  |
| **AWS CloudFront**        | Content Delivery Network (CDN)                        |
| **AWS WAF (for CloudFront)** | Global web firewall when used with CloudFront    |
| **AWS Shield**            | DDoS protection                                       |
| **AWS Artifact**          | Compliance reports and documentation                  |
| **AWS Organizations**     | Multi-account management                              |
| **AWS Billing & Cost Explorer** | Unified billing tools                         |
| **Service Quotas (some)** | Global limits (some vary by region)                   |
| **AWS Support Plans**     | Account-level support globally                        |

---

## 🌍 Regional Services

Services that operate within a specific region but are not limited to one AZ.

| Service                    | Description                                           |
|----------------------------|--------------------------------------------------------|
| **Amazon EC2**             | Regional compute – instance runs in AZs              |
| **Amazon S3**              | Regional bucket storage                              |
| **Amazon RDS**             | Regional relational database                          |
| **Amazon DynamoDB**        | NoSQL database (global tables are cross-region)       |
| **AWS Lambda**             | Regional serverless compute                          |
| **Amazon API Gateway**     | Regional (also has edge-optimized mode)              |
| **Amazon SQS / SNS**       | Messaging & notifications                            |
| **Amazon Redshift**        | Regional data warehouse                              |
| **Amazon CloudWatch**      | Logs, metrics, alarms                                |
| **Amazon EKS / ECS / Fargate** | Containers orchestration                     |
| **AWS Glue**               | Serverless ETL service                               |
| **Amazon SageMaker**       | Machine learning & training                          |
| **AI Services (Comprehend, Polly, Translate, Rekognition)** | Regional ML       |
| **AWS Secrets Manager**    | Secrets management                                   |
| **AWS Systems Manager Parameter Store** | Config & secrets                        |
| **AWS Backup**             | Centralized backups                                  |
| **AWS Step Functions**     | Workflow orchestration                               |
| **Amazon Macie**           | Sensitive data discovery                             |
| **AWS Config**             | Resource configuration monitoring                    |
| **AWS CloudTrail**         | Regional by default (can include global events)       |
| **AWS WAF (regional)**     | If used with ALB, API Gateway, etc.                  |

---

## 🗺️ Zonal Services

Tied to a specific Availability Zone (AZ). You explicitly choose the zone.

| Service                    | Description                                           |
|----------------------------|--------------------------------------------------------|
| **Amazon EC2 Instances**   | Compute in a specific AZ                              |
| **Amazon EBS Volumes**     | Storage tied to EC2 in the same AZ                    |
| **Amazon RDS (Single-AZ)** | DB runs in one AZ (unless Multi-AZ)                  |
| **Amazon ElastiCache**     | In-memory cache in AZs                               |
| **Amazon FSx**             | File system, AZ-specific                             |
| **Amazon EFS Mount Targets** | Mount per AZ                                       |

---

## 🔑 Quick Summary

- **Global**: IAM, Route 53, Organizations, Billing – think *account-wide or identity-wide*
- **Regional**: Most services – S3, RDS, Lambda, SageMaker
- **Zonal**: Tied to infrastructure – EC2, EBS, ElastiCache

---