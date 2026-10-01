#' Create a scalar matrix
#'
#' Creates a `ScalarMatrix` object representing a scalar matrix of the
#' specified dimension.
#'
#' @param n The dimension of the scalar matrix.
#' @param param_specs Optional parameter specifications for the scalar matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.scalar_matrix.ScalarMatrix`.
#'
#' @seealso
#' See the [online documentation for `ScalarMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.scalarmatrix#torch_openreml.covariance.ScalarMatrix)
#' for details about the corresponding Python class.
#'
#' @export
scalar_matrix <- function(n, param_specs = NULL) {
  torch_openreml$covariance$ScalarMatrix(as.integer(n), param_specs)
}
