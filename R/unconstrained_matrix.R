#' Create an unconstrained symmetric covariance matrix
#'
#' Creates an `UnconstrainedMatrix` object representing a full symmetric
#' covariance matrix parameterised by its lower-triangular entries. The
#' matrix is built from the lower triangle (including the diagonal), then
#' mirrored to the upper triangle to ensure symmetry.
#'
#' Diagonal entries are transformed to positive values via `TransformExpPow2`
#' by default. Off-diagonal entries are unconstrained and use
#' `TransformIdentity`.
#'
#' By default, the matrix has `n * (n + 1) / 2` free parameters: one for
#' each lower-triangular entry.
#' 
#' This parameterisation ensures symmetry but does not guarantee positive
#' definiteness. For a positive-definite covariance matrix, consider a
#' Cholesky-based parameterisation.
#'
#' @param n The dimension of the unconstrained symmetric matrix.
#' @param param_specs Optional parameter specifications for the covariance
#'   matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.unconstrained_matrix.UnconstrainedMatrix`.
#'
#' @seealso
#' See the [online documentation for `UnconstrainedMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.unconstrainedmatrix#torch_openreml.covariance.UnconstrainedMatrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' mat <- unconstrained_matrix(3)
#' mat
#'
#' free_params <- tensor(c(0.0, 0.5, 1.0, 0.2, -0.3, 0.4))
#' mat(free_params)
#'
#' mat$grad(free_params)
#'
#' mat$set_param_specs("sigma^2_1_0", fixed = TRUE)
#'
#' mat$free_param_names
#' mat$grad()
#' }
#'
#' @export
unconstrained_matrix <- function(n, param_specs = NULL) {
  torch_openreml$covariance$UnconstrainedMatrix(as.integer(n), param_specs)
}
