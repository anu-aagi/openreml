#' Create a fixed dummy matrix from categorical input
#'
#' Creates a `DummyMatrix` object representing a fixed dummy (indicator)
#' matrix constructed from categorical input. The matrix is built from the
#' input at initialisation and remains fixed thereafter, so it has no
#' trainable parameters and `grad()` always returns `(NULL, list())`.
#'
#' The matrix is formed by taking the Cartesian product of the levels of the
#' input factors, producing one column per combination. `__call__()` follows
#' the dtype and device of its input; when none is supplied, the PyTorch
#' default dtype and device are used.
#'
#' @param ... Input data. One or many character vectors (or factors) for
#'   categorical data. Lists and tuples of strings are also accepted.
#' @param levels Optional list of levels, one per input vector. Defaults to
#'   the sorted unique elements of each input.
#' @param lex_order If `TRUE` (the default), the result columns are lexically
#'   ordered.
#' @param drop_first Whether to drop the first column. Defaults to `FALSE`.
#' @param drop_empty_cols Whether to drop empty columns. Defaults to `FALSE`.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.dummy_matrix.DummyMatrix`.
#'
#' @seealso
#' See the [online documentation for `DummyMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.dummymatrix#torch_openreml.covariance.DummyMatrix)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' rep <- c("rep1", "rep2", "rep2")
#' block <- c("block1", "block2", "block1")
#'
#' mat <- dummy_matrix(rep, block)
#' mat()
#' mat$colnames
#'
#' mat <- dummy_matrix(rep, block, drop_first = TRUE)
#' mat()
#' mat$colnames
#'
#' mat <- dummy_matrix(
#'   rep, block,
#'   levels = list(c("rep1", "rep2", "rep3"), c("block1", "block2"))
#' )
#' mat()
#' mat$colnames
#'
#' mat <- dummy_matrix(
#'   rep, block,
#'   levels = list(c("rep3", "rep1"), c("block1", "block2")),
#'   lex_order = FALSE
#' )
#' mat()
#' mat$colnames
#'
#' mat <- dummy_matrix(
#'   rep, block,
#'   levels = list(c("rep2", "rep1"), c("block1", "block2")),
#'   lex_order = FALSE,
#'   drop_empty_cols = TRUE
#' )
#' mat()
#' mat$colnames
#' }
#'
#' @export
dummy_matrix <- function(...,
                         levels = NULL,
                         lex_order = TRUE,
                         drop_first = FALSE,
                         drop_empty_cols = FALSE) {
  torch_openreml$covariance$DummyMatrix(...,
                                        levels = levels,
                                        lex_order = lex_order,
                                        drop_first = drop_first,
                                        drop_empty_cols = drop_empty_cols)
}
