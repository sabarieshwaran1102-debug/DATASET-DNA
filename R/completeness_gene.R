#' Completeness Gene
#'
#' Calculates the completeness score of a dataset.
#'
#' @param data A data frame.
#'
#' @return Completeness statistics.
#' @export

completeness_gene <- function(data){

  # Check if input is a data frame
  if(!is.data.frame(data)){
    stop("Input must be a data frame.")
  }

  # Total number of cells
  total_cells <- nrow(data) * ncol(data)

  # Count missing values
  missing_values <- sum(is.na(data))

  # Available cells
  available_cells <- total_cells - missing_values

  # Completeness percentage
  completeness_score <- round(
    (available_cells / total_cells) * 100,
    2
  )

  # Return results
  list(
    TotalCells = total_cells,
    MissingValues = missing_values,
    AvailableCells = available_cells,
    CompletenessScore = completeness_score
  )

}
