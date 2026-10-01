#' Create a base-10 exponential transformation
#'
#' Creates a `TransformExp10` object that applies the base-10 exponential
#' function element-wise. The transformation maps from the real numbers to
#' the positive real numbers.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.transform.TransformExp10`.
#'
#' @seealso
#' See the [online documentation for `TransformExp10`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.transformexp10#torch_openreml.covariance.transform.TransformExp10)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_exp10()
#' x <- tensor(c(0.0, 1.0))
#' t(x)
#'
#' t <- transform_exp10()
#' x <- tensor(c(1.0, 10.0))
#' t$inverse(x)
#'
#' t <- transform_exp10()
#' x <- tensor(1.0)
#' t$grad(x)
#' }
#'
#' @export
transform_exp10 <- function() {
  torch_openreml$covariance$transform$TransformExp10()
}
