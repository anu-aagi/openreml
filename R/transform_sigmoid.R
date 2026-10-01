#' Create a sigmoid transformation
#'
#' Creates a `TransformSigmoid` object that applies the sigmoid function
#' element-wise. The transformation maps from the real numbers to the open
#' unit interval.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.transform.TransformSigmoid`.
#'
#' @seealso
#' See the [online documentation for `TransformSigmoid`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.transformsigmoid#torch_openreml.covariance.transform.TransformSigmoid)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_sigmoid()
#' x <- tensor(c(-2.0, 0.0, 2.0))
#' t(x)
#'
#' t <- transform_sigmoid()
#' x <- tensor(c(0.1, 0.5, 0.9))
#' t$inverse(x)
#'
#' t <- transform_sigmoid()
#' x <- tensor(c(0.0, 1.0))
#' t$grad(x)
#' }
#'
#' @export
transform_sigmoid <- function() {
  torch_openreml$covariance$transform$TransformSigmoid()
}
