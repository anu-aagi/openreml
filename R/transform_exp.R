#' Create an exponential transformation
#'
#' Creates a `TransformExp` object that applies the natural exponential
#' function element-wise. The transformation maps from the real numbers to
#' the positive real numbers.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.transform.TransformExp`.
#'
#' @seealso
#' See the [online documentation for `TransformExp`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.transformexp#torch_openreml.covariance.transform.TransformExp)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_exp()
#' x <- tensor(c(0.0, 1.0))
#' t(x)
#'
#' t <- transform_exp()
#' x <- tensor(1.0)
#' t$inverse(x)
#'
#' t <- transform_exp()
#' x <- tensor(0.0)
#' t$grad(x)
#' }
#'
#' @export
transform_exp <- function() {
  torch_openreml$covariance$transform$TransformExp()
}
