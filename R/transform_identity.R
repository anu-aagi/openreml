#' Create an identity transformation
#'
#' Creates a `TransformIdentity` object that leaves its input unchanged.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.TransformIdentity`.
#'
#' @seealso
#' See the [online documentation for `TransformIdentity`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.TransformIdentity)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_identity()
#' x <- tensor(c(0.0, 1.0, -3.5))
#' t(x)
#'
#' t <- transform_identity()
#' x <- tensor(c(2.0, -1.0))
#' t$inverse(x)
#'
#' t <- transform_identity()
#' x <- tensor(c(0.0, 1.0))
#' t$grad(x)
#' }
#'
#' @export
transform_identity <- function() {
  torch_openreml$covariance$TransformIdentity()
}
