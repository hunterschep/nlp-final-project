### 📁 Data Note

> ⚠️ The original `all-the-news-2-1-LARGE.csv` dataset is too large to upload to GitHub. A trimmed version was created locally for the final project, it is called `all-the-news-2-1-SMALL.csv`.

- You can download the original dataset from **[Kaggle](https://www.kaggle.com/datasets/davidmckinley/all-the-news-dataset)**.
- We utilize a **trimmed version** that includes only 10 selected publications.
- Both the original and trimmed datasets can be found in this **[Google Drive folder](https://drive.google.com/drive/folders/1hmPKKKQJKblbLGdHaWYjNFsaeSLIzTIc?usp=sharing)**.
- To interact with the original dataset programmatically, install [Polars](https://pola-rs.github.io/polars/) via pip:
  ```bash
  pip install polars
  ```

#### 📊 Trimmed Dataset Breakdown:
| Publication         | Article Count |
|---------------------|---------------|
| The New York Times  | 15,000        |
| The Hill            | 15,000        |
| People              | 15,000        |
| CNN                 | 15,000        |
| Vice                | 15,000        |
| Fox News            | 15,000        |
| Buzzfeed News       | 15,000        |
| Politico            | 15,000        |
| Economist           | 15,000        |
| Washington Post     | 15,000        |

> ⚠️ Even the trimmed version exceeds GitHub’s recommended size limits for versioned files. We opted not to use Git LFS—please download the data from the provided link.

# **Plan of Attack** 

# Clean the data

- **Base cleaning**:
  - Start with 2.1M articles from the All the News 2.0 dataset.
  - Select 10 sources with the highest article volume and some stylistic diversity (The New York Times, Fox News, CNN, Reuters, The Economist, People, Buzzfeed News, The Hill, Vice, Politico).
  - Remove null or empty articles, and articles in languages other than English (using language detection on titles).
  - Remove the longest 5% and shortest 5% of articles based on character length to filter out scraping errors and transcription-heavy content.
  
- **Final dataset**:
  - 10 sources, 15,000 articles each => **150,000 total articles**.
  - Reserve 1,000 articles per source for testing => **10,000 test**, **140,000 train**.

---

# Experiments

## Baseline
- **Stratified random baseline**:
  - Predict one of 10 sources at random with equal probability (10% chance each).
  - Serves as a naive lower bound.

---

## Classic ML Models

### Pipeline:

#### TF-IDF 
- **Data** → **TF-IDF Vectorizer (unigrams)** → **Naive Bayes**
- **Data** → **TF-IDF Vectorizer (unigrams + bigrams)** → **Logistic Regression**
- **Data** → **TF-IDF Vectorizer (unigrams + bigrams)** → **SVM**

#### Word2Vec 
- **Data** → **Word2Vec Vectorizer (unigrams + bigrams)** → **Logistic Regression**
- **Data** → **Word2Vec Vectorizer (unigrams + bigrams)** → **SVM**

### Notes:
- Stopwords removed only for TF-IDF models.
- All models evaluated on the same test set.

### Evaluation:
- Accuracy, precision, recall, F1-score.
- Confusion matrix to visualize performance by publication.

---

## Neural Methods

### Pipeline:
- **Data** → **Pretrained Word2Vec Embeddings (averaged)** → **Feedforward Neural Network (FFNN)**
- **Data** → **Trainable Embedding Layer (w/ max token length)** → **1D Convolutional Neural Network (CNN)**

### Notes:
- FFNN uses average of pretrained embeddings.
- CNN uses learned embeddings and filters for local patterns.

### Evaluation:
- Same metrics as above.
- Visual comparison to classic models.

---

## Transformer-based Models

### Pipeline:
- **Data** → **HuggingFace Tokenizer (BERT/DistilBERT)** → **Fine-tuned BERT or DistilBERT model**

### Notes:
- No stopword removal.
- No lowercasing or additional normalization.

### Evaluation:
- Accuracy, precision, recall, F1-score.
- Confusion matrix to analyze confusion between publications.

---

## LLM One-Shot Classification (Exploratory)

### Pipeline:
- **Data** → **Prompt Template** → **OpenAI GPT-4 (or similar) API call with 1-shot example**

### Notes:
- Not a fair baseline; used for qualitative insights.
- Results interpreted cautiously due to possible training overlap.

---

## Error Analysis
- Identify common misclassification patterns.
- Investigate confusion between specific publication pairs (e.g., CNN vs. NYT).
- Examine stylistic features (phrases, tone, article structure) in misclassified samples.
- Use insights to refine preprocessing or add rules/heuristics.

---

# Evaluation
- Majority baseline (random guess based on dataset distribution).
- Classifier comparisons across classic ML, neural, and transformer-based models.
- Primary metrics: accuracy, precision, recall, F1-score.
- Visual tools: confusion matrices, distribution plots.
- Include LLM as illustrative experiment only.



