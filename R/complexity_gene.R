#' Complexity Gene
#'
#' Calculates the complexity score of a dataset.
#'
#' @param data A data frame.
#'
#' @return A list containing complexity statistics.
#' @export

complexity_gene <- function(data){

  # Check whether the input is a data frame
  if(!is.data.frame(data)){
    stop("Input must be a data frame.")
  }

  # Count rows
  rows <- nrow(data)

  # Count columns
  columns <- ncol(data)

  # Count numeric columns
  numeric_columns <- sum(sapply(data, is.numeric))

  # Count categorical columns
  categorical_columns <- sum(
    sapply(data, function(x) is.factor(x) || is.character(x))
  )

  # Calculate complexity score
  complexity_score <-
    (columns * 2) +
    (numeric_columns * 3) +
    (categorical_columns * 2)

  # Limit score to 100
  complexity_score <- min(100, round(complexity_score, 2))

  # Return the result
  list(
    Rows = rows,
    Columns = columns,
    NumericColumns = numeric_columns,
    CategoricalColumns = categorical_columns,
    ComplexityScore = complexity_score
  )

}
