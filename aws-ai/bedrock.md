# 📊 Foundational Model Evaluation Metrics Cheat Sheet

| **Metric**     | **What it Measures**                                 | **Good Score Means**                          | **Desired Direction** |
|----------------|------------------------------------------------------|------------------------------------------------|------------------------|
| **BLEU**       | n-gram precision (word overlap with reference)       | Output shares words/phrases with reference     | **High** ⬆️            |
| **ROUGE**      | n-gram recall (esp. ROUGE-L for sequences)           | Output captures key content from reference     | **High** ⬆️            |
| **BERTScore**  | Semantic similarity via contextual embeddings (BERT) | Output *means* the same as the reference       | **High** ⬆️            |
| **Perplexity** | Confidence in predicting next word/token             | Output is fluent, natural, and confident       | **Low** ⬇️             |

---

## 🧠 Intuition:
> A **great** language model output should:
> - Use relevant and matching words → **High BLEU**
> - Cover the important content → **High ROUGE**
> - Preserve the intended meaning → **High BERTScore**
> - Be fluent and confident → **Low Perplexity**

---

## ⚠️ Heads-up:
- A **creative paraphrase** can score *low* on BLEU/ROUGE but *high* on BERTScore.
- A **repetitive or generic output** might have *low* perplexity but be *useless*.
- Best practice: **Use multiple metrics** + human evaluation 👀 for holistic judgment.

