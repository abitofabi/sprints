# AWS Mega Notes: EC2 Big Data + Graviton + Lambda + SAM with API Gateway, DynamoDB & Batch

---

## 1️⃣ EC2 in Big Data

- EC2 provides scalable compute power for big data workloads like Hadoop, Spark, Presto  
- Often used inside EMR (Elastic MapReduce) clusters  
- Flexible instance types tailored for CPU, memory, or storage intensive big data tasks  

---

## 2️⃣ AWS Graviton Processors

- ARM-based AWS-designed CPUs offering better price-performance than x86 for many workloads  
- Ideal for scale-out, cloud-native, containerized, and microservices workloads  
- Available as EC2 instances (e.g., M6g, C6g, R6g) and also supported in Lambda  

---

## 3️⃣ Lambda Integrations

- Lambda runs serverless functions triggered by events from many AWS services  
- Can start/stop/manage EC2 instances via SDK/API  
- Integrates with big data pipelines: triggers EMR steps, processes Kinesis streams, acts as glue in event-driven ETL  
- Perfect for microtasks, complementing long-running EC2 jobs  

---

## AWS SAM 
---

## Overview

AWS SAM (Serverless Application Model) makes deploying serverless apps super easy by extending CloudFormation syntax.

- Supports API Gateway REST/HTTP APIs  
- Runs Lambda functions  
- Manages DynamoDB tables  
- Can trigger AWS Batch jobs (via Lambda or custom resources)

---

## Architecture Snapshot

~~~
Client
  ↓
API Gateway (REST API)
  ↓
Lambda Function
  ↓          ↓
DynamoDB   AWS Batch (triggered by Lambda)
~~~

---

## 1️⃣ API Gateway + Lambda Setup

~~~
Resources:
  MyApi:
    Type: AWS::Serverless::Api
    Properties:
      StageName: Prod

  MyFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: app.lambda_handler
      Runtime: python3.9
      Events:
        ApiEvent:
          Type: Api
          Properties:
            RestApiId: !Ref MyApi
            Path: /items
            Method: get
~~~

- HTTP GET /items calls Lambda function  
- Lambda processes and responds  

---

## 2️⃣ DynamoDB Table & Lambda Integration

~~~
Resources:
  MyTable:
    Type: AWS::DynamoDB::Table
    Properties:
      TableName: MyItemsTable
      AttributeDefinitions:
        - AttributeName: id
          AttributeType: S
      KeySchema:
        - AttributeName: id
          KeyType: HASH
      BillingMode: PAY_PER_REQUEST

  MyFunction:
    Type: AWS::Serverless::Function
    Properties:
      Handler: app.lambda_handler
      Runtime: python3.9
      Environment:
        Variables:
          TABLE_NAME: !Ref MyTable
      Policies:
        - DynamoDBCrudPolicy:
            TableName: !Ref MyTable
~~~

- Lambda reads/writes DynamoDB table via env var `TABLE_NAME`  
- `DynamoDBCrudPolicy` grants necessary permissions  

---

## 3️⃣ AWS Batch Trigger via Lambda

Batch jobs aren’t defined directly in SAM, but Lambda can submit jobs using AWS SDK:

~~~
import boto3

batch = boto3.client('batch')

def lambda_handler(event, context):
    response = batch.submit_job(
        jobName='myBatchJob',
        jobQueue='MyJobQueue',
        jobDefinition='MyJobDefinition',
        containerOverrides={
            'environment': [
                {'name': 'EXAMPLE_VAR', 'value': 'example_value'}
            ],
        }
    )
    return response
~~~

- Lambda triggers heavy batch processing  
- Batch handles long-running jobs asynchronously  

---

## Quick Recap

| Service       | Role                                    |
|---------------|-----------------------------------------|
| API Gateway   | Front door REST API to invoke Lambda    |
| Lambda        | Business logic & triggers batch jobs    |
| DynamoDB      | NoSQL database storage                   |
| AWS Batch     | Managed batch compute for heavy workloads|

---

