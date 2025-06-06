# **Plan of Attack** 

# Clean the data

- **Base cleaning**:
  - Start with 2.1M articles from the All the News 2.0 dataset.
  - Select 10 sources with the highest article volume and some stylistic diversity (The New York Times, Fox News, CNN, Reuters, The Economist, People, Buzzfeed News, The Hill, Vice, Politico).
  - Remove null or empty articles, and articles in languages other than English (using language detection on titles).
  - Remove the longest 10% and shortest 10% of articles based on character length to filter out scraping errors and transcription-heavy content.
  - Use some more advanced methods to remove "cheating" words like direct mentions to publications. See `prep_data.ipynb`
  
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
## A Rule Based Model
- **Rule based off of style guide**: 
  - Try and predict purely off of publications stylistic differences 
  - Example: the oxford comma 
  
## Classic ML Models

### Pipeline:

#### BoW (Bag of Words)
- **Data** → **BoW** → **Naive Bayes**
- **Data** → **BoW** → **SVM**

#### Word2Vec 
- **Data** → **Word2Vec Vectorizer (unigrams + bigrams)** → **Logistic Regression**
- **Data** → **Word2Vec Vectorizer (unigrams + bigrams)** → **SVM**

### Notes:
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