# GET today market high,low...
#' today.market
#'
#'
#' @return data.frame
#' @description is without argument and returns the current price of financial instruments as well as their variations, their opening prices, their max etc.
#' @examples today.market()
#' @export
today.market <- function() {
  link <- "https://www.bmcecapitalbourse.com/bkbbourse/lists/TK?q=AE31180F8E3BE20E762758E81EDC1204&t=list&f=1W_PERF_PR&s=true#casapalmares"
  page <- rvest::read_html(link)
  page <- rvest::html_nodes(page, "table")
  page <- rvest::html_table(page)
  page[[6]]
}
