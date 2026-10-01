#' Create a base-2 exponential transformation
#'
#' Creates a `TransformExp2` object that applies the base-2 exponential
#' function element-wise. The transformation maps from the real numbers to
#' the positive real numbers.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.transform.TransformExp2`.
#'
#' @seealso
#' See the [online documentation for `TransformExp2`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.transformexp2#torch_openreml.covariance.transform.TransformExp2)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_exp2()
#' x <- tensor(c(0.0, 1.0))
#' t(x)
#'
#' t <- transform_exp2()
#' x <- tensor(c(1.0, 2.0))
#' t$inverse(x)
#'
#' t <- transform_exp2()
#' x <- tensor(1.0)
#' t$grad(x)
#' }
#'
#' @export
transform_exp2 <- function() {
  torch_openreml$covariance$transform$TransformExp2()
}
