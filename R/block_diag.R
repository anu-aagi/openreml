#' Create a block diagonal covariance matrix
#'
#' Creates a `BlockDiagonal` object representing a block diagonal covariance
#' matrix formed from two or more operands:
#'
#' \deqn{V = \text{blockdiag}(V_0, V_1, \ldots)}
#'
#' Each operand contributes a contiguous block along the diagonal. Parameters
#' and gradients are namespaced by operand name and aggregated into a single
#' joint parameter tensor, following the convention of `Operator`.
#'
#' @param ... Two or more operands as positional or named arguments, each a `Matrix` or
#'   a `torch.Tensor`. A single named list is also accepted, in which case the
#'   list names become the operand names.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.block_diagonal.BlockDiagonal`.
#'
#' @seealso
#' See the [online documentation for `BlockDiagonal`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.blockdiagonal#torch_openreml.covariance.BlockDiagonal)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' block <- block_diagonal(
#'   residual = scalar_matrix(3),
#'   random = diagonal_matrix(2)
#' )
#' free_params <- tensor(c(0.5, 0.0, 1.0))
#' block(free_params)
#'
#' grad_result <- block$grad(free_params)
#' grad_result[[1]]
#' grad_result[[2]]
#'
#' block$free_param_names
#' block$param_names
#' block$shape
#' }
#'
#' @export
block_diagonal <- function(...) {
  torch_openreml$covariance$BlockDiagonal(...)
}
