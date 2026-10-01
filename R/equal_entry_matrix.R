#' Create an equal-entry covariance matrix
#'
#' Creates an `EqualEntryMatrix` object representing an `n x m` matrix with a
#' single shared value across all entries:
#' \deqn{V = \sigma^2 J_{n \times m},}
#' where \eqn{J_{n \times m}} is the matrix of ones. 
#' A single unconstrained scalar parameter is
#' transformed to a positive variance via `TransformExpPow2` by default and is
#' then replicated across every entry of the matrix.
#'
#' When `m` is omitted it defaults to `n`, giving the square all-ones matrix
#' `sigma^2 * J_n`. This is singular for `n > 1` and represents the
#' contribution of a single random effect shared by all observations (e.g. a
#' common-environment effect), to be combined with other components via
#' `Sum`. Non-square sizes (`m != n`) may instead be used as rectangular
#' factors, e.g. inside `Gram`.
#'
#' @param n Number of rows. Matrix dimension when `m` is omitted.
#' @param m Number of columns. Defaults to `n` when omitted or `NULL`.
#' @param param_specs Optional parameter specifications for the covariance
#'   matrix.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.equal_entry_matrix.EqualEntryMatrix`.
#'
#' @seealso
#' See the [online documentation for `EqualEntryMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.equalentrymatrix#torch_openreml.covariance.EqualEntryMatrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' mat <- equal_entry_matrix(3, 2)
#' mat
#'
#' mat <- equal_entry_matrix(3)
#' mat
#'
#' free_params <- tensor1d(0.5)
#' mat(free_params)
#'
#' mat$grad(free_params)
#'
#' mat$set_param_specs("sigma^2", fixed = TRUE)
#'
#' mat$free_param_names
#' mat$grad()
#' }
#'
#' @export
equal_entry_matrix <- function(n, m = NULL, param_specs = NULL) {
  torch_openreml$covariance$EqualEntryMatrix(
    as.integer(n),
    if (is.null(m)) NULL else as.integer(m),
    param_specs
  )
}
