#' Correlation Gene
#'
#' Calculates correlation statistics for numeric variables.
#'
#' @param data A data frame.
#'
#' @return Correlation statistics.
#' @export

correlation_gene <- function(data){

  # Check input
  if (!is.data.frame(data)) {
    stop("Input must be a data frame.")
  }

  if (nrow(data) == 0) {
    stop("Input data must contain at least one row.")
  }

  # Select only numeric columns
  numeric_data <- data[sapply(data, is.numeric)]

  # If no sufficient numeric data is available, return a non-failing default
  if (ncol(numeric_data) < 2) {
    return(list(
      MaximumCorrelation = 0,
      CorrelationScore = 100,
      Status = "No numeric correlation detected",
      CorrelationMatrix = NULL
    ))
  }

  # Calculate correlation matrix
  corr_matrix <- cor(numeric_data, use = "pairwise.complete.obs")

  # Ignore self-correlation
  diag(corr_matrix) <- 0

  # Maximum absolute correlation
  max_corr <- max(abs(corr_matrix), na.rm = TRUE)

  # Correlation score (0–100)
  correlation_score <- round((1 - min(max_corr, 1)) * 100, 2)

  # Correlation status
  status <- if (correlation_score >= 80) {
    "Excellent"
  } else if (correlation_score >= 60) {
    "Good"
  } else if (correlation_score >= 40) {
    "Moderate"
  } else {
    "High Correlation"
  }

  # Return results
  list(
    MaximumCorrelation = round(max_corr, 2),
    CorrelationScore = correlation_score,
    Status = status,
    CorrelationMatrix = corr_matrix
  )

}
