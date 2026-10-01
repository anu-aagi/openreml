#' Create a Kronecker product of two covariance matrices
#'
#' Creates a `KroneckerProduct` object representing the Kronecker product of
#' two covariance matrices:
#'
#' \deqn{V = A \otimes B}
#'
#' If `A` is `m x m` and `B` is `n x n`, the result is an `mn x mn` matrix.
#' Either or both operands may be trainable `Matrix` instances or fixed
#' `torch.Tensor` values.
#'
#' @param ... Exactly two operands as positional or named arguments or a single named
#'   list. The first is `A`, the second is `B`. Operands may be `Matrix`
#'   instances or `torch.Tensor` values.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.kronecker_product.KroneckerProduct`.
#'
#' @seealso
#' See the [online documentation for `KroneckerProduct`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.kroneckerproduct#torch_openreml.covariance.KroneckerProduct)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' op <- kronecker_product(time = ar1_matrix(2), subject = scalar_matrix(2))
#' params <- tensor(c(1.0, 1.0, 1.0))
#' op(params)
#'
#' grad_result <- op$grad(params)
#' grad_result[[1]]
#' grad_result[[2]]
#'
#' op$free_param_names
#' op$param_names
#' op$shape
#' }
#'
#' @export
kronecker_product <- function(...) {
  torch_openreml$covariance$KroneckerProduct(...)
}
