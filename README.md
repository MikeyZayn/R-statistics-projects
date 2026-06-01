# R Statistics Portfolio
This repository contains 8 mini-projects demonstrating foundational statistical analysis and data science concepts in R. Each project builds on the previous one, progressing from basic R syntax to Monte Carlo simulation and the Central Limit Theorem.

## Motivation
Built as a structured progression toward junior data science roles,
bridging theoretical statistics (probability bounds, MLE, CLT) from
coursework with applied R implementation. Each project produces
interpretable outputs with commented code explaining the statistical
reasoning behind every result.

## Projects Overview
| Project | Topic | Key Skills Demonstrated |
|---------|-------|------------------------|
| 01 | Base R EDA with mtcars | Dataframes, `$` operator, `which.min()`, `cor()`, base R plotting |
| 02 | Tidyverse EDA | `dplyr` (`group_by`, `summarise`, `filter`, `select`), `ggplot2` |
| 03 | Statistical analysis with iris | Descriptive stats, variance, ANOVA, p-value interpretation |
| 04 | Probability distributions | Bimodal distributions, QQ plots, MLE for normal parameters |
| 05 | Confidence intervals | Manual CI calculation, t-distribution, comparison with `t.test()` |
| 06 | Paired t-test | Null/alternative hypotheses, p-value interpretation, CI confirmation |
| 07 | Linear regression | Slope/intercept interpretation, R-squared, residual diagnostics |
| 08 | Monte Carlo simulation | CLT demonstration, exponential population, sampling distributions |

## Statistical Concepts Covered
- Descriptive statistics (mean, median, variance, standard deviation)
- Correlation and causality
- Hypothesis testing (ANOVA, t-test, paired design)
- Confidence intervals (95% CI, t-critical values)
- Probability distributions (normal, exponential, bimodal mixtures)
- Maximum Likelihood Estimation (MLE)
- Central Limit Theorem (CLT) via simulation
- Linear regression assumptions and diagnostics

## Technical Stack
- **Language:** R
- **Core packages:** `tidyverse` (dplyr, ggplot2), `moments` (skewness)
- **Environment:** RStudio
- **Version control:** Git + GitHub

## How to Run
1. Clone this repository
2. Open RStudio and set working directory to the project folder
3. Install required packages:
```r
   install.packages(c("tidyverse", "moments"))
```
4. Open any script and run with `Ctrl + Enter`

## Author
Final-year BSc Computer Science and Statistics student, University of Zululand.
GitHub: MikeyZayn