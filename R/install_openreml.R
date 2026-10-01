#' Find the Conda executable
#'
#' Retrieves the path to the Conda executable detected by
#' `reticulate`.
#'
#' @return A character vector containing the path to the detected Conda
#'   executable, or `NULL` if Conda is not installed.
#'
#' @keywords internal
find_conda <- function() {
  get("find_conda", envir = getNamespace("reticulate"))()[[1]]
}

#' Install torch-openreml in a Conda environment
#'
#' Installs `torch-openreml` into a Conda environment, creating the
#' Conda installation and environment when required. If Conda or the
#' environment is missing, the action can either be performed automatically,
#' requested interactively, or stopped with an error.
#'
#' @param env_name Character. Character string giving the name of the Conda environment
#'   in which to install `torch-openreml`. Defaults to
#'   `"torch-openreml"`.
#' @param conda_path Character. Path to the Conda executable. By default, the path is
#'   detected using [find_conda()].
#' @param source Character. Character string specifying the source from which to install
#'   `torch-openreml`. Must be either `"pypi"` or `"github"`.
#'   Defaults to `"pypi"`.
#' @param conda_missing Character. Character string specifying what to do when Conda is
#'   not installed. `"install"` installs Miniconda automatically,
#'   `"ask"` prompts the user when running interactively, and any other
#'   value results in an error. Defaults to `"ask"`.
#' @param env_missing Character. Character string specifying what to do when the requested
#'   Conda environment does not exist. `"create"` creates the environment
#'   automatically, `"ask"` prompts the user when running interactively,
#'   and any other value results in an error. Defaults to `"ask"`.
#'
#' @details
#' When the Conda environment does not exist, it is created with Python
#' `3.12.12`.
#'
#' If `conda_missing = "ask"` or `env_missing = "ask"` is used in a
#' non-interactive session, the function stops with an error rather than
#' attempting to prompt the user.
#'
#' @return Invisibly returns `NULL`.
#'
#' @seealso
#' [reticulate::install_miniconda],
#' [reticulate::conda_create]
#'
#' @export
install_torch_openreml <- function(env_name = "r-torch-openreml", 
                                   conda_path = find_conda(), 
                                   source = "pypi",
                                   conda_missing = "ask",
                                   env_missing = "ask") {
  
  # Conda installation
  if (is.null(find_conda())) {
    
    if (conda_missing == "install") {
      
      reticulate::install_miniconda()
      
    } else if (conda_missing == "ask") {
      
      if (!interactive()) cli::cli_abort("Conda is not installed and the session is non-interactive. Set {.code conda_missing = \"install\"} to install Miniconda automatically.")
      
      cli::cli_alert_info("Conda is not installed. Do you want to install Miniconda at {.path {reticulate::miniconda_path()}}?")
      install <- utils::askYesNo("")
      
      if (!isTRUE(install)) cli::cli_abort("Conda installation was declined.")
      reticulate::install_miniconda()

    } else {
      cli::cli_abort("Conda is not installed.")
    }
  }
  
  # Update Conda path if needed
  if (is.null(conda_path)) conda_path <- find_conda()
  
  # Env creation
  if (!reticulate::condaenv_exists(env_name, conda = conda_path)) {
    
    if (env_missing == "create") {
      
      reticulate::conda_create(env_name, python_version = "3.12.12", conda = conda_path)
      
    } else if (env_missing == "ask") {
      
      if (!interactive()) cli::cli_abort("Conda environment {.val {env_name}} does not exist and the session is non-interactive. Set {.code env_missing = \"create\"} to create it automatically.")
      
      cli::cli_alert_info("Conda environment {.val {env_name}} does not exist. Do you want to create it?")
      create <- utils::askYesNo("")
      
      if (!isTRUE(create)) cli::cli_abort("Conda environment {.val {env_name}} was not created.")
      reticulate::conda_create(env_name, python_version = "3.12.12", conda = conda_path)

    } else {
      cli::cli_abort("Conda environment {.val {env_name}} does not exist.")
    }
  }
  
  # Install torch-openreml
  if (source == "pypi") {
    reticulate::conda_install(env_name, pip = TRUE, packages = c("torch-openreml"), conda = conda_path)
  } else if (source == "github") {
    reticulate::conda_install(env_name, pip = TRUE, packages = c("git+https://github.com/anu-aagi/torch-openreml.git"), conda = conda_path)
  } else {
    cli::cli_abort("{.arg source} must be one of {.val pypi} or {.val github}, not {.val {source}}.")
  }
  
  cli::cli_rule()
  cli::cli_alert_success("Installation succeeded. You can now use `reticulate::use_condaenv('{env_name}')` to specify the environment. Alternatively, set the `RETICULATE_PYTHON_ENV` environment variable to `{env_name}` in your `.Rprofile` file.")
}

