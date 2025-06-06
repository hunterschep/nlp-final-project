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

| Publication           | Accuracy | Precision | Recall | F1   |
|-----------------------|----------|-----------|--------|------|
| BuzzFeed News         | 0.246    | 0.41      | 0.25   | 0.31 |
| Fox News              | 0.703    | 0.71      | 0.70   | 0.71 |
| CNN                   | 0.244    | 0.48      | 0.24   | 0.32 |
| Reuters               | 0.768    | 0.71      | 0.77   | 0.74 |
| Vice                  | 0.440    | 0.43      | 0.44   | 0.44 |
| The New York Times    | 0.408    | 0.67      | 0.41   | 0.51 |
| Politico              | 0.505    | 0.45      | 0.51   | 0.48 |
| The Hill              | 0.613    | 0.63      | 0.61   | 0.62 |
| The Economist         | 0.723    | 0.87      | 0.72   | 0.79 |
| People                | 0.853    | 0.38      | 0.85   | 0.52 |
| **Top‑Line**          | 0.550    | 0.57      | 0.55   | 0.54 |


### 1.1.2 Linear SVM (BOW features)

| Publication           | Accuracy | Precision | Recall | F1   |
|-----------------------|----------|-----------|--------|------|
| BuzzFeed News         | 0.518    | 0.59      | 0.52   | 0.55 |
| Fox News              | 0.788    | 0.92      | 0.79   | 0.85 |
| CNN                   | 0.585    | 0.66      | 0.58   | 0.62 |
| Reuters               | 0.978    | 0.96      | 0.98   | 0.97 |
| Vice                  | 0.783    | 0.67      | 0.78   | 0.72 |
| The New York Times    | 0.767    | 0.80      | 0.77   | 0.78 |
| Politico              | 0.696    | 0.64      | 0.70   | 0.67 |
| The Hill              | 0.768    | 0.80      | 0.77   | 0.78 |
| The Economist         | 0.940    | 0.90      | 0.94   | 0.92 |
| People                | 0.826    | 0.71      | 0.83   | 0.77 |
| **Top‑Line**          | 0.760    | 0.77      | 0.76   | 0.76 |


---

## 1.2 Word2Vec Averages

### 1.2.1 Logistic Regression
| Publication           | Accuracy | Precision | Recall | F1   |
|-----------------------|----------|-----------|--------|------|
| Buzzfeed News         | 0.54     | 0.57      | 0.54   | 0.55 |
| Fox News              | 0.70     | 0.78      | 0.70   | 0.73 |
| CNN                   | 0.71     | 0.65      | 0.71   | 0.68 |
| Reuters               | 0.84     | 0.85      | 0.84   | 0.85 |
| Vice                  | 0.79     | 0.78      | 0.79   | 0.79 |
| The New York Times    | 0.68     | 0.77      | 0.68   | 0.72 |
| Politico              | 0.72     | 0.64      | 0.72   | 0.68 |
| The Hill              | 0.75     | 0.85      | 0.75   | 0.79 |
| Economist             | 0.93     | 0.84      | 0.93   | 0.89 |
| People                | 0.89     | 0.81      | 0.89   | 0.85 |
| **Top-Line**          | 0.75     | 0.76      | 0.75   | 0.75 |


### 1.2.2 SVM (RBF Kernel + W2V)

| Publication           | Accuracy | Precision | Recall | F1   |
|-----------------------|----------|-----------|--------|------|
| BuzzFeed News         | 0.498    | 0.63      | 0.50   | 0.56 |
| Fox News              | 0.728    | 0.76      | 0.73   | 0.74 |
| CNN                   | 0.725    | 0.67      | 0.72   | 0.69 |
| Reuters               | 0.911    | 0.90      | 0.91   | 0.90 |
| Vice                  | 0.813    | 0.78      | 0.81   | 0.80 |
| The New York Times    | 0.723    | 0.79      | 0.72   | 0.76 |
| Politico              | 0.705    | 0.65      | 0.70   | 0.68 |
| The Hill              | 0.784    | 0.87      | 0.78   | 0.82 |
| The Economist         | 0.950    | 0.88      | 0.95   | 0.91 |
| People                | 0.914    | 0.81      | 0.91   | 0.86 |
| **Top‑Line**          | 0.780    | 0.77      | 0.78   | 0.77 |


---

# 2  Neural Methods 🧠

## 2.1 1‑D Convolutional Neural Network (CNN‑Text)
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | 0.70 | 0.72 | 0.71 |
| Fox News | — | 0.90 | 0.91 | 0.91 |
| CNN | — | 0.83 | 0.85 | 0.84 |
| Reuters | — | 0.95 | 0.94 | 0.94 |
| Vice | — | 0.86 | 0.80 | 0.83 |
| The New York Times | — | 0.89 | 0.86 | 0.87 |
| Politico | — | 0.76 | 0.75 | 0.75 |
| The Hill | — | 0.91 | 0.88 | 0.90 |
| The Economist | — | 0.88 | 0.99 | 0.93 |
| People | — | 0.92 | 0.89 | 0.90 |
| **Top‑Line** | — | 0.8593 | 0.8586 | 0.8584 |

## 2.2 Feed‑Forward Neural Network (FFNN)
| Publication		| Accuracy | Precision | Recall | F1 |
|-------------------|----------|-----------|--------|----|
| BuzzFeed News		| — | 0.50 | 0.55 | 0.53 |
| Fox News 			| — | 0.63 | 0.54 | 0.58 |
| CNN 				| — | 0.64 | 0.48 | 0.55 |
| Reuters			| — | 0.79 | 0.89 | 0.84 |
| Vice				| — | 0.83 | 0.75 | 0.79 |
| The New York Times| — | 0.69 | 0.70 | 0.70 |
| Politico 			| — | 0.61 | 0.68 | 0.64 |
| The Hill 			| — | 0.84 | 0.79 | 0.81 |
| The Economist		| — | 0.90 | 0.95 | 0.93 |
| People			| — | 0.74 | 0.84 | 0.79 |
| **Top‑Line** 		| 0.72 | 0.72 | 0.72 | 0.71 |

---

# 3  Rule‑Based Approach ✍️ (Editorial Style Guide Rules)
| Publication | Accuracy | Precision | Recall | F1 |
|-------------|----------|-----------|--------|----|
| BuzzFeed News | — | 0.00 | 0.00 | 0.00 |
| Fox News | — | 0.00 | 0.00 | 0.00 |
| CNN | — | 0.00 | 0.00 | 0.00 |
| Reuters | — | 0.00 | 0.00 | 0.00 |
| Vice | — | 0.30 | 0.37 | 0.33 |
| The New York Times | — | 0.63 | 0.59 | 0.61 |
| Politico | — | 0.31 | 0.46 | 0.37 |
| The Hill | — | 0.35 | 0.56 | 0.43 |
| The Economist | — | 0.47 | 0.17 | 0.25 |
| People | — | 0.16 | 0.71 | 0.26 |
| **Top‑Line** | — | 0.22 | 0.29 | 0.23 |


---

# 5  Transformer‑Based Encoders 🦾
## 5.1 BERT (Base, uncased)

> **Note:** We were only able to obtain the top-line accuracy of **0.94** before being kicked off Colab. We hope to retrain and collect full per-class metrics before final submission.

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
| **Top‑Line** | — |  — | — | — |
|  | **0.94** |  — | — | — |

  
