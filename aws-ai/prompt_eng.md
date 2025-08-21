# 🧠 Prompt Engineering – Study Notes

---

## 🔹 What is Prompt Engineering?

- Technique to design and structure **inputs (prompts)** for large language models (LLMs).
- Helps guide LLMs (like those in Amazon Bedrock) to generate **relevant, high-quality, and controlled outputs**.
- Crucial when using **foundation models** where model parameters are frozen and behavior is influenced by input prompts alone.

---

## ✍️ Prompt Types

### ✅ Zero-shot Prompting
- No example provided.
- Just a clear instruction.
- **Example:**
  > "Translate this sentence to French: 'Good morning, how are you?'"

### ✅ One-shot Prompting
- One example given before the main input.
- Helps model understand the expected structure or behavior.
- **Example:**
Translate English to Tamil:
English: How are you?
Tamil: எப்படி இருக்கிறீர்கள்?



### ✅ Few-shot Prompting
- Several examples provided to guide model behavior.
- Improves quality when task is nuanced.
- **Best used when model isn’t performing well with zero-shot.**

---

## 🛠️ Prompt Engineering Techniques

### 🎯 Instruction Tuning
- Clearly instruct the model what to do.
- **Clarity matters**: use specific verbs (e.g., summarize, classify, translate, generate).

### 🔁 Reframing Prompts
- Rewrite or rephrase a prompt to improve accuracy or creativity.

### 🧩 Chain-of-Thought Prompting (CoT)
- Encourage the model to **reason step-by-step** before reaching the answer.
- **Example:**
> "If Tom has 3 apples and gets 2 more, how many apples does he have now? Let's think step by step."

### 🛍️ Role Assignment
- Assign a role to the model to add context.
- **Example:**
> "You are a nutritionist. Suggest a 1500-calorie meal plan for a vegetarian."

### 🔄 Iterative Prompting
- Use multiple rounds of prompts and refine based on feedback or error.
- Often used in **RAG-based agents** and **agentic workflows**.

---

## 📏 Sampling Control Techniques

| Parameter     | Purpose                                        |
|---------------|------------------------------------------------|
| **Temperature** | Controls randomness. Higher = more creative. Lower = more focused. |
| **Top-k**       | Chooses next token from top *k* candidates. |
| **Top-p (Nucleus)** | Chooses from smallest set of tokens whose total probability is ≥ *p*. |

**Tip:**
- Use lower temperature (e.g., 0.2–0.5) for predictable, consistent output.
- Use higher temperature (e.g., 0.8–1.0) for creativity or ideation tasks.

---

## 🧪 Evaluation Tips

- Test prompts iteratively to check model responses.
- Avoid ambiguity and overly broad phrasing.
- Use **Guardrails** if prompt risks include bias, toxicity, or hallucination.

---

## 🧠 Best Practices

- Be **clear, concise, and contextual**.
- Prefer **positive prompts** (e.g., "Summarize this article") over vague ones ("What does this say?").
- When confused output appears, **break tasks into subtasks**.
- Use **system instructions** or **prefix roles** if model supports them.

---

## ✅ AWS AI Practitioner Exam Tips

- Prompt engineering is key to influencing output without retraining.
- Know difference between zero, one, and few-shot examples.
- Parameters like **temperature**, **top-p**, and **top-k** control generation style.
- Prompt engineering is **inference-time customization** (vs. fine-tuning which is model training).
