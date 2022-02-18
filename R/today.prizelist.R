#Get today market prize list receive 'up' or 'down'
#' today.prizelist
#'
#' @param up_or_down rise or fall prize list
#'
#' @return data.frame
#' @description It receives '' up '' or '' down '' respectively and returns a table prizelist of rising or falling prices of market instruments
#' @examples today.prizelist('up')
#' @export
today.prizelist <- function(up_or_down) {
  up_or_down <- tolower(up_or_down)
  if (up_or_down == "up") {
    link <- "https://www.bmcecapitalbourse.com/bkbbourse/lists/TK?q=AE31180F8E3BE20E762758E81EDC1204&t=list&f=1W_PERF_PR&s=false#casapalmares"
    tryCatch(
      {
        page <- rvest::read_html(link)
        page <- rvest::html_nodes(page, "table")
        page <- rvest::html_table(page)
        page[[7]]
      },
      error = function(e) {print('Make sure you have an active internet connection')},
      warning = function(w) { print("Make sure you have an active internet connection") }
    )

  } else if (up_or_down == "down") {
    link <- "https://www.bmcecapitalbourse.com/bkbbourse/lists/TK?q=AE31180F8E3BE20E762758E81EDC1204&t=list&f=1W_PERF_PR&s=true#casapalmares"
    tryCatch(
      {
        page <- rvest::read_html(link)
        page <- rvest::html_nodes(page, "table")
        page <- rvest::html_table(page)
        page[[7]]
      },
      error = function(e) {print('Make sure you have an active internet connection')},
      warning = function(w) { print("Make sure you have an active internet connection") }
    )


  } else {
    print("today.prizelist('up') or today.prizelist('down')")
  }
}
