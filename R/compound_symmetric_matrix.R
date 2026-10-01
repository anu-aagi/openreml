#' Create a compound symmetric covariance matrix
#'
#' Creates a `CompoundSymmetricMatrix` object representing a compound
#' symmetric covariance matrix with a shared variance and correlation.
#' The diagonal entries are equal to the variance, while the off-diagonal
#' entries are equal to the variance multiplied by the correlation.
#'
#' The variance parameter is transformed to a positive value using
#' `TransformExpPow2` by default. The correlation parameter is transformed
#' using a sigmoid scaled to the interval `(-1 / (n - 1), 1)` to ensure
#' positive definiteness.
#'
#' @param n The dimension of the compound symmetric covariance matrix.
#' @param param_specs Optional parameter specifications for the covariance
#'   matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.compound_symmetric_matrix.CompoundSymmetricMatrix`.
#'
#' @seealso
#' See the [online documentation for `CompoundSymmetricMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.compoundsymmetricmatrix#torch_openreml.covariance.CompoundSymmetricMatrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' mat <- compound_symmetric_matrix(3)
#' mat
#'
#' free_params <- tensor(c(0.5, 0))
#' mat(free_params)
#'
#' mat$grad(free_params)
#'
#' mat$set_param_specs("rho", fixed = TRUE)
#'
#' mat$free_param_names
#' mat(tensor(array(0.5)))
#' mat$grad(tensor(array(0.5)))
#' }
#'
#' @export
compound_symmetric_matrix <- function(n, param_specs = NULL) {
  torch_openreml$covariance$CompoundSymmetricMatrix(as.integer(n), param_specs)
}
