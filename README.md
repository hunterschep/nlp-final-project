Here’s a cleaner and more professional version of your README section:

---

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
| The New York Times  | 75,000        |
| The Hill            | 50,000        |
| People              | 35,000        |
| CNN                 | 30,000        |
| Vice                | 25,000        |
| Fox News            | 20,000        |
| Buzzfeed News       | 20,000        |
| Politico            | 20,000        |
| Economist           | 20,000        |
| Washington Post     | 20,000        |

> ⚠️ Even the trimmed version exceeds GitHub’s recommended size limits for versioned files. We opted not to use Git LFS—please download the data from the provided link.