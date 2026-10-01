#' Create an identity matrix
#'
#' Creates an `IdentityMatrix` object representing an identity matrix of the
#' specified dimension.
#'
#' @param n The dimension of the identity matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.identity_matrix.IdentityMatrix`.
#'
#' @seealso
#' See the [online documentation](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.identitymatrix#torch_openreml.covariance.IdentityMatrix)
#' for `IdentityMatrix`.
#' 
#' @export
identity_matrix <- function(n) {
  torch_openreml$covariance$IdentityMatrix(as.integer(n))
}
