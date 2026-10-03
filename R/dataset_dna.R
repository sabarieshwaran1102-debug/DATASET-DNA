#' DatasetDNA Analysis
#'
#' Performs a complete DatasetDNA analysis on a dataset.
#'
#' @param data A data frame.
#' @param target Optional target column name or index used for balance analysis.
#'
#' @return A DatasetDNA report.
#' @export

dataset_dna <- function(data, target = NULL){

  # Validate input
  if (!is.data.frame(data)) {
    stop("Input must be a data frame.")
  }

  if (nrow(data) == 0) {
    stop("Input data must contain at least one row.")
  }

  if (ncol(data) == 0) {
    stop("Input data must contain at least one column.")
  }

  #----------------------------------------------------
  # Dataset Summary
  #----------------------------------------------------

  summary_result <- dataset_summary(data)

  #----------------------------------------------------
  # DNA Gene Analysis
  #----------------------------------------------------

  quality_result <- quality_gene(data)
  completeness_result <- completeness_gene(data)
  complexity_result <- complexity_gene(data)
  balance_result <- balance_gene(data, target = target)
  correlation_result <- correlation_gene(data)

  readiness_result <- readiness_gene(
    quality = quality_result$QualityScore,
    completeness = completeness_result$CompletenessScore,
    complexity = complexity_result$ComplexityScore,
    balance = balance_result$BalanceScore,
    correlation = correlation_result$CorrelationScore
  )

  #----------------------------------------------------
  # Overall DNA Score
  #----------------------------------------------------

  dna_score <- round(mean(c(
    quality_result$QualityScore,
    completeness_result$CompletenessScore,
    complexity_result$ComplexityScore,
    balance_result$BalanceScore,
    correlation_result$CorrelationScore
  )), 2)

  #----------------------------------------------------
  # Dataset Health Status
  #----------------------------------------------------

  health_status <- if (dna_score >= 90) {
    "Excellent"
  } else if (dna_score >= 80) {
    "Healthy"
  } else if (dna_score >= 70) {
    "Moderate"
  } else if (dna_score >= 60) {
    "Needs Improvement"
  } else {
    "Critical"
  }

  #----------------------------------------------------
  # Recommended Machine Learning Model
  #----------------------------------------------------

  recommended_model <- if (complexity_result$ComplexityScore < 35) {
    "Logistic Regression / Linear Regression"
  } else if (complexity_result$ComplexityScore < 60) {
    "Decision Tree / Random Forest"
  } else {
    "XGBoost / CatBoost"
  }

  #----------------------------------------------------
  # Return Final Report
  #----------------------------------------------------

  report <- list(
    DatasetSummary = summary_result,
    QualityGene = quality_result,
    CompletenessGene = completeness_result,
    ComplexityGene = complexity_result,
    BalanceGene = balance_result,
    CorrelationGene = correlation_result,
    ReadinessGene = readiness_result,
    OverallDNAScore = dna_score,
    DatasetHealth = health_status,
    RecommendedModel = recommended_model
  )

  class(report) <- "DatasetDNA"

  return(report)

}
