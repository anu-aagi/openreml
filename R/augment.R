#' Create a column-wise augmentation of covariance matrices
#'
#' Creates an `Augment` object representing the column-wise augmentation
#' (horizontal concatenation) of two or more covariance matrices:
#'
#' \deqn{V = [A_0 \mid A_1 \mid \ldots]}
#'
#' Each operand is placed side by side (column-wise). All operands must have
#' the same number of rows. Each operand may be a trainable `Matrix` or a
#' fixed `torch.Tensor`.
#'
#' @param ... Two or more operands as positional or named arguments or a single named
#'   list mapping names to operands. Operands may be `Matrix` instances or
#'   `torch.Tensor` values.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.augment.Augment`.
#'
#' @seealso
#' See the [online documentation for `Augment`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.augment#torch_openreml.covariance.Augment)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' op <- augment(A = scalar_matrix(3), B = scalar_matrix(3))
#' free_params <- tensor(c(0.5, 1.0))
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
augment <- function(...) {
  torch_openreml$covariance$Augment(...)
}
