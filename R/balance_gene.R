#' Balance Gene
#'
#' Calculates the class balance score of a dataset.
#'
#' @param data A data frame.
#' @param target Optional target column name or index used for class balance.
#'
#' @return A list containing class balance statistics.
#' @export

balance_gene <- function(data, target = NULL){

  # Check input
  if (!is.data.frame(data)) {
    stop("Input must be a data frame.")
  }

  if (nrow(data) == 0) {
    stop("Input data must contain at least one row.")
  }

  if (is.null(target)) {
    target_index <- ncol(data)
  } else {
    if (is.character(target)) {
      if (!(target %in% names(data))) {
        stop("Target column not found in the data.")
      }
      target_index <- match(target, names(data))
    } else if (is.numeric(target) && length(target) == 1) {
      if (target < 1 || target > ncol(data)) {
        stop("Target index out of range.")
      }
      target_index <- as.integer(target)
    } else {
      stop("Target must be a column name or a single column index.")
    }
  }

  target_values <- data[[target_index]]
  class_counts <- table(target_values)

  if (length(class_counts) < 2 || all(is.na(target_values))) {
    return(list(
      Target = names(data)[target_index],
      ClassDistribution = class_counts,
      LargestClass = 0,
      SmallestClass = 0,
      BalanceScore = 100
    ))
  }

  largest <- max(class_counts)
  smallest <- min(class_counts)
  balance_score <- if (largest == 0) 0 else round((smallest / largest) * 100, 2)

  list(
    Target = names(data)[target_index],
    ClassDistribution = class_counts,
    LargestClass = largest,
    SmallestClass = smallest,
    BalanceScore = balance_score
  )

}
