#' Create a scaled exponential transformation
#'
#' Creates a `TransformExpPow2` object that applies an exponential
#' transformation with the exponent scaled by 2. The transformation maps
#' from the real numbers to the non-negative real numbers.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.transform.TransformExpPow2`.
#'
#' @seealso
#' See the [online documentation for `TransformExpPow2`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.transformexppow2#torch_openreml.covariance.transform.TransformExpPow2)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_exp_pow2()
#' x <- tensor(c(0.0, 1.0))
#' t(x)
#'
#' t <- transform_exp_pow2()
#' x <- tensor(1.0)
#' t$inverse(x)
#'
#' t <- transform_exp_pow2()
#' x <- tensor(c(0.0, 1.0))
#' t$grad(x)
#' }
#'
#' @export
transform_exp_pow2 <- function() {
  torch_openreml$covariance$transform$TransformExpPow2()
}
