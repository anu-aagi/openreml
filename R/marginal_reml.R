#' Marginal REML estimator
#'
#' Creates a `MarginalREML` object: a marginal REML estimator for generalised
#' least squares with a parametric marginal covariance matrix. Fits covariance
#' parameters `theta` by maximising the restricted log-likelihood
#'
#' \deqn{\ell_R(\theta) = -\frac{1}{2}\left(\log|V(\theta)| + \log|X^\top V(\theta)^{-1} X| + y^\top P y\right)}
#'
#' where \eqn{P = V(\theta)^{-1} - V(\theta)^{-1}X
#' (X^T V(\theta)^{-1}X)^{-1}X^T V(\theta)^{-1}}
#' is the projection matrix, and \eqn{V(\theta)} is the marginal covariance
#' matrix of \eqn{y}. Optimisation uses the average information (AI) algorithm.
#'
#' The covariance model `V(theta)` is supplied as a `Matrix` instance via `v`.
#' Gradients are handled internally by the matrix.
#'
#' @param v A `Matrix` instance that constructs `V(theta)` and its Jacobian.
#'
#' @return An object of S3 class `torch_openreml.MarginalREML`.
#'
#' @seealso
#' See the [online documentation for `MarginalREML`](https://torch-openreml.patrickli.org/generated/torch_openreml#torch_openreml.MarginalREML)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' n <- 50
#' p <- 2
#' y <- tensor(rnorm(n))
#' x <- tensor(matrix(rnorm(n * p), nrow = n), dtype = torch$float32)
#' theta <- tensor1d(0.0)
#'
#' mat <- scalar_matrix(n)
#' reml <- marginal_reml(mat)
#' result <- reml$optimize(y, x, theta, verbose = 2)
#' result[[1]]
#' result[[2]]
#'
#' reml$get_theta()
#' reml$get_beta()
#' reml$is_converged()
#' }
#'
#' @export
marginal_reml <- function(v) {
  torch_openreml$MarginalREML(v)
}
