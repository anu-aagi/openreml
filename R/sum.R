#' Create a sum of covariance matrices
#'
#' Creates a `Sum` object representing the sum of multiple covariance matrices:
#'
#' \deqn{V = \sum_{i=1}^{k} A_i}
#'
#' where each `A_i` is a covariance matrix of the same shape. This operator
#' represents additive covariance structures, commonly used in linear
#' mixed-effects models to combine multiple variance components (e.g.,
#' genetic, environmental, and residual).
#'
#' All operands must evaluate to matrices of identical shape. Each operand may
#' be a trainable `Matrix` or a fixed `torch.Tensor`.
#'
#' @param ... Two or more operands as positional or named arguments or a single named
#'   list mapping names to operands. Operands may be `Matrix` instances or
#'   `torch.Tensor` values.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.sum.Sum`.
#'
#' @seealso
#' See the [online documentation for `Sum`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.sum#torch_openreml.covariance.Sum)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' op <- sum_matrix(time = ar1_matrix(4), noise = scalar_matrix(4))
#' free_params <- tensor(c(0.5, 1.0, 1.0))
#' op(free_params)
#'
#' grad_result <- op$manual_grad(free_params)
#' grad_result[[1]]
#' grad_result[[2]]
#'
#' op$free_param_names
#' op$param_names
#' op$shape
#' }
#'
#' @export
sum_matrix <- function(...) {
  torch_openreml$covariance$Sum(...)
}
