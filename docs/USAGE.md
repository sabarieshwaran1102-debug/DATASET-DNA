# Usage Guide

This guide explains how to use the main functions in DatasetDNA and how to interpret the outputs.

## 1. Dataset summary

```r
summary_report <- dataset_summary(df)
```

Returns a list with:

- Rows
- Columns
- Numeric columns
- Categorical columns
- Missing values

## 2. Gene-level scores

### Quality gene

```r
quality_report <- quality_gene(df)
```

Measures:

- total missing values
- duplicate rows
- overall quality score

### Completeness gene

```r
completeness_report <- completeness_gene(df)
```

Measures the percentage of non-missing cells.

### Complexity gene

```r
complexity_report <- complexity_gene(df)
```

Includes counts of rows, columns, numeric columns, and categorical columns, then produces a complexity score.

### Balance gene

```r
balance_report <- balance_gene(df, target = "label")
```

Uses the specified target column to measure class distribution balance. If no target is specified, the last column is used by default.

### Correlation gene

```r
correlation_report <- correlation_gene(df)
```

Calculates a correlation matrix for numeric columns and returns the maximum absolute correlation and derived score.

### Readiness gene

```r
readiness_report <- readiness_gene(
  quality = quality_report$QualityScore,
  completeness = completeness_report$CompletenessScore,
  complexity = complexity_report$ComplexityScore,
  balance = balance_report$BalanceScore,
  correlation = correlation_report$CorrelationScore
)
```

This summarizes the main indicators into one readiness score.

## 3. Full report

```r
report <- dataset_dna(df, target = "label")
print(report)
```

The resulting object contains:

- DatasetSummary
- QualityGene
- CompletenessGene
- ComplexityGene
- BalanceGene
- CorrelationGene
- ReadinessGene
- OverallDNAScore
- DatasetHealth
- RecommendedModel

## 4. Recommended interpretation

The overall score is the mean of the five gene scores. Use it as a quick assessment of dataset fitness rather than as a formal statistical measure.

The package is best suited for:

- exploratory dataset review
- ML readiness checks
- comparing candidate datasets before modeling

It is not a replacement for detailed validation, feature engineering analysis, or model-specific diagnostics.
