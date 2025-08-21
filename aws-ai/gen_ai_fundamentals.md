# 🌱 Fundamentals of Generative AI (Gen AI)

Generative AI is a subset of **Deep Learning**, which is itself a part of **Machine Learning**, which in turn is a part of **Artificial Intelligence (AI)**.

---

## 💡 What is Generative AI?

Generative AI models can:
- **Generate new content** like text, images, audio, code, etc.
- Learn **patterns and structures** from large datasets.
- Respond to **natural language prompts**.

> Example: ChatGPT generating a story, or DALL·E creating images from text.

---

## 🧠 Foundation Models (FMs)

Large pre-trained models that power Gen AI.
- Trained on **massive, diverse datasets**.
- Can be **fine-tuned** for specific use cases.
- Examples: GPT, Claude, Titan, Jurassic-2.

---

## 🏗️ Key Gen AI Techniques

### 📦 Transfer Learning
Use a pre-trained model and fine-tune it on task-specific data.

### 🔁 Continued Pretraining
Further train a foundation model on domain-specific data.

### 🧠 Retrieval-Augmented Generation (RAG)
Augment LLMs with **external data sources** (e.g., databases, PDFs) at inference time for updated answers.

---

## 🧪 Evaluation Metrics

| Metric       | Purpose                                     |
|--------------|---------------------------------------------|
| **BLEU**     | Compares generated output to references     |
| **ROUGE**    | Recall-based, especially in summarization   |
| **BERTScore**| Uses embeddings for semantic similarity     |
| **Perplexity**| Measures how well model predicts text       |

> A good model has **high BLEU/ROUGE/BERTScore** and **low perplexity**.

---

## 🎛️ Text Generation Parameters

| Parameter   | Controls                             | High Value Effect              |
|-------------|---------------------------------------|-------------------------------|
| **Temperature** | Creativity/randomness              | More diverse, creative output  |
| **Top-K**       | Limits sampling to top *K* words   | Sharpens response choices      |
| **Top-P**       | Nucleus sampling by cumulative prob.| Balances randomness & control  |

---

## 🧱 LLMs vs Foundation Models

| Type           | Scope                         |
|----------------|-------------------------------|
| **LLMs**       | Focused on text generation    |
| **FMs**        | Broader (text, image, code, etc.) |

---

## 🔐 Responsible AI Considerations

- **Fairness**: No biased or discriminatory output.
- **Transparency**: Explainable decisions.
- **Privacy & Security**: Protect sensitive data.
- **Accountability**: Human oversight.

---

## 🛠️ Gen AI Use Cases

- **Chatbots** and **assistants**
- **Content creation** (blogs, images)
- **Code generation**
- **Translation & summarization**
- **Medical and legal document analysis**

---

## 📌 Summary

Generative AI is reshaping how we interact with data and content. Foundation models and prompt engineering are key to unlocking its potential, and understanding the right evaluation metrics and responsible usage is essential.

