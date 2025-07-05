# 🔐 AWS IAM – Notes & Cheat Sheet

**IAM (Identity and Access Management)** is AWS's service for controlling access to AWS resources securely.

---

## 🧠 Core Concepts

| Term | Description |
|------|-------------|
| **IAM User** | Represents a person/application with long-term credentials |
| **IAM Group** | Collection of users — attach policies to group |
| **IAM Role** | Temporary access — assumed by services, users, or other AWS accounts |
| **IAM Policy** | JSON document that defines **permissions** |
| **Principal** | Who is making the request (user, role, federated identity) |
| **Resource** | What is being accessed (S3 bucket, EC2 instance, etc.) |
| **Action** | What operation is being requested (e.g., s3:GetObject) |
| **Effect** | `Allow` or `Deny` |

---

## 🧾 IAM Policy Structure (Example)

Indent instead of code block to avoid markdown issues:

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "s3:ListBucket",
          "Resource": "arn:aws:s3:::my-bucket"
        }
      ]
    }

---

## 🔐 IAM Permissions Types

| Type | Description |
|------|-------------|
| **Identity-based** | Attach policy to user, group, or role |
| **Resource-based** | Attach policy directly to the AWS resource (e.g., S3 bucket policy) |
| **Session-based** | Temporary permissions via STS or assumed roles |
| **Permission boundaries** | Set max allowed permissions for a role/user (like a fence) |
| **Service control policies (SCP)** | Org-wide policy for all accounts under AWS Organizations |
| **ACLs** | Legacy — used mainly in S3 or some networking contexts |
| **VPC endpoint policies** | Restrict what resources can be accessed through the endpoint |

---

## 👮 Explicit Deny Wins

AWS evaluates permissions in this order:

1. ✅ If any explicit Deny exists → access denied
2. ✅ If an Allow exists → access allowed
3. ❌ No match → access denied (default deny)

---

## 🔄 IAM Roles vs IAM Users

| IAM Users | IAM Roles |
|-----------|-----------|
| Long-term credentials | Temporary credentials |
| Tied to a person or app | Assumed by services or identities |
| Manual credential management | Safer, auto-rotated temporary creds |
| Not ideal for automation | Preferred for automation, services |

---

## 🔄 Common Use Cases for Roles

| Use Case | Role Type |
|----------|-----------|
| EC2 accessing S3 | EC2 Role |
| Lambda accessing DynamoDB | Lambda Execution Role |
| Cross-account access | Cross-account Role |
| SSO / Google login | Federated Identity Role |
| One service assumes another’s role | Service Role |

---

## 🧩 Inline vs Managed Policies

| Type | Description |
|------|-------------|
| **Managed Policy** | Reusable and attachable to multiple entities |
| **Inline Policy** | One-off, embedded directly in a user/group/role |
| Best Practice | Prefer **managed policies** for auditability |

---

## 🗝️ Best Practices

- Enforce MFA for root and users
- Grant **least privilege** only
- Don’t use root account for daily tasks
- Use roles (not users) for automation
- Monitor via CloudTrail, IAM Access Analyzer
- Rotate access keys
- Use IAM conditions (IP, tags, time)

---

## 📌 Common IAM Condition Keys

| Condition Key | Purpose |
|---------------|---------|
| `aws:SourceIp` | Restrict access by IP |
| `aws:username` | Apply logic based on user |
| `aws:CurrentTime` | Time-based access control |
| `aws:MultiFactorAuthPresent` | Enforce MFA for sensitive ops |

---

## 💡 Real-World Scenarios

- EC2 app accessing S3 → Use EC2 role with proper policy
- Lambda logging to CloudWatch → Attach `AWSLambdaBasicExecutionRole`
- Give read-only S3 to analyst → Attach `AmazonS3ReadOnlyAccess`
- Secure cross-account admin → Use `AssumeRole` with trust policy

---

## 🧠 TL;DR Summary

| Concept | Summary |
|--------|---------|
| IAM = Identity + Permissions | Central auth layer for AWS |
| Use roles > users | More secure, temporary credentials |
| Deny > Allow | Explicit deny always wins |
| Policies = JSON permissions | Use managed wherever possible |
| Always enforce MFA + least privilege | Essential best practice |

---

> ✅ IAM is the gatekeeper of AWS. Knowing it inside-out sets the foundation for all secure cloud architectures.
