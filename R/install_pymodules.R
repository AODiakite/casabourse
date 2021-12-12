#' install.tools
#' @export
#'
#' @examples
install.tools=function(){
  reticulate::py_install("pandas")
  reticulate::py_install("bs4")
  reticulate::py_install("requests")

}
