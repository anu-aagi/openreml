#' Create an equicorrelation covariance matrix
#'
#' Creates an `EquicorrelationMatrix` object representing an equicorrelation
#' matrix with a single shared correlation parameter. All diagonal entries
#' equal one and all off-diagonal entries equal the correlation `rho`.
#'
#' The matrix is defined as
#' \deqn{V = (1 - \rho) I_n + \rho J_n,}
#' where \eqn{I_n} is the identity matrix and \eqn{J_n} is the matrix of ones.
#' For positive definiteness,
#' the correlation must satisfy `rho > -1 / (n - 1)`. The default transform
#' enforces this by mapping an unconstrained scalar through a sigmoid scaled
#' to `(-1 / (n - 1), 1)`.
#'
#' Unlike `compound_symmetric_matrix()`, this matrix has no variance
#' parameter.
#'
#' @param n The dimension of the equicorrelation matrix.
#' @param param_specs Optional parameter specifications for the covariance
#'   matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.equicorrelation_matrix.EquicorrelationMatrix`.
#'
#' @seealso
#' See the [online documentation for `EquicorrelationMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.equicorrelationmatrix#torch_openreml.covariance.EquicorrelationMatrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' mat <- equicorrelation_matrix(3)
#' mat
#'
#' free_params <- tensor(0.0)
#' mat(free_params)
#'
#' mat$grad(free_params)
#'
#' mat$set_param_specs("rho", fixed = TRUE)
#'
#' mat$free_param_names
#' mat(tensor(array(0.25)))
#' mat$grad(tensor(array(0.25)))
#' }
#'
#' @export
equicorrelation_matrix <- function(n, param_specs = NULL) {
  torch_openreml$covariance$EquicorrelationMatrix(as.integer(n), param_specs)
}
