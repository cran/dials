#' Number of knots (integer)
#'
#' The number of knots used for spline model parameters.
#'
#' @inheritParams Laplace
#' @details
#' One context in which this parameter is used is spline basis functions.
#' @examples
#' num_knots()
#' @export
num_knots <- function(range = c(0L, 5L), trans = NULL) {
  new_quant_param(
    type = "integer",
    range = range,
    inclusive = c(TRUE, TRUE),
    trans = trans,
    label = c(num_knots = "Number of knots"),
    finalize = NULL
  )
}
