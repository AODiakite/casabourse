#Get all tickers
#' tickers
#'
#'
#' @return data.frame
#' @description This function takes no arguments and returns a data table associating each company with a ticker. It is important to visualize the tickers. Indeed, they are used by the other functions of the package to represent the companies to which they correspond.
#' @examples tickers()
#' @export
tickers=function(){
  return(gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/1o8IgWa040xazF3QFoFidMcR1xqOT36CtKswQRZeEmws/edit?usp=sharing"))
}
