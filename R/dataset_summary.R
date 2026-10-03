
#' Dataset Summary
#'
#' Summarizes a dataset by reporting basic information.
#'
#' @param data A data frame.
#'
#' @return A list containing dataset statistics.
#' @export
dataset_summary <- function(data){

  if(!is.data.frame(data)){
    stop("Input must be a data frame.")
  }

  list(
    Rows = nrow(data),
    Columns = ncol(data),
    Numeric = sum(sapply(data, is.numeric)),
    Categorical = sum(sapply(data, function(x) is.factor(x) || is.character(x))),
    MissingValues = sum(is.na(data))
  )

}


