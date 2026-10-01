
# tensor ------------------------------------------------------------------

#' Create a PyTorch tensor
#'
#' Creates a PyTorch tensor from the supplied data by calling
#' [`torch.tensor()`](https://pytorch.org/docs/stable/generated/torch.tensor.html).
#'
#' @param x Data from which to create the tensor.
#' @param dtype Optional PyTorch data type.
#' @param device Optional device on which to create the tensor, such as
#'   `"cpu"`, `"cuda"`, or `"mps"`.
#' @param ... Additional arguments passed to `torch.tensor()`.
#'
#' @return A Python PyTorch tensor.
#' @export
tensor <- function(x, dtype = NULL, device = NULL, ...) {
  torch$tensor(x, device = device, dtype = dtype, ...)
}


# as.matrix.torch.Tensor --------------------------------------------------

#' Coerce a PyTorch tensor to a matrix
#'
#' Converts a PyTorch tensor to an R matrix. The tensor is detached from
#' the computation graph and moved to the CPU before conversion.
#'
#' @param x A PyTorch tensor.
#' @param ... Additional arguments, currently unused.
#'
#' @return An R matrix containing the values of `x`.
#'
#' @export
as.matrix.torch.Tensor <- function(x, ...) {
  reticulate::py_to_r(x$detach()$cpu()$numpy()$copy())
}
