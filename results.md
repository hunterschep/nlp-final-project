# 🏆 Results

This document captures **all** experimental outcomes in one place.  
Every model‑variant gets its own subsection containing:

* **Per‑publication scores** – 1,000 held‑out articles for **each** of the ten sources.  
  `Publication | Accuracy | Precision | Recall | F1`
* **Top‑line scores** – aggregate metrics on the full 10,000‑article test set.

> ℹ️ **How to use this file:**  
> 1. Run your experiment.  
> 2. Paste the metrics into the matching table below (replace the `—` dashes).  
> 3. Commit the updated `results.md` so future readers can compare techniques at a glance.

---

## Dataset at a Glance
| Split | Articles | Per‑Class Balance |
|-------|----------|-------------------|
| Train | 90,000   | 9,000 each        |
| Test  | 10,000   | 1,000 each        |

<sub>Totals: **100,000** articles, 10 labels, perfectly stratified.</sub>

---

## Baseline 📉  (Uniform Random — “roll a d10”)

| Metric | Value |
|--------|-------|
| Fit time (s) | **0.036** |
| Score time (s) | **0.220** |
| Accuracy | **0.1018** |
| Precision (macro) | **0.1018** |
| Recall (macro) | **0.1018** |
| F1 (macro) | **0.1018** |

*No per‑class table is necessary – every label is hit ~10 % of the time by chance.*

---

# 1  Classic Methods 🧮
## 1.1 Bag‑of‑Words (BOW)

### 1.1.1 Multinomial Naïve Bayes
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | — | — | — |
| Fox News | — | — | — | — |
| CNN | — | — | — | — |
| Reuters | — | — | — | — |
| Vice | — | — | — | — |
| The New York Times | — | — | — | — |
| Politico | — | — | — | — |
| The Hill | — | — | — | — |
| The Economist | — | — | — | — |
| People | — | — | — | — |
| **Top‑Line** | — | — | — | — |

### 1.1.2 Linear SVM (BOW features)
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | — | — | — |
| Fox News | — | — | — | — |
| CNN | — | — | — | — |
| Reuters | — | — | — | — |
| Vice | — | — | — | — |
| The New York Times | — | — | — | — |
| Politico | — | — | — | — |
| The Hill | — | — | — | — |
| The Economist | — | — | — | — |
| People | — | — | — | — |
| **Top‑Line** | — | — | — | — |

---

## 1.2 Word2Vec Averages

### 1.2.1 Logistic Regression
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | — | — | — |
| Fox News | — | — | — | — |
| CNN | — | — | — | — |
| Reuters | — | — | — | — |
| Vice | — | — | — | — |
| The New York Times | — | — | — | — |
| Politico | — | — | — | — |
| The Hill | — | — | — | — |
| The Economist | — | — | — | — |
| People | — | — | — | — |
| **Top‑Line** | — | — | — | — |

### 1.2.2 SVM (RBF Kernel + W2V)
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | — | — | — |
| Fox News | — | — | — | — |
| CNN | — | — | — | — |
| Reuters | — | — | — | — |
| Vice | — | — | — | — |
| The New York Times | — | — | — | — |
| Politico | — | — | — | — |
| The Hill | — | — | — | — |
| The Economist | — | — | — | — |
| People | — | — | — | — |
| **Top‑Line** | — | — | — | — |

---

# 2  Neural Methods 🧠
## 2.1 1‑D Convolutional Neural Network (CNN‑Text)
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | — | — | — |
| Fox News | — | — | — | — |
| CNN | — | — | — | — |
| Reuters | — | — | — | — |
| Vice | — | — | — | — |
| The New York Times | — | — | — | — |
| Politico | — | — | — | — |
| The Hill | — | — | — | — |
| The Economist | — | — | — | — |
| People | — | — | — | — |
| **Top‑Line** | — | — | — | — |

## 2.2 Feed‑Forward Neural Network (FFNN)
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | 0.50 | 0.55 | 0.53 |
| Fox News | — | 0.63 | 0.54 | 0.58 |
| CNN | — | 0.64 | 0.48 | 0.55 |
| Reuters | — | 0.79 | 0.89 | 0.84 |
| Vice | — | 0.83 | 0.75 | 0.79 |
| The New York Times | — | 0.69 | 0.70 | 0.70 |
| Politico | — | 0.61 | 0.68 | 0.64 |
| The Hill | — | 0.84 | 0.79 | 0.81 |
| The Economist | — | 0.90 | 0.95 | 0.93 |
| People | — | 0.74 | 0.84 | 0.79 |
| **Top‑Line** | 0.72 | 0.72 | 0.72 | 0.71 |

---

# 3  Rule‑Based Approach ✍️ (Editorial Style Guide Rules)
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | — | — | — |
| Fox News | — | — | — | — |
| CNN | — | — | — | — |
| Reuters | — | — | — | — |
| Vice | — | — | — | — |
| The New York Times | — | — | — | — |
| Politico | — | — | — | — |
| The Hill | — | — | — | — |
| The Economist | — | — | — | — |
| People | — | — | — | — |
| **Top‑Line** | — | — | — | — |

---

# 4  Large Language Model (LLM) ⚡
## 4.1 Mistral‑7B (0‑shot, system prompt = *“Predict publisher”*)
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | — | — | — |
| Fox News | — | — | — | — |
| CNN | — | — | — | — |
| Reuters | — | — | — | — |
| Vice | — | — | — | — |
| The New York Times | — | — | — | — |
| Politico | — | — | — | — |
| The Hill | — | — | — | — |
| The Economist | — | — | — | — |
| People | — | — | — | — |
| **Top‑Line** | — | — | — | — |

---

# 5  Transformer‑Based Encoders 🦾
## 5.1 BERT (Base, uncased) + [CLS] Logistic Head
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | — | — | — |
| Fox News | — | — | — | — |
| CNN | — | — | — | — |
| Reuters | — | — | — | — |
| Vice | — | — | — | — |
| The New York Times | — | — | — | — |
| Politico | — | — | — | — |
| The Hill | — | — | — | — |
| The Economist | — | — | — | — |
| People | — | — | — | — |
| **Top‑Line** | — | — | — | — |

---

## 📌 Next Steps
1. **Run** an experiment.  
2. **Replace** the `—` placeholders with real numbers (keep three decimals).  
3. **Add** notes under the table if hyper‑parameters or tricks are critical.  