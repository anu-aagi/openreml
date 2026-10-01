#' Create a power transformation
#'
#' Creates a `TransformPow` object that applies a power transformation with
#' a configurable exponent.
#'
#' Negative values raised to a non-integer exponent return `torch.nan` with
#' the same shape as the input. This can occur in both the forward and inverse
#' transformations.
#'
#' @param factor The exponent of the power transformation. Defaults to `2.0`.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.transform.TransformPow`.
#'
#' @seealso
#' See the [online documentation for `TransformPow`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.transformpow#torch_openreml.covariance.transform.TransformPow)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_pow(factor = 3.0)
#' x <- tensor(c(1.0, 2.0, 3.0))
#' t(x)
#'
#' t <- transform_pow(factor = 2.0)
#' x <- tensor(c(1.0, 4.0, 9.0))
#' t$inverse(x)
#'
#' t <- transform_pow(factor = 3.0)
#' x <- tensor(c(2.0, 3.0))
#' t$grad(x)
#' }
#'
#' @export
transform_pow <- function(factor = 2.0) {
  torch_openreml$covariance$transform$TransformPow(factor = factor)
}
