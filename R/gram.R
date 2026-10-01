#' Create a Gram matrix operator
#'
#' Creates a `Gram` object representing the Gram product of a matrix `X`
#' (which may be a fixed `torch.Tensor` or a trainable `Matrix`):
#'
#' \deqn{V = X^\top X \quad \text{if } gram\_type = "xtx"}
#' \deqn{V = X X^\top \quad \text{if } gram\_type = "xxt"}
#'
#' If `X` has shape `(n, m)`, then `"xtx"` yields an `(m, m)` matrix and
#' `"xxt"` yields an `(n, n)` matrix.
#'
#' When `X` is a `Matrix`, its parameters are exposed through this operator
#' and gradients are computed analytically via the product rule.
#'
#' @param ... Exactly one operand as a positional or named argument or a single named
#'   list. The operand is `X`, which may be a `Matrix` instance or a
#'   `torch.Tensor` value.
#' @param gram_type Which Gram product to compute. Must be one of `"xtx"`
#'   (`X^T X`) or `"xxt"` (`X X^T`). Defaults to `"xtx"`.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.gram.Gram`.
#'
#' @seealso
#' See the [online documentation for `Gram`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.gram#torch_openreml.covariance.Gram)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' x <- lower_triangular_matrix(3, 2)
#' op <- gram(x, gram_type = "xtx")
#' op()
#'
#' op_xxt <- gram(x, gram_type = "xxt")
#' op_xxt()
#'
#' free_params <- tensor(c(0.0, 0.5, 1.0, 0.2, -0.3))
#'
#' grad_result <- op$grad(free_params)
#' grad_result[[1]]
#' grad_result[[2]]
#'
#' grad_xxt_result <- op_xxt$grad(free_params)
#' grad_xxt_result[[1]]
#' grad_xxt_result[[2]]
#'
#' op$gram_type
#' op$free_param_names
#' op$param_names
#' op$shape
#' }
#'
#' @export
gram <- function(..., gram_type = "xtx") {
  torch_openreml$covariance$Gram(..., gram_type = gram_type)
}
