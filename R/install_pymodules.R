#' install.tools
#' @description For a first use of the package, you must perform this function that will automatically download all the dependencies you need
#' @export
install.tools=function(){
  reticulate::repl_python()
  reticulate::py_install("pandas")
  reticulate::py_install("bs4")
  reticulate::py_install("requests")

}
