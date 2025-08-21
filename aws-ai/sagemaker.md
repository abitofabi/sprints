# 🤖 Amazon SageMaker – AWS AI Foundations Notes

---

## 💡 What is Amazon SageMaker?

Amazon SageMaker is a **fully managed service** that allows data scientists and developers to **build, train, and deploy ML models at scale**.

> 🧠 In AWS AI Foundations, you just need to know **what SageMaker does and where it fits**, not deep-dive coding or pipelines.

---

## 🔍 Key Capabilities (AIF Scope)

### 1. **Build**
- Use built-in **Jupyter Notebooks** for experimentation
- Access built-in **algorithms and frameworks** (like XGBoost, TensorFlow, etc.)

### 2. **Train**
- **Managed training jobs** on scalable infrastructure
- **Automatic Model Tuning** (hyperparameter optimization)
- Train on your own data stored in **S3**

### 3. **Deploy**
- **One-click deployment** to a hosted endpoint
- Supports **real-time inference** and **batch transform jobs**

---

## 🧩 Add-on Capabilities

| Feature | Description |
|--------|-------------|
| **SageMaker Canvas** | No-code tool for ML workflows (good for business users) |
| **SageMaker Autopilot** | Automatically builds and tunes the best ML model for your data |
| **SageMaker Model Monitor** | Detects drift in model predictions in production |
| **SageMaker Ground Truth** | Helps create high-quality labeled datasets |
| **SageMaker Studio** | Unified IDE for complete ML lifecycle |
| **SageMaker Clarify** | Explains model predictions and checks for bias |
| **SageMaker JumpStart** | Pre-trained models and solutions templates |

---

## 🎯 Why Use SageMaker?

- **End-to-end ML solution**: Everything from data prep → model training → deployment
- **Scalable and cost-effective**
- **MLOps-friendly**: Can integrate with CI/CD and pipelines

---
## 🚀 Model Deployment / Inference Types

| Inference Type        | Use Case                                | Features                                       |
|------------------------|------------------------------------------|------------------------------------------------|
| **Real-Time Inference**  | Instant predictions (low latency)        | Deploy via **endpoint**, persistent compute     |
| **Batch Transform**      | Large batch jobs, not latency-sensitive | No endpoint needed, pulls from **S3**           |
| **Asynchronous Inference** | For large payloads or longer processing time | Uses **inference queues**, responses stored in S3 |

> ✅ **Choose Real-time for chatbot use cases**, **Batch for reports or bulk processing**, and **Async for long tasks (like document/image processing)**.

---

## 📝 Foundation-Level Exam Tips

- SageMaker is used **when you want to customize ML workflows**
- For **low-code/no-code** AI → consider **SageMaker Canvas**
- For **automated ML model building** → use **SageMaker Autopilot**
- For **prebuilt models/templates** → use **SageMaker JumpStart**
- To monitor model quality post-deployment → use **SageMaker Model Monitor**
- For **training with human labeling** → use **SageMaker Ground Truth**

---

## ❗ Not Required (For AIF-C01 Level)

You are **not expected** to know:
- Python code or SageMaker SDK usage
- How to write training scripts
- Docker/container usage inside SageMaker

