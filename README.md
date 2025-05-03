# News Source Classification Project

## Project Overview
This project explores the classification of news articles by their source publication using various natural language processing techniques. We analyze news content from 10 major publications to identify distinctive linguistic patterns and features that allow for source attribution.

## Table of Contents
- [Installation](#installation)
- [Dataset](#dataset)
- [Project Structure](#project-structure)
- [Setup and Running](#setup-and-running)
- [Documentation](#documentation)

## Installation
To set up this project, you will need Python 3.7+ and the following key dependencies:

```bash
# Core data processing
pip install polars pandas numpy

# NLP libraries
pip install transformers datasets evaluate spacy

# For deep learning models
pip install torch scikit-learn
```

Alternatively, create a virtual environment and install all dependencies:

```bash
python -m venv env
source env/bin/activate  # On Windows: env\Scripts\activate
pip install -r requirements.txt  # If you create this file from dependencies
```

## Dataset
We use a trimmed version of the "All The News 2.0" dataset which contains news articles from 10 major publications.

### Data Acquisition
- **Option 1**: Run our data download script
  ```bash
  cd data
  bash get_data.sh
  ```
- **Option 2**: Download manually from [Google Drive](https://drive.google.com/drive/folders/1hmPKKKQJKblbLGdHaWYjNFsaeSLIzTIc?usp=sharing)
- **Option 3**: Download original dataset from [Kaggle](https://www.kaggle.com/datasets/davidmckinley/all-the-news-dataset) and process it with our scripts

> **Note**: The data files are large. The trimmed version `all-the-news-2-1-SMALL-CLEANED.csv` should be placed in the `data/` directory.

### Dataset Description
The dataset contains 100,000 news articles with 10,000 from each of the following publications:
- The New York Times
- The Hill
- People
- CNN
- Vice
- Fox News
- Buzzfeed News
- Politico
- Economist
- Reuters

Each publication has 9,000 training examples and 1,000 test examples.

## Project Structure
```
├── README.md                   # Project overview and documentation
├── plan.md                     # Detailed project plan and experiment descriptions
├── litreview.md                # Literature review of related work
├── results.md                  # Experimental results and analysis
├── preliminaries/
│   ├── prep_data.ipynb         # Data preprocessing notebook
│   └── all-the-news-2-1-*.csv  # Original and intermediate datasets
├── experiments/
│   ├── baseline/               # Random baseline experiments
│   ├── classic/                # Traditional ML approaches
│   │   ├── BoW/                # Bag of Words with different classifiers
│   │   │   ├── naive_bayes/    # Naive Bayes implementation
│   │   │   └── svm/            # SVM implementation
│   │   └── word2vec/           # Word embeddings experiments
│   ├── neural/                 # Neural network models
│   │   ├── CNN/                # Convolutional Neural Networks
│   │   └── FFNN/               # Feed-Forward Neural Networks
│   └── transformer/            # Transformer models
│       └── bert/               # BERT/DistilBERT implementations
├── data/
│   ├── get_data.sh             # Script to download cleaned dataset
│   └── all-the-news-2-1-SMALL-CLEANED.csv # The cleaned dataset (download with script)
```

## Setup and Running

### 1. Data Preparation
First, make sure you have the dataset ready:
```bash
cd data
bash get_data.sh
```

### 2. Run the Preprocessing (if starting from original data)
```bash
jupyter notebook preliminaries/prep_data.ipynb
```
This notebook handles:
- Trimming the dataset to manageable size
- Removing outlier articles (too long/short)
- Eliminating non-English content
- Creating train/test splits
- Cleaning text to remove publication identifiers

### 3. Running Experiments
Each experiment is contained in its own notebook in the respective directory:

#### Baseline Models
```bash
jupyter notebook experiments/baseline/baseline.ipynb
```

#### Traditional ML Approaches
```bash
# For Bag of Words + Naive Bayes
jupyter notebook experiments/classic/BoW/naive_bayes/naive_bayes.ipynb

# For SVM with TF-IDF
jupyter notebook experiments/classic/BoW/svm/svm.ipynb

# For Word2Vec embeddings
jupyter notebook experiments/classic/word2vec/word2vec.ipynb
```

#### Neural Networks
```bash
# For CNN models
jupyter notebook experiments/neural/CNN/cnn_classifier.ipynb

# For Feed-forward neural networks
jupyter notebook experiments/neural/FFNN/ffnn_classifier.ipynb
```

#### Transformer Models
```bash
# For BERT/DistilBERT
jupyter notebook experiments/transformer/bert/BERT.ipynb
```

## Documentation
- [Project Plan](./plan.md) - Outlines our approach, experiments, and evaluation methods
- [Literature Review](./litreview.md) - Review of related work and applicable techniques
- [Results](./results.md) - Comprehensive results of all experiments in table format

## Citation
If you use this project or the dataset, please cite:
```
Thompson, Andrew. "All The News 2.0" Kaggle, 2020.
```

