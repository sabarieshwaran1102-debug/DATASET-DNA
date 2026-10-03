#' Quality Gene
#'
#' Calculates a quality score for a dataset.
#'
#' @param data A data frame.
#'
#' @return A list containing quality statistics.
#' @export

quality_gene <- function(data){

  if(!is.data.frame(data)){
    stop("Input must be a data frame.")
  }

  total_cells <- nrow(data) * ncol(data)

  missing <- sum(is.na(data))

  duplicates <- sum(duplicated(data))

  quality_score <- 100 -
    ((missing / total_cells) * 50) -
    ((duplicates / max(1, nrow(data))) * 50)

  quality_score <- max(0, round(quality_score,2))

  list(
    MissingValues = missing,
    DuplicateRows = duplicates,
    QualityScore = quality_score
  )

}
