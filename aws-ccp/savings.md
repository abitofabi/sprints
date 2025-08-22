# 💰 Compute Savings Plan vs Reserved Instances (RIs) in AWS

Both are **cost-saving models** that offer **discounts over On-Demand pricing**, but they differ in **flexibility and commitment**.

---

## 🔄 1. AWS Compute Savings Plan

### ✅ What is it?
- A **flexible pricing model** where you commit to a **specific amount ($/hour)** for 1 or 3 years.
- Works **across instance families, regions, OS, and tenancy**.

### ✅ Key Features
- **More flexible** than RIs
- Covers:
  - EC2 (regardless of instance type/region)
  - Fargate
  - Lambda
- **Applies automatically** to usage that matches the plan
- **No need to specify instance type or AZ**

### 🧠 Use When:
- You want **flexibility**
- You may **change regions, instance types**, or switch between EC2, Fargate, or Lambda

---

## 📦 2. Reserved Instances (RIs)

### ✅ What is it?
- **Reservation of a specific EC2 instance type**, region, platform, and tenancy for 1 or 3 years.

### ✅ Key Features
- **Less flexible**, but offers **higher savings** (up to 75%)
- Available in:
  - **Standard RIs** – higher discount, less flexible
  - **Convertible RIs** – allow some modification (e.g., instance family change)

### 🧠 Use When:
- Your **compute usage is predictable**
- You can **commit to a specific instance type and region**
- You want **maximum savings**

---

## 🔍 Quick Comparison Table

| Feature                  | Compute Savings Plan             | Reserved Instances                   |
|--------------------------|----------------------------------|---------------------------------------|
| Flexibility              | ✅ High                          | ❌ Low (Standard), Medium (Convertible) |
| Applies to               | EC2, Fargate, Lambda             | EC2 only                              |
| Commitment               | $/hr spend                       | Specific instance type & region       |
| Discount Level           | Moderate (up to ~66%)            | High (up to 75%)                      |
| Modification             | Not needed (auto-applies)        | Convertible RIs allow limited changes |
| Complexity               | Simple to manage                 | More complex to manage                |

---

## 📝 CCP Exam Tip:

> If the scenario talks about **flexibility**, choose **Compute Savings Plan**.  
> If it's about **specific predictable instance usage**, go with **Reserved Instances**.

---