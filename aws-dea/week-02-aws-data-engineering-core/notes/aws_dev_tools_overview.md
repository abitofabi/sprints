# 🧰 AWS Developer Tools – Data Engineer Friendly Overview

## 🔧 1. AWS CLI (Command Line Interface)
Use it to script and automate tasks like:
```bash
# Upload file to S3
aws s3 cp myfile.csv s3://my-bucket/

# Start a Glue Job
aws glue start-job-run --job-name my-glue-job

# Run Athena query
aws athena start-query-execution \
  --query-string "SELECT * FROM my_table" \
  --result-configuration OutputLocation=s3://my-results/
```

Use for:
- Quick S3 ops
- Triggering Glue/Athena
- Automating data tasks in shell scripts

---

## 🧠 2. AWS SDKs (e.g., Boto3 for Python)
Use to integrate AWS services into Python scripts:
```python
import boto3

glue = boto3.client('glue')
response = glue.start_job_run(JobName='my-etl-job')

athena = boto3.client('athena')
athena.start_query_execution(
  QueryString='SELECT * FROM mytable',
  ResultConfiguration={'OutputLocation': 's3://results-bucket/'}
)
```

Use for:
- Event-driven jobs (e.g., via Lambda)
- Programmatic access to S3, Athena, Glue, etc.

---

## 🧱 3. AWS CDK (Cloud Development Kit)
Infra as code in Python/TS instead of YAML:
```python
from aws_cdk import aws_s3 as s3, core

class MyStack(core.Stack):
    def __init__(self, scope: core.Construct, id: str, **kwargs):
        super().__init__(scope, id, **kwargs)
        s3.Bucket(self, "MyDataBucket")
```

Use for:
- Creating S3 buckets, Glue Jobs, Lambda triggers in Python
- Modern DevOps/DataOps stack

---

## 📦 4. AWS CodeCommit
- Git-based source control (like GitHub)
- Often used in CI/CD pipelines for Glue scripts or infrastructure templates

---

## 🛠️ 5. AWS CodeBuild
- Builds/test environments (e.g., run PyTest, package Lambda, etc.)
- Mostly used in pipelines with Glue or Lambda

---

## 🚀 6. AWS CodeDeploy
- Used to automate deployments (EC2, Lambda, ECS)
- Rarely used in data workflows

---

## 🔁 7. AWS CodePipeline
- Automates CI/CD from CodeCommit → Build → Deploy
- Can be used to:
  - Trigger Glue jobs when new code is pushed
  - Automate data workflows with approvals and stages

---

## ✨ Example: Simple CodePipeline for Data ETL
- **Source**: Glue script in CodeCommit
- **Build**: CodeBuild validates JSON/YAML
- **Deploy**: Lambda triggers Glue job

---

## 🔐 IAM Roles
- All tools use IAM roles for permissions.
- e.g., CodePipeline uses a service role to trigger Lambda or Glue.

---

## 📌 TL;DR for Exam
| Tool        | Know for Exam? | Use Case                         |
|-------------|----------------|----------------------------------|
| AWS CLI     | ✅ Yes          | Scripted data tasks              |
| AWS SDKs    | ✅ Yes          | Python-based automation          |
| AWS CDK     | ⚠️ Optional     | Infra-as-code in Python          |
| CodeCommit  | ⚠️ Optional     | Git repo for Glue/Lambda scripts |
| CodePipeline| ⚠️ Optional     | CI/CD for ETL/data pipeline      |
| CodeBuild   | ❌ Not required | Build/test stage in CI/CD        |
| CodeDeploy  | ❌ Not required | App deployment (rare for DE)     |

---

