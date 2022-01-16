#Get Value By Sector
#' bySector
#'
#'
#' @return data.frame
#' @description It returns a table containing data by industry. It is a function without arguments.
#' @examples bySector()
#' @export
bySector=function(){
  return(gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/1gYSo8SnPLs2xN96j1KPa5_ESIay_Tew779kJ7vBHiYY/edit?usp=sharing"))
}
