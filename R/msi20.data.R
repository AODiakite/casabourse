#' MSI20
#'
#' @return returns a data frame of the MSI20 index
#' @examples msi20.data()
#' @export
msi20.data=function(){
  return(gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/1J1rxI4kw1xXxFmm5NI_w4CfaeBwEdJi2nC-8kg0_C-M/edit?usp=sharing"))
}
