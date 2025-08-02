# AWS Certified AI Practitioner – Day 1
## 🧠 Topic: Prompt Engineering

---

### 📌 What is Prompt Engineering?

Prompt engineering is the practice of designing effective inputs (prompts) to get desired outputs from large language models (LLMs) like Amazon Bedrock models, ChatGPT, Claude, etc.

---

### ✍️ Key Techniques

- **Zero-shot prompting**  
  Asking a model to perform a task without any examples.

- **Few-shot prompting**  
  Giving a few examples in the prompt to guide the model on how to respond.

- **Chain-of-thought (CoT)**  
  Prompting the model to break down reasoning step-by-step to improve accuracy, especially in logic/math tasks.

- **Instruction-based prompting**  
  Clearly specifying the task using direct commands (e.g., *"Summarize this article in 3 sentences."*)

- **Role prompting**  
  Asking the model to play a specific role. (e.g., *"You are a dietitian. Recommend a 1500-cal meal plan."*)

- **Refinement**  
  Iteratively tweaking the prompt until you get the desired behavior.

---

### ✅ Best Practices

- Be **clear** and **specific** — vague prompts lead to vague answers.
- Break complex instructions into **smaller steps**.
- Use **examples** to guide the model.
- Keep **contextual consistency** in longer prompts or multi-turn conversations.
- Evaluate **accuracy, relevance, and bias** of the generated output.

---
### 🤖 LLMs Used in AWS for Prompting

- **Amazon Bedrock** supports:
  - Claude (Anthropic)
  - Titan (Amazon)
  - Command R+ (Cohere)
  - Jurassic-2 (AI21 Labs)
  - Llama (Meta, via Mistral)

---

### 🧠 Extra Note:

Prompt engineering is not just for GenAI; it's also useful when interacting with foundation models in **Bedrock**, **SageMaker JumpStart**, and **Amazon Q**.

---
### 🧪 Example Prompt (Few-shot)

