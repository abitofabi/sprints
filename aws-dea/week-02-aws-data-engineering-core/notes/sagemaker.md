# Amazon SageMaker Overview

---

## What is Amazon SageMaker?

- Fully managed **machine learning (ML)** platform by AWS
- Simplifies building, training, and deploying ML models at scale
- Supports the entire ML workflow from data preparation to deployment

---

## Key Components

| Component              | Description                                      |
|-----------------------|------------------------------------------------|
| **SageMaker Studio**   | Web-based IDE for ML development and monitoring |
| **SageMaker Notebooks**| Managed Jupyter notebooks                         |
| **SageMaker Training** | Managed distributed training of ML models        |
| **SageMaker Experiments** | Track and organize ML experiments              |
| **SageMaker Debugger** | Real-time debugging and profiling during training |
| **SageMaker Model Monitor** | Monitor deployed models for data drift and quality |
| **SageMaker Autopilot** | Automated ML model creation without coding      |
| **SageMaker Pipelines** | Managed ML workflow orchestration                |
| **SageMaker Feature Store** | Centralized repository to store, update, and retrieve ML features |
| **SageMaker Data Wrangler** | Visual tool to simplify data preparation and feature engineering |
| **SageMaker Model Lineage Tracking** | Track model artifacts, data, and parameters for reproducibility |
| **SageMaker Endpoint** | Fully managed scalable model hosting            |
| **SageMaker Ground Truth** | Data labeling service                           |

---

## SageMaker Workflow (Typical)

1. **Prepare data** (clean, transform, label) — *Data Wrangler helps here*
2. **Store features** in **Feature Store** for reuse and consistency
3. **Build & train models** (using built-in algorithms, custom code, or AutoML)
4. **Track experiments and lineage** to ensure reproducibility
5. **Tune & debug** training jobs
6. **Deploy models** on managed endpoints for real-time or batch inference
7. **Monitor** model performance & data drift

---

## Why SageMaker?

- Scalable & fully managed — no infra management
- Supports popular ML frameworks (TensorFlow, PyTorch, MXNet)
- Built-in algorithms, AutoML, and feature management
- Integrated with AWS security, networking, and monitoring
- Helps reduce ML time-to-market with lineage & governance

---

## Common Use Cases

- Fraud detection
- Recommendation engines
- Predictive maintenance
- Image and speech recognition
- Personalized marketing

---

## Exam Tips

- Know key SageMaker components and workflow
- Understand **Feature Store** for feature reuse & consistency
- Be aware of **Data Wrangler** for easier data prep
- Familiarize with **Model Lineage Tracking** for reproducibility
- Understand difference between training and inference
- Know **SageMaker Autopilot** for AutoML
- Recognize SageMaker Studio and Pipelines

---

