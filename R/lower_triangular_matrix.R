#' Create a lower triangular matrix
#'
#' Creates a `LowerTriangularMatrix` object representing an `n x m` lower
#' triangular matrix parameterised by its lower-triangular entries. The matrix
#' has free parameters for all entries on or below the diagonal (i.e.,
#' `j <= i` and `j < m`). Entries above the diagonal are fixed at zero:
#'
#' \deqn{L_{ij} = \theta_{ij} \text{ if } i \ge j \text{ and } j < m, \quad 0 \text{ if } i < j}
#'
#' All parameters (including diagonal entries) are unconstrained and use
#' `TransformIdentity` by default.
#'
#' By default, the matrix has free parameters for all entries on or below the
#' diagonal, all using `TransformIdentity` (unconstrained).
#'
#' @param n Number of rows.
#' @param m Number of columns.
#' @param param_specs Optional parameter specifications for the matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.lower_triangular_matrix.LowerTriangularMatrix`.
#'
#' @seealso
#' See the [online documentation for `LowerTriangularMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.lowertriangularmatrix#torch_openreml.covariance.LowerTriangularMatrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' mat <- lower_triangular_matrix(3, 2)
#' mat
#'
#' free_params <- tensor(c(0.0, 0.5, 1.0, 0.2, -0.3))
#' mat(free_params)
#'
#' mat$grad(free_params)
#'
#' mat$set_param_specs("L_1_0", fixed = TRUE)
#'
#' mat$free_param_names
#' mat$grad()
#' }
#'
#' @export
lower_triangular_matrix <- function(n, m, param_specs = NULL) {
  torch_openreml$covariance$LowerTriangularMatrix(as.integer(n),
                                                  as.integer(m),
                                                  param_specs)
}
