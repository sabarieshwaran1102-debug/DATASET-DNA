#' Readiness Gene
#'
#' Estimates machine learning readiness.
#'
#' @param quality Quality score.
#' @param completeness Completeness score.
#' @param complexity Complexity score.
#' @param balance Balance score.
#' @param correlation Correlation score.
#'
#' @return Readiness statistics.
#' @export

readiness_gene <- function(
    quality,
    completeness,
    complexity,
    balance,
    correlation
){

  readiness_score <- round(mean(c(
    quality,
    completeness,
    complexity,
    balance,
    correlation
  )),2)

  status <- if(readiness_score >= 90){
    "Excellent"
  } else if(readiness_score >= 80){
    "Ready"
  } else if(readiness_score >= 70){
    "Moderate"
  } else if(readiness_score >= 60){
    "Needs Improvement"
  } else{
    "Not Ready"
  }

  list(
    ReadinessScore = readiness_score,
    Status = status
  )

}
