.state <- new.env()

# load_torch_openreml -----------------------------------------------------

load_torch_openreml <- function() {
  if (is.null(.state$torch_openreml)) {
    .state$torch_openreml <- reticulate::import("torch_openreml",
                                                convert = TRUE,
                                                delay_load = list(environment = c("torch-openreml", "r-torch-openreml"),
                                                                  on_load = function() {
                                                                    config <- reticulate::py_config()
                                                                    cli::cli_alert_success("Loaded {.pkg torch-openreml} using Python: {.val {config$python}}.")
                                                                  }))
    
  }
  
  .state$torch_openreml
}


#' Access the `torch_openreml` Python module
#'
#' `torch_openreml` is an active binding that lazily imports the
#' `torch_openreml` Python module when it is first accessed.
#'
#' The module is imported with `convert = FALSE`, so Python objects are
#' returned as Python objects rather than being automatically converted to
#' R objects by reticulate.
#'
#' By default, the import uses reticulate's delayed environment selection,
#' with `torch-openreml` and `r-torch-openreml` as the preferred environment
#' names. The selected environment must contain an installation of
#' `torch-openreml`.
#'
#' Users can specify a different Python environment if desired. To select
#' an environment by name, set `RETICULATE_PYTHON_ENV` before accessing
#' `torch_openreml`, for example:
#'
#' ```
#' Sys.setenv(RETICULATE_PYTHON_ENV = "my-environment")
#' ```
#'
#' Alternatively, `RETICULATE_PYTHON` can be used to specify the path to a
#' Python executable directly:
#'
#' ```
#' Sys.setenv(RETICULATE_PYTHON = "/path/to/python")
#' ```
#'
#' These environment variables can be set in `.Rprofile` to make the
#' selection persistent across R sessions.
#'
#' @return A Python module object representing the `torch_openreml` package.
#'
#' @usage torch_openreml
#'
#' @examples
#' \dontrun{
#' torch_openreml
#' }
#'
#' @name torch_openreml
#' @export
NULL


# load_torch --------------------------------------------------------------

load_torch <- function() {
  if (is.null(.state$torch)) {
    .state$torch <- reticulate::import("torch",
                                       convert = FALSE,
                                       delay_load = list(environment = c("torch-openreml", "r-torch-openreml"),
                                                         on_load = function() {
                                                           config <- reticulate::py_config()
                                                           cli::cli_alert_success("Loaded {.pkg torch} using Python: {.val {config$python}}.")
                                                         }))
  }
  
  .state$torch
}

#' Access the `torch` Python library
#'
#' `torch` is an active binding that lazily imports the Python `torch`
#' library when it is first accessed.
#'
#' The library is imported with `convert = FALSE`, so Python objects are
#' returned as Python objects rather than being automatically converted to
#' R objects by reticulate.
#'
#' By default, the import uses reticulate's delayed environment selection,
#' with `torch-openreml` and `r-torch-openreml` as the preferred environment
#' names. The selected environment must contain an installation of the
#' Python `torch` library.
#'
#' Users can specify a different Python environment if desired. To select
#' an environment by name, set `RETICULATE_PYTHON_ENV` before accessing
#' `torch`, for example:
#'
#' ```
#' Sys.setenv(RETICULATE_PYTHON_ENV = "my-environment")
#' ```
#'
#' Alternatively, `RETICULATE_PYTHON` can be used to specify the path to a
#' Python executable directly:
#'
#' ```
#' Sys.setenv(RETICULATE_PYTHON = "/path/to/python")
#' ```
#'
#' These environment variables can be set in `.Rprofile` to make the
#' selection persistent across R sessions.
#'
#' @return A Python module object representing the `torch` library.
#'
#' @usage torch
#'
#' @examples
#' \dontrun{
#' torch
#' }
#'
#' @name torch
#' @export
NULL


# .onLoad ------------------------------------------------------------------

.onLoad <- function(libname, pkgname) {
  makeActiveBinding("torch_openreml",
                    load_torch_openreml,
                    topenv())
  makeActiveBinding("torch",
                    load_torch,
                    topenv())
}
