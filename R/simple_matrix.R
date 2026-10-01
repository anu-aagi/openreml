#' Create a covariance matrix from a custom function
#'
#' Creates a `SimpleMatrix` object representing a covariance matrix for
#' simple, function-based parameterisations. This is the easiest way to use
#' MarginalREML with a custom covariance structure: provide the number of
#' parameters and a function that maps a flat parameter tensor to the
#' covariance matrix.
#'
#' All parameters are free and use an identity transform (unconstrained). The
#' `default` argument sets the value used for each free parameter when none
#' are provided.
#'
#' For more advanced needs (custom transforms, fixed parameters, manual
#' gradients), subclass `Matrix` directly.
#'
#' @param num_free_params Number of free parameters.
#' @param call A function with signature `call(free_params)` that constructs
#'   the covariance matrix from a flat 1D parameter tensor. It receives the
#'   output of `build_params()` with `include_fixed = FALSE` and
#'   `trans = FALSE`, so a parameter dict or `NULL` is resolved to the free
#'   parameter tensor itself, untransformed, before the call.
#' @param manual_grad Optional function with signature
#'   `manual_grad(free_params)` returning `(grad, grad_names)` for a
#'   closed-form Jacobian. If `NULL` (the default), automatic differentiation
#'   is used.
#' @param default Default value for each parameter. Passed to
#'   `simple_param_specs()`. Defaults to `0.0`.
#'
#' @return An object of S3 class
#' `torch_openreml.covariance.simple_matrix.SimpleMatrix`.
#'
#' @seealso
#' See the [online documentation for `SimpleMatrix`](https://torch-openreml.patrickli.org/generated/torch_openreml.covariance.simplematrix#torch_openreml.covariance.SimpleMatrix)
#' for details about the corresponding Python class. See also
#' [simple_param_specs()] for the parameter specification helper.
#'
#' @examples
#' \dontrun{
#' my_v <- function(free_params) {
#'   torch$diag(free_params)
#' }
#'
#' mat <- simple_matrix(num_free_params = 3, call = my_v, default = 1.0)
#' mat(tensor(c(1.0, 2.0, 3.0)))
#'
#' mat()
#'
#' mat(list(
#'   theta_0 = tensor(array(2.0)),
#'   theta_1 = tensor(array(3.0)),
#'   theta_2 = tensor(array(4.0))
#' ))
#'
#' mat$grad(tensor(c(1.0, 2.0, 3.0)))
#' }
#'
#' @export
simple_matrix <- function(num_free_params, 
                          call, 
                          manual_grad = NULL,
                          default = 0.0) {
  torch_openreml$covariance$SimpleMatrix(as.integer(num_free_params),
                                         call,
                                         manual_grad,
                                         default)
}
