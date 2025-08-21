# 🤖 AWS AI Practitioner – Core Machine Learning Concepts

---

## 🧠 What is Machine Learning?

> Machine Learning (ML) enables computers to **learn from data and make predictions or decisions** without being explicitly programmed.

---

## 📊 Types of Machine Learning

| Type | Description | Example |
|------|-------------|---------|
| **Supervised Learning** | Model learns from labeled data (input → output known) | Spam detection, sentiment analysis |
| **Unsupervised Learning** | Model finds hidden patterns in unlabeled data | Customer segmentation (e.g., K-Means clustering) |
| **Reinforcement Learning** | Agent learns by taking actions in an environment to maximize rewards | Game AI, robotics |
| **Self-Supervised Learning** | Used in Foundation Models. Models learn by predicting part of the input from the rest. | Pretraining LLMs (e.g., predicting next word) |

---

## 🧮 Common Algorithms (Know the Basics)

| Algorithm | Type | Use Case |
|-----------|------|----------|
| **Linear Regression** | Supervised | Predicting continuous values (e.g., house prices) |
| **Logistic Regression** | Supervised | Binary classification (e.g., spam or not spam) |
| **K-Means Clustering** | Unsupervised | Grouping similar data points (e.g., customer types) |
| **Neural Networks** | Supervised / Unsupervised | Complex tasks like image recognition, NLP |

---

## 📏 Evaluation Metrics

### 📈 Classification Metrics (Supervised Learning)

| Metric | Meaning | Good When |
|--------|---------|-----------|
| **Accuracy** | % of correct predictions | Balanced classes |
| **Precision** | TP / (TP + FP) → How many predicted positives are correct | Want fewer false positives |
| **Recall** | TP / (TP + FN) → How many actual positives are caught | Want fewer false negatives |
| **F1 Score** | Harmonic mean of Precision & Recall | Classes are imbalanced |
| **Confusion Matrix** | Table showing TP, FP, FN, TN | Visualizing classification performance |

> ✅ **F1 Score** is preferred when you want balance between precision and recall.

---

### 📉 Regression Metrics (Supervised Learning)

| Metric | Description |
|--------|-------------|
| **MAE (Mean Absolute Error)** | Average absolute error |
| **MSE (Mean Squared Error)** | Average of squared errors |
| **RMSE (Root MSE)** | Square root of MSE |
| **MAPE (Mean Absolute Percentage Error)** | % error relative to actuals |

> Use **MAPE** when values have different scales (percentage error).

---

## 🧠 Neural Networks Basics

- **Neurons**: The building blocks (like brain cells)
- **Layers**: Input → Hidden → Output
- **Weights & Biases**: Learn patterns from data
- **Activation Functions**: Help learn complex patterns (e.g., ReLU, Sigmoid)

---

## 📌 Quick Concepts for the Exam

- **Feature Engineering**: Selecting or transforming data features
- **Overfitting**: Model performs well on training but poorly on new data
- **Underfitting**: Model is too simple and misses patterns
- **Training vs Inference**:
  - *Training*: Learning from data
  - *Inference*: Making predictions using a trained model

---

## 🔥 Extra AWS Terms (AI Foundations)

| Term | Meaning |
|------|---------|
| **Inference** | Using model to make predictions |
| **Training Data** | Data used to teach the model |
| **Test Data** | Used to evaluate model performance |
| **Validation Data** | Fine-tuning hyperparameters |

---
## 🎯 Overfitting vs Underfitting – Bias-Variance Tradeoff

| Condition      | Bias        | Variance     | Description |
|----------------|-------------|--------------|-------------|
| **Overfitting** | Low Bias     | **High Variance** | Model memorizes training data, performs poorly on new data. |
| **Underfitting** | **High Bias** | Low Variance | Model is too simple, can't capture data patterns. |

📌 **Bias** = Error due to oversimplifying the model  
📌 **Variance** = Error due to model sensitivity to training data

