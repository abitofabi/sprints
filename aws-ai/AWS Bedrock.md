# 📘 Amazon Bedrock – Study Notes

---

## 🔹 What is Amazon Bedrock?

- Fully managed **serverless** service to build and scale **generative AI** applications.
- Provides API-based access to multiple **foundation models (FMs)** from top model providers.
- No need to manage infrastructure or fine-tune from scratch.
- Great for **quick experimentation and production-grade GenAI use cases**.

---

## 🔹 Key Foundation Model Providers

- **Anthropic Claude** – Safe conversational models.
- **Meta Llama 2 & 3** – Open-source instruction-following models.
- **Cohere Command R+** – RAG-optimized models.
- **Mistral** – Lightweight, high-performance open models.
- **Stability AI** – Text-to-image generation.
- **Amazon Titan** – AWS’s own family of LLMs.

---

## 🔹 Core Features

### ✅ 1. **Choice of Models**
- Easily swap models without rewriting code.
- Ideal for experimenting with different models for use cases like summarization, Q&A, and generation.

### ✅ 2. **API-first Design**
- Standardized API regardless of model.
- Supports prompt-based interaction, embeddings, and image generation.

### ✅ 3. **Customization**
- **Prompt Engineering** – Fine-tune model behavior using examples and instructions.
- **Fine-tuning (Supervised)** – Customize a base model with your own dataset.
- **RAG (Retrieval-Augmented Generation)** – Augment LLM responses with external knowledge via Amazon OpenSearch, RDS, Aurora, etc.

### ✅ 4. **Security & Compliance**
- Built-in support for **IAM**, **VPC**, **encryption**, **data retention control**.
- Data is **not stored or used** for model training unless explicitly allowed.

---

## 🛠️ Add-on Capabilities in Bedrock

### 🧠 Amazon Bedrock **Agents**
- **Agents for Amazon Bedrock** can *automatically execute tasks* based on user input.
- Uses a **tool-calling mechanism** + orchestration logic (like a smart chatbot with plugins).
- Example: Booking a flight → uses API calls to fetch and confirm bookings via a backend service.

### 🔒 Amazon Bedrock **Guardrails**
- Help **filter out harmful, biased, or non-compliant responses**.
- Customizable settings for:
  - Profanity, hate speech, violence, etc.
  - Denial or redaction of specific topics.
- Easy to enable per application, with auditing support.

### 💅 Amazon Bedrock **AI Stylists** (in preview)
- Used to **refine the style and tone** of LLM-generated text.
- Helps match brand voice or simplify technical jargon for different audiences.
- Example: Convert a formal product description into a fun Gen Z tone.

---

## 🧰 Integration with Other AWS Services

| Service         | Purpose                                  |
|-----------------|------------------------------------------|
| Amazon Kendra   | Semantic search for RAG                  |
| Amazon OpenSearch | Vector DB support                       |
| Amazon S3       | Store fine-tuning and RAG data           |
| Amazon Lambda   | Serverless orchestration for agents      |
| Amazon CloudWatch | Logs and performance monitoring         |
| AWS IAM         | Access control and permissions           |

---

## 💡 Use Cases

- Customer chatbots
- Knowledge assistants with RAG
- Code and content generation
- Sentiment-aware email generators
- Creative campaigns using stylist and image generation

---

## 📌 Quick Comparison

| Bedrock                        | SageMaker                         |
|-------------------------------|-----------------------------------|
| Use existing FMs (API-based)  | Train and deploy custom ML models |
| No infrastructure setup       | Full control over training infra  |
| Ideal for GenAI apps          | Ideal for MLOps & model lifecycle |
| No ML expertise required      | Suited for ML practitioners       |

---

## ✅ AWS AI Practitioner Exam Tips

- Bedrock = *consume* Foundation Models easily via API.
- Know **Agents**, **Guardrails**, and **RAG** use cases.
- It’s **serverless**, **multi-model**, and **secure by default**.
- If the question involves **GenAI + no infra work**, it’s probably Bedrock.
