#' Create a covariance propagation operator
#'
#' Creates a `CovariancePropagation` object representing the propagation of a
#' covariance matrix `G` through a design matrix `Z`:
#'
#' \deqn{V = Z G Z^\top}
#'
#' The first operand is treated as `Z` and the second as `G`. Either or both
#' may be trainable `Matrix` instances or fixed `torch.Tensor` values.
#'
#' This structure arises naturally in linear mixed-effects models where `Z` is
#' the random-effect design matrix and `G` is the random-effect covariance
#' matrix, giving the random-effect contribution `Z G Z^T` to the marginal
#' covariance.
#'
#' @param ... Exactly two operands as positional or named arguments or a single named
#'   list. The first is `Z`, the second is `G`. Operands may be `Matrix`
#'   instances or `torch.Tensor` values.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.covariance_propagation.CovariancePropagation`.
#'
#' @seealso
#' See the [online documentation for `CovariancePropagation`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.covariancepropagation#torch_openreml.covariance.CovariancePropagation)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' z <- dummy_matrix(c("a", "b", "c", "a"))
#' z()
#'
#' g <- diagonal_matrix(3)
#' op <- covariance_propagation(z = z, g = g)
#' free_params <- tensor(c(0.0, 0.5, 1.0))
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
covariance_propagation <- function(...) {
  torch_openreml$covariance$CovariancePropagation(...)
}
