# AWS Monitoring, Infra as Code & Management Services

---

## 1️⃣ Amazon CloudWatch

### What is CloudWatch?

- Monitoring and observability service for AWS resources and applications
- Collects:
  - Metrics (CPU, memory, disk, network)
  - Logs (application, OS logs)
  - Events & alarms

### Key Features

- Dashboards & custom metrics
- Alarms (trigger SNS, Lambda, Auto Scaling)
- Logs insights (query logs interactively)
- Events & scheduled rules
- Container insights (ECS, EKS monitoring)

---

## 2️⃣ AWS CloudTrail

### What is CloudTrail?

- Governance, compliance, and auditing service
- Records **API calls** made in your AWS account (management & data plane)
- Captures: who did what, when, from where
- Logs stored in S3 for audit

### Use Cases

- Security analysis
- Compliance auditing
- Change tracking
- Incident investigation

---

## 3️⃣ AWS CloudFormation

### What is CloudFormation?

- Infrastructure as Code (IaC) service
- Define AWS resources via YAML or JSON templates
- Automate creation, update, and deletion of stacks
- Ensures consistent infrastructure provisioning

### Use Cases

- Automated environment setup
- Version-controlled infra
- Repeatable deployments

---

## 4️⃣ AWS Config

### What is AWS Config?

- Continuous assessment & auditing of AWS resource configurations
- Tracks configuration changes over time
- Enables compliance checks and drift detection

### Difference between CloudTrail, CloudWatch, Config:

| Service         | Purpose                        | Captures                            |
|-----------------|-------------------------------|-----------------------------------|
| CloudWatch      | Metrics & operational logs     | Resource metrics, logs, alarms    |
| CloudTrail      | API call auditing & governance | API calls and user activity logs  |
| AWS Config      | Configuration & compliance     | Resource configuration history    |

---

## 5️⃣ AWS Systems Manager Parameter Store (SSM Parameter Store)

### What is SSM Parameter Store?

- Secure storage for configuration data and secrets
- Store parameters as plain text or encrypted (KMS)
- Versioning & auditing supported
- Integrated with AWS services (Lambda, EC2, etc.)

---

## 6️⃣ Amazon Managed Grafana

### What is Managed Grafana?

- Fully managed Grafana service on AWS
- Visualize metrics, logs, traces from multiple sources
- Supports data sources like CloudWatch, Prometheus, Elasticsearch, Loki

### Use Cases

- Unified dashboards for monitoring
- Team collaboration on observability

---

## 7️⃣ Amazon DataZone

### What is Amazon DataZone?

- Data catalog & governance service (new AWS service)
- Helps organize, govern, and share data across your org
- Enables discovery of trusted datasets
- Supports data domain ownership & policy enforcement

---

## 🧠 TL;DR Summary

| Service           | Primary Use                        |
|-------------------|----------------------------------|
| CloudWatch        | Monitoring metrics & logs         |
| CloudTrail        | Auditing API calls & user actions|
| CloudFormation    | Infrastructure as Code            |
| AWS Config        | Resource config tracking & compliance|
| SSM Parameter Store| Secure config & secrets storage  |
| Managed Grafana   | Visualize & analyze metrics       |
| Amazon DataZone   | Data catalog & governance         |

---
