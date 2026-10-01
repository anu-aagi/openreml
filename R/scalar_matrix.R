#' Create a scalar covariance matrix
#'
#' Creates a `ScalarMatrix` object representing a scalar covariance matrix
#' with a single variance parameter applied to every diagonal entry. The
#' variance parameter is transformed to a positive value using
#' `TransformExpPow2` by default. Off-diagonal entries are always zero.
#'
#' @param n The dimension of the scalar covariance matrix.
#' @param param_specs Optional parameter specifications for the scalar
#'   covariance matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.scalar_matrix.ScalarMatrix`.
#'
#' @seealso
#' See the [online documentation for `ScalarMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.scalarmatrix#torch_openreml.covariance.ScalarMatrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' mat <- scalar_matrix(3)
#' mat
#'
#' free_params <- tensor1d(0.5)
#' mat(free_params)
#'
#' mat$grad(free_params)
#'
#' x <- scalar_matrix(
#'   3,
#'   param_specs = list(
#'     a = list(
#'       fixed = TRUE,
#'       default = tensor1d(2),
#'       trans = transform_identity()
#'     )
#'   )
#' )
#'
#' x
#' x()
#' x$grad()
#' }
#'
#' @export
scalar_matrix <- function(n, param_specs = NULL) {
  torch_openreml$covariance$ScalarMatrix(as.integer(n), param_specs)
}
