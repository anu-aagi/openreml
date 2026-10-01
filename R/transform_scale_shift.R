#' Create a scale-shift transformation
#'
#' Creates a `TransformScaleShift` object that applies an affine
#' transformation with a configurable scale and shift.
#'
#' @param a The scale factor.
#' @param b The shift offset. Defaults to `0.0`.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.transform.TransformScaleShift`.
#'
#' @seealso
#' See the [online documentation for `TransformScaleShift`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.transform.transformscaleshift#torch_openreml.covariance.transform.TransformScaleShift)
#' for details about the corresponding Python class.
#'
#' @examples
#' \dontrun{
#' t <- transform_scale_shift(a = 2.0, b = 1.0)
#' x <- tensor(c(0.0, 1.0, 2.0))
#' t(x)
#'
#' t <- transform_scale_shift(a = 2.0, b = 1.0)
#' x <- tensor(c(1.0, 3.0, 5.0))
#' t$inverse(x)
#'
#' t <- transform_scale_shift(a = 2.0, b = 1.0)
#' x <- tensor(0.0)
#' t$grad(x)
#' }
#'
#' @export
transform_scale_shift <- function(a = 0.0, b = 0.0) {
  torch_openreml$covariance$transform$TransformScaleShift(a = a, b = b)
}
