#' Print DatasetDNA Report
#'
#' Prints a formatted DatasetDNA report.
#'
#' @param x DatasetDNA object.
#' @param ... Additional arguments.
#'
#' @export

print.DatasetDNA <- function(x, ...){

  cat("\n")
  cat("========================================\n")
  cat("         DatasetDNA Report\n")
  cat("========================================\n\n")

  cat("Dataset Summary\n")
  cat("----------------------------------------\n")
  cat("Rows                :", x$DatasetSummary$Rows, "\n")
  cat("Columns             :", x$DatasetSummary$Columns, "\n")
  cat("Numeric Columns     :", x$DatasetSummary$Numeric, "\n")
  cat("Categorical Columns :", x$DatasetSummary$Categorical, "\n")
  cat("Missing Values      :", x$DatasetSummary$MissingValues, "\n\n")

  cat("Quality Gene\n")
  cat("----------------------------------------\n")
  cat("Quality Score       :", x$QualityGene$QualityScore, "\n\n")

  cat("Completeness Gene\n")
  cat("----------------------------------------\n")
  cat("Completeness Score  :", x$CompletenessGene$CompletenessScore, "\n\n")

  cat("Complexity Gene\n")
  cat("----------------------------------------\n")
  cat("Complexity Score    :", x$ComplexityGene$ComplexityScore, "\n\n")

  cat("Balance Gene\n")
  cat("----------------------------------------\n")
  cat("Balance Score       :", x$BalanceGene$BalanceScore, "\n\n")

  cat("Correlation Gene\n")
  cat("----------------------------------------\n")
  cat("Correlation Score   :", x$CorrelationGene$CorrelationScore, "\n")
  cat("Status              :", x$CorrelationGene$Status, "\n\n")

  cat("Readiness Gene\n")
  cat("----------------------------------------\n")
  cat("Readiness Score     :", x$ReadinessGene$ReadinessScore, "\n")
  cat("Status              :", x$ReadinessGene$Status, "\n\n")

  cat("----------------------------------------\n")
  cat("Overall DNA Score   :", x$OverallDNAScore, "\n")
  cat("Dataset Health      :", x$DatasetHealth, "\n")
  cat("Recommended Model   :", x$RecommendedModel, "\n")
  cat("========================================\n")

}
