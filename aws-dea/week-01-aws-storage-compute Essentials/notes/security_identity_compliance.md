# AWS DEA - Day 4 Notes 🚀

## 1. IAM Basics Recap 👥🔐
- IAM Users: Individual identities for humans 👩‍💻👨‍💻
- IAM Groups: Collections of users with shared permissions 👯‍♀️👯‍♂️
- IAM Policies: JSON documents defining Allow ✅ or Deny ❌ actions
- Managed Policies vs Inline Policies 📄 vs ✏️
- Principle of Least Privilege ⚖️ (only give the permissions needed)

## 2. IAM Roles 🎭
- Roles provide temporary credentials for AWS services (EC2, Lambda, etc.) 🖥️🔄
- No long-term credentials; permissions granted by attached policies 🔑
- Used for secure access without embedding keys 🔒

## 3. AWS KMS (Key Management Service) 🔑🛡️
- Fully managed service for creating and managing encryption keys (CMKs) 🔐
- Supports AWS-managed and customer-managed CMKs 🧑‍💼🛠️
- Enables encryption/decryption with audit logging (CloudTrail) 📜
- Uses envelope encryption: data keys encrypt data; CMKs encrypt data keys 📦
- Integrated with many AWS services (S3, EBS, RDS, Lambda) ☁️🔗

## 4. Access Policies vs Permission Boundaries 📏🚧
- IAM Policies define permissions attached to users, groups, roles 📄
- Permission Boundaries limit the maximum permissions a user or role can have 🚫🔓
- Explicit Deny in any policy overrides Allow ❌>✅
- IAM Policy evaluation order: Deny > Allow > Implicit Deny ⚠️
- S3 Bucket Policies control access at bucket level, separate from IAM policies 🪣
- Use IAM Policy Simulator for troubleshooting access issues 🕵️‍♀️🔍

## 5. Additional Security Services 🔒✨

### Amazon Macie 🤖🔍
- ML-powered service to **discover & classify sensitive data** (PII) in S3 buckets 📊🔑
- Alerts for suspicious or risky data exposure 🚨
- Helps with compliance and data governance ✅📚

### AWS Secrets Manager 🤫🔑
- Securely **stores, manages, and rotates secrets** like DB credentials and API keys 🔐
- Integrates with AWS services and allows automatic rotation 🔄
- Avoids hardcoding secrets in code or config files 💻❌

### AWS WAF (Web Application Firewall) 🛡🌐
- Protects web apps from common exploits like SQL injection & XSS 🕷️
- Works with CloudFront, ALB, API Gateway 🚀
- Allows custom rules and managed rule sets ⚙️

### AWS Shield 🛡️
- Managed DDoS protection service 🛑
- **Shield Standard:** Automatic protection for all AWS customers 🤖
- **Shield Advanced:** Enhanced protection with attack visibility and support 🎯

---

## Quick Summary Table 📝

| Service          | Purpose                                   | Use Case                            |
|------------------|-------------------------------------------|-----------------------------------|
| Amazon Macie     | Data classification & sensitive data discovery in S3 | Detect PII exposure               |
| Secrets Manager  | Secure secret storage and rotation         | Manage DB passwords, API keys     |
| AWS WAF          | Protect web apps from exploits             | Prevent injection, bot traffic    |
| AWS Shield       | DDoS protection                            | Protect infrastructure from attacks |

---
