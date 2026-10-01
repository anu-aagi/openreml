#' Create a diagonal covariance matrix
#'
#' Creates a `DiagonalMatrix` object representing a diagonal covariance matrix
#' with one variance parameter per entry. Each diagonal entry is transformed
#' to a positive variance using `TransformExpPow2` by default.
#'
#' @param n The dimension of the diagonal covariance matrix.
#' @param param_specs Optional parameter specifications for the diagonal
#'   covariance matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.diagonal_matrix.DiagonalMatrix`.
#'
#' @seealso
#' See the [online documentation for `DiagonalMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.diagonalmatrix#torch_openreml.covariance.DiagonalMatrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' mat <- diagonal_matrix(3)
#' mat
#'
#' free_params <- tensor(c(0, 0.5, 1))
#' mat(free_params)
#'
#' mat$grad(free_params)
#'
#' mat$set_param_specs("sigma^2_0", fixed = TRUE)
#' 
#' mat$free_param_names
#' mat(tensor(c(0.5, 1)))
#' mat$grad(tensor(c(0.5, 1)))
#' }
#'
#' @export
diagonal_matrix <- function(n, param_specs = NULL) {
  torch_openreml$covariance$DiagonalMatrix(as.integer(n), param_specs)
}
