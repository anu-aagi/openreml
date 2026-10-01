#' Create a first-order autoregressive covariance matrix
#'
#' Creates an `AR1Matrix` object representing a first-order autoregressive
#' covariance matrix. The covariance between observations decays geometrically
#' with the lag between them: \eqn{V_{ij} = \sigma^2 \rho^{|i-j|}}.
#'
#' The variance parameter `sigma^2 > 0` is enforced by `TransformExpPow2` and
#' the correlation parameter `rho` in `(-1, 1)` is enforced by a sigmoid
#' scaled to `(-1, 1)` by default.
#'
#' @param n The dimension of the AR(1) covariance matrix.
#' @param param_specs Optional parameter specifications for the covariance
#'   matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.ar1_matrix.AR1Matrix`.
#'
#' @seealso
#' See the [online documentation for `AR1Matrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.ar1matrix#torch_openreml.covariance.AR1Matrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' mat <- ar1_matrix(4)
#' mat
#'
#' free_params <- tensor(c(0.5, 1.0))
#' mat(free_params)
#'
#' mat$grad(free_params)
#'
#' mat$set_param_specs("rho", fixed = TRUE)
#'
#' mat$free_param_names
#' mat(tensor1d(0.5))
#' mat$grad(tensor1d(0.5))
#' }
#'
#' @export
ar1_matrix <- function(n, param_specs = NULL) {
  torch_openreml$covariance$AR1Matrix(as.integer(n), param_specs)
}
