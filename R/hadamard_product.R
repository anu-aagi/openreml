#' Create a Hadamard (element-wise) product of two covariance matrices
#'
#' Creates a `HadamardProduct` object representing the element-wise product of
#' two covariance matrices:
#'
#' \deqn{V = A \odot B}
#'
#' Both operands must have the same shape. Either or both may be trainable
#' `Matrix` instances or fixed `torch.Tensor` values.
#'
#' @param ... Exactly two operands as positional or named arguments or a single named
#'   list. The first is `A`, the second is `B`. Operands may be `Matrix`
#'   instances or `torch.Tensor` values.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.hadamard_product.HadamardProduct`.
#'
#' @seealso
#' See the [online documentation for `HadamardProduct`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.hadamardproduct#torch_openreml.covariance.HadamardProduct)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' n <- 4
#' op <- hadamard_product(a = equicorrelation_matrix(n), b = tensor(array(5.0)))
#' free_params <- tensor(array(1.0))
#' op(free_params)
#'
#' grad_result <- op$grad(free_params)
#' grad_result[[1]]
#' grad_result[[2]]
#'
#' op$free_param_names
#' op$param_names
#' op$shape
#' }
#'
#' @export
hadamard_product <- function(...) {
  torch_openreml$covariance$HadamardProduct(...)
}
