# News Source Classification Project

## Project Overview
This project explores the classification of news articles by their source publication using various natural language processing techniques. We analyze news content from 10 major publications to identify distinctive linguistic patterns and features that allow for source attribution.

## Project Structure
```
├── README.md                   # Project overview and data information
├── plan.md                     # Detailed project plan and experiment descriptions
├── litreview.md                # Literature review of related work
├── preliminaries/
│   ├── prep_data.ipynb         # Data preprocessing notebook
│   ├── all-the-news-2-1-SMALL.csv        # Trimmed dataset (10 publications)
│   └── all-the-news-2-1-SMALL-CLEANED.csv # Cleaned dataset
├── experiments/
│   ├── baseline/               # Random baseline experiments
│   ├── classic/                # Traditional ML approaches (TF-IDF, Word2Vec)
│   ├── neural/                 # Neural network models
│   ├── transformer/            # BERT/DistilBERT implementations
│   └── llm/                    # Large Language Model experiments
├── data/
│   ├── get_data.sh             # A script to download `all-the-news-2-1-SMALL-CLEANED.csv`
```

## Project Documentation
- [Project Plan](./plan.md) - Outlines our approach, experiments, and evaluation methods
- [Literature Review](./litreview.md) - Informal review of related work in the field and how it could be applicable our project
- [Results](./results.md) - Some nicely formatted markdown tables to hold our results


### Data Note

> ⚠️ The original `all-the-news-2-1-LARGE.csv` dataset is too large to upload to GitHub. A trimmed version was created locally for the final project, it is called `all-the-news-2-1-SMALL.csv`. The was then cleaned into the final dataset called `all-the-news-2-1-SMALL-CLEANED.csv`

- You can download the original dataset from **[Kaggle](https://www.kaggle.com/datasets/davidmckinley/all-the-news-dataset)**.
- Alternatively you can simply run the `get_data.sh` script
- We utilize a **trimmed version** that includes only 10 selected publications.
- Both the original and trimmed datasets can be found in this **[Google Drive folder](https://drive.google.com/drive/folders/1hmPKKKQJKblbLGdHaWYjNFsaeSLIzTIc?usp=sharing)**.
- To interact with the original dataset programmatically, install [Polars](https://pola-rs.github.io/polars/) via pip:
  ```bash
  pip install polars
  ```

#### Trimmed Dataset Breakdown:
| Publication         | Train Count   | Test Count    | 
|---------------------|---------------|---------------|
| The New York Times  | 9,000         | 1,000         |
| The Hill            | 9,000         | 1,000         |
| People              | 9,000         | 1,000         |
| CNN                 | 9,000         | 1,000         |
| Vice                | 9,000         | 1,000         |
| Fox News            | 9,000         | 1,000         |
| Buzzfeed News       | 9,000         | 1,000         |
| Politico            | 9,000         | 1,000         |
| Economist           | 9,000         | 1,000         |
| Reuters             | 9,000         |  1,000        |

> ⚠️ Even the trimmed version exceeds GitHub's recommended size limits for versioned files. We opted not to use Git LFS—please download the data from the provided link.

