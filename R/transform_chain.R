#' Create a chained transformation
#'
#' Creates a `TransformChain` object that composes multiple transformations
#' applied sequentially. The forward transformation applies the transforms in
#' order, while the inverse transformation applies them in reverse order.
#'
#' @param chain A `Transform` object or a list or tuple of `Transform` objects
#'   to compose.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.transform.TransformChain`.
#'
#' @seealso
#' See the [online documentation for `TransformChain`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.transformchain#torch_openreml.covariance.transform.TransformChain)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_chain(list(
#'   transform_exp(),
#'   transform_pow(factor = 2.0)
#' ))
#' x <- tensor(1.0)
#' t(x)
#'
#' t <- transform_chain(list(
#'   transform_exp(),
#'   transform_pow(factor = 2.0)
#' ))
#' x <- tensor(4.0)
#' t$inverse(x)
#'
#' t <- transform_chain(list(
#'   transform_exp(),
#'   transform_pow(factor = 2.0)
#' ))
#' x <- tensor(1.0)
#' t$grad(x)
#' }
#'
#' @export
transform_chain <- function(chain) {
  torch_openreml$covariance$transform$TransformChain(chain)
}
