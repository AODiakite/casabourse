# Get all financial instruments
#' instruments
#'
#'
#' @return data.frame
#' @description It is without argument and gives us information on the financial instruments of the market, such as the ISIN code, the sub-fund, the number of securities etc.
#' @examples instruments()
#' @export
instruments <- function() {
  instru <- gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/13COW6CoojBm-6f4SmhHpnYgBsSd2m528J0qiwyDYoaM/edit?usp=sharing")
  instru <- instru[, -seq(1, 9, 2)]
  instru <- stats::na.omit(instru)
  colnames(instru) <- instru[1, ]
  instru <- instru[-1, ]
  return(instru)
}
