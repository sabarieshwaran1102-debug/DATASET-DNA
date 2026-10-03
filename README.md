# DatasetDNA

DatasetDNA is a lightweight R package for quickly assessing dataset quality and machine-learning readiness. It scores the health of a dataset along several dimensions: completeness, quality, complexity, balance, and correlation.

## Why use DatasetDNA?

Before training a model, it helps to answer a few simple questions:

- Is the dataset complete enough to trust?
- Are there too many missing values or duplicate rows?
- Is the target class distribution balanced?
- Are there strong correlations that reduce feature independence?
- Is the dataset overall suitable for a machine-learning pipeline?

DatasetDNA provides a compact report to help answer those questions quickly.

## Package features

- `dataset_summary()` for size and missing-value overview
- `quality_gene()` for missing values and duplicate-row quality
- `completeness_gene()` for non-missing coverage
- `complexity_gene()` for feature complexity assessment
- `balance_gene()` for class balance using a target column
- `correlation_gene()` for numeric relationship analysis
- `readiness_gene()` for a unified readiness score
- `dataset_dna()` for a full dataset quality report

## Installation

From a local project folder:

```r
devtools::install_local(".")
```

## Quick example

```r
library(DatasetDNA)

sample_df <- data.frame(
  age = c(25, 30, 41, NA, 52, 47, 31, 44),
  income = c(50000, 65000, 70000, 80000, 91000, 62000, 72000, 68000),
  segment = c("A", "B", "A", "B", "A", "B", "A", "B"),
  churn = c("No", "Yes", "No", "Yes", "No", "No", "Yes", "No")
)

report <- dataset_dna(sample_df, target = "churn")
print(report)
```

## What the report includes

The `dataset_dna()` report contains:

- dataset summary
- quality gene
- completeness gene
- complexity gene
- balance gene
- correlation gene
- readiness gene
- overall DNA score
- dataset health status
- recommended model type

## Score interpretation

All scores are reported on a 0–100 scale, where higher scores generally indicate better quality.

- 90–100: Excellent
- 80–89: Healthy
- 70–79: Moderate
- 60–69: Needs Improvement
- Below 60: Critical

## Notes

- `target` may be supplied as a column name or index.
- The package is designed for exploratory data assessment and quick readiness checks.
- It is not a substitute for model-specific validation or a full statistical analysis workflow.

## Example dataset

A small example dataset is included in the package as a CSV file under the `inst/extdata` directory for demonstration and testing.

## Vignette

See the vignette in the `vignettes` folder for a longer walkthrough and example analysis.
