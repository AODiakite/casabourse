#' today.transactions
#'
#' @return data.frame
#' @description It allows you to obtain a table of transactions for the day. It is a function without arguments.
#' @examples \dontrun{today.transactions()}
#' @export
today.transactions <- function() {
  tryCatch(
    {
      trans <- gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/10BxmdDLzWHV2WOIYwSewp-G_gs-XOxvxFoZc5DWUAqk/edit?usp=sharing")
      trans <- trans[, -seq(1, 9, 2)]
      trans <- stats::na.omit(trans)
      colnames(trans) <- trans[1, ]
      trans <- trans[-1, ]
      trans
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    },
    warning = function(w) {
      print("Make sure you have an active internet connection")
    }
  )
}


