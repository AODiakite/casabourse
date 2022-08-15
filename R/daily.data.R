#' Daily data
#'
#' @param ticker ticker that matches the title that interests us (to remind you know all the tickers of the securities through the tickers() function)
#' @param from It represents the start date of data collection. This argument is of the type '' day-month-year ''.
#' @param to It represents the date of stopping data collection. This argument is of the type '' day-month-year ''.
#' @description As its name suggests, this function returns the daily prices of a security between two dates given by the user. It receives three arguments.
#' @return data frame
#' @examples daily.data(ticker = "ATW", from = "01-01-2016", to = "01-01-2021")
#' @export
daily.data <- function(ticker = "ATW", from = "28-12-2020", to = "11-08-2022"){
    ticker <- toupper(ticker)
    tick <- "MSI20, MASI, ADH, AFM, AFI, GAZ, AGM, ADI, ALM, ARD, ATL, ATW, ATH, NEJ, BAL, BOA, BCP, BCI, CRS, CDM, CDA, CIH, CMA, CMT, COL, CSR, CTM, DRI, DLM, DHO, DIS, DWY, NKL, EQD, FBR, HPS, IBC, IMO, INV, JET, LBV, LHM, LES, LYD, M2M, MOX, MAB, MNG, MLE, IAM, MDP, MIC, MUT, NEX, OUL, PRO, REB, RDS, RISMA, S2M, SAH, SLF, SAM, SMI, SNA, SNP, MSA, SID, SOT, SRM, SBM, STR, TQM, TIM, TMA, UMR, WAA, ZDJ, TGC"
    tick <- unlist(strsplit(tick, split = ", "))
      if (ticker %in% tick) {
        if (ticker %in% c("MASI","MSI20")) {
          tryCatch(
            {
              from <- as.Date(from, "%d-%m-%Y")
              to <- as.Date(to, "%d-%m-%Y")
              url <-  switch (ticker,
                            MASI = "https://medias24.com/content/api?method=getIndexHistory&ISIN=masi&periode=5y&format=json",
                            MSI20 = "https://medias24.com/content/api?method=getIndexHistory&ISIN=msi20&periode=5y&format=json"
              )
              Index <- RJSONIO::fromJSON(url)
              Date <- unlist(Index$result$labels) |>
                as.Date.POSIXct()
              Prices <- Index$result$prices
              Index <- data.frame(Date, Prices) |>
                `names<-`(c("Date", ticker))
              Date <- to - from # Number of days between 'from and 'to'
              Date <- from + 0:Date # All days between from and to
              periode <- data.frame(Date)
              Index <- merge(Index, periode, by = "Date")
              Index <- Index[order(Index$Date, decreasing = TRUE), ]
              options(warn = -1)
              Index
            },
            error = function(e) {
              print("Make sure you have an active internet connection ")
              print("Put the correct date format ('dd-mm-yyyy')")
            }
          )
        } else {
          tryCatch(
            {
              from <- as.Date(from, "%d-%m-%Y")
              to <- as.Date(to, "%d-%m-%Y")
              tick <- "ADH, AFM, AFI, GAZ, AGM, ADI, ALM, ARD, ATL, ATW, ATH, NEJ, BAL, BOA, BCP, BCI, CRS, CDM, CDA, CIH, CMA, CMT, COL, CSR, CTM, DRI, DLM, DHO, DIS, DWY, NKL, EQD, FBR, HPS, IBC, IMO, INV, JET, LBV, LHM, LES, LYD, M2M, MOX, MAB, MNG, MLE, IAM, MDP, MIC, MUT, NEX, OUL, PRO, REB, RDS, RISMA, S2M, SAH, SLF, SAM, SMI, SNA, SNP, MSA, SID, SOT, SRM, SBM, STR, TQM, TIM, TMA, UMR, WAA, ZDJ, TGC"
              codeisin <- "MA0000011512, MA0000012296, MA0000012114, MA0000010951, MA0000010944, MA0000011819, MA0000010936, MA0000012460, MA0000011710, MA0000012445, MA0000010969, MA0000011009, MA0000011991, MA0000012437, MA0000011884, MA0000010811, MA0000011868, MA0000010381, MA0000012049, MA0000011454, MA0000010506, MA0000011793, MA0000011934, MA0000012247, MA0000010340, MA0000011421, MA0000011777, MA0000011850, MA0000010639, MA0000011637, MA0000011942, MA0000010357, MA0000011587, MA0000011611, MA0000011132, MA0000012387, MA0000011579, MA0000012080, MA0000011801, MA0000012320, MA0000012031, MA0000011439, MA0000011678, MA0000010985, MA0000011215, MA0000011058, MA0000010035, MA0000011488, MA0000011447, MA0000012163, MA0000012395, MA0000011140, MA0000010415, MA0000011660, MA0000010993, MA0000012239, MA0000011462, MA0000012106, MA0000012007, MA0000011744, MA0000010803, MA0000010068, MA0000011843, MA0000011728, MA0000012312, MA0000010019, MA0000012502, MA0000011595, MA0000010365, MA0000012056, MA0000012205, MA0000011686, MA0000012262, MA0000012023, MA0000010928, MA0000010571, MA0000012528"
              tick <- unlist(strsplit(tick, split = ", "))
              codeisin <- unlist(strsplit(codeisin, split = ", "))
              dat <- data.frame(tick, codeisin)
              isin <- dat[dat$tick == ticker, 2]
              link <- paste0("https://medias24.com/content/api?method=getStockHistoryByDate&ISIN=",
                             toString(isin),
                            "&format=json&from=",
                            toString(from),
                            "&to=",
                            toString(to)
                            )
              Asset <- RJSONIO::fromJSON(link)
              Date <- unlist(Asset$result$labels) |>
                as.Date.POSIXct()
              Prices <- Asset$result$prices
              Asset <- data.frame(Date, Prices) |>
                `names<-`(c("Date", ticker))
              Asset
            },
            error = function(e) {
              print("Make sure you have an active internet connection ")
              print("Put the correct date format ('dd-mm-yyyy')")
            }
          )
        }
      }
    else{

          message("Wrong ticker! You can display all tickers with tickers() function")

    }


}

# daily.data <- function(ticker = "ATW", from = "28-12-2020", to = "28-02-2022") {
#   ticker <- toupper(ticker)
#   tick <- "MASI, ADH, AFM, AFI, GAZ, AGM, ADI, ALM, ARD, ATL, ATW, ATH, NEJ, BAL, BOA, BCP, BCI, CRS, CDM, CDA, CIH, CMA, CMT, COL, CSR, CTM, DRI, DLM, DHO, DIS, DWY, NKL, EQD, FBR, HPS, IBC, IMO, INV, JET, LBV, LHM, LES, LYD, M2M, MOX, MAB, MNG, MLE, IAM, MDP, MIC, MUT, NEX, OUL, PRO, REB, RDS, RISMA, S2M, SAH, SLF, SAM, SMI, SNA, SNP, MSA, SID, SOT, SRM, SBM, STR, TQM, TIM, TMA, UMR, WAA, ZDJ, TGC"
#   tick <- unlist(strsplit(tick, split = ", "))
#   if (ticker %in% tick) {
#     if (ticker == "MASI") {
#       tryCatch(
#         {
#           from <- as.Date(from, "%d-%m-%Y")
#           to <- as.Date(to, "%d-%m-%Y")
#           url <- "https://www.leboursier.ma/api?method=getMasiHistory&periode=5y&format=json"
#           masi <- httr::GET(url)
#           masi <- httr::content(masi, encoding = "UTF-8")
#           masi <- masi$result
#           Date <- unlist(masi$labels)
#           Date <- as.Date.POSIXct(Date)
#           MASI.VALEUR <- unlist(masi$prices)
#           masi <- data.frame(Date, MASI.VALEUR)
#           Date <- to - from # Number of days between 'from and 'to'
#           Date <- from + 0:Date # All days between from and to
#           periode <- data.frame(Date)
#           masi <- merge(masi, periode, by = "Date")
#           masi <- masi[order(masi$Date, decreasing = TRUE), ]
#           options(warn = -1)
#           masi
#         },
#         error = function(e) {
#           print("Make sure you have an active internet connection ")
#           print("Put the correct date format ('dd-mm-yyyy')")
#         }
#       )
#     } else {
#       tryCatch(
#         {
#           tick <- "ADH, AFM, AFI, GAZ, AGM, ADI, ALM, ARD, ATL, ATW, ATH, NEJ, BAL, BOA, BCP, BCI, CRS, CDM, CDA, CIH, CMA, CMT, COL, CSR, CTM, DRI, DLM, DHO, DIS, DWY, NKL, EQD, FBR, HPS, IBC, IMO, INV, JET, LBV, LHM, LES, LYD, M2M, MOX, MAB, MNG, MLE, IAM, MDP, MIC, MUT, NEX, OUL, PRO, REB, RDS, RISMA, S2M, SAH, SLF, SAM, SMI, SNA, SNP, MSA, SID, SOT, SRM, SBM, STR, TQM, TIM, TMA, UMR, WAA, ZDJ, TGC"
#           codeisin <- "MA0000011512, MA0000012296, MA0000012114, MA0000010951, MA0000010944, MA0000011819, MA0000010936, MA0000012460, MA0000011710, MA0000012445, MA0000010969, MA0000011009, MA0000011991, MA0000012437, MA0000011884, MA0000010811, MA0000011868, MA0000010381, MA0000012049, MA0000011454, MA0000010506, MA0000011793, MA0000011934, MA0000012247, MA0000010340, MA0000011421, MA0000011777, MA0000011850, MA0000010639, MA0000011637, MA0000011942, MA0000010357, MA0000011587, MA0000011611, MA0000011132, MA0000012387, MA0000011579, MA0000012080, MA0000011801, MA0000012320, MA0000012031, MA0000011439, MA0000011678, MA0000010985, MA0000011215, MA0000011058, MA0000010035, MA0000011488, MA0000011447, MA0000012163, MA0000012395, MA0000011140, MA0000010415, MA0000011660, MA0000010993, MA0000012239, MA0000011462, MA0000012106, MA0000012007, MA0000011744, MA0000010803, MA0000010068, MA0000011843, MA0000011728, MA0000012312, MA0000010019, MA0000012502, MA0000011595, MA0000010365, MA0000012056, MA0000012205, MA0000011686, MA0000012262, MA0000012023, MA0000010928, MA0000010571, MA0000012528"
#           tick <- unlist(strsplit(tick, split = ", "))
#           codeisin <- unlist(strsplit(codeisin, split = ", "))
#           dat <- data.frame(tick, codeisin)
#           isin <- dat[dat$tick == ticker, 2]
#           link <- paste("https://www.leboursier.ma/api?method=getPriceHistory&ISIN=", "&format=json&from=", sep = toString(isin))
#           link <- paste(link, "&to=", sep = toString(from))
#           link <- paste0(link, toString(to))
#           r <- httr::GET(link)
#           r <- httr::content(r, encoding = "UTF8-SIG")
#           df <- r$result
#           Date <- rep(list(NULL), length(df))
#           Value <- rep(list(NULL), length(df))
#           Minimum <- rep(list(NULL), length(df))
#           Maximum <- rep(list(NULL), length(df))
#           Variation <- rep(list(NULL), length(df))
#           Volume <- rep(list(NULL), length(df))
#           for (i in 1:length(df)) {
#             if (is.null(df[[i]]$date) | is.null(df[[i]]$value) | is.null(df[[i]]$min) | is.null(df[[i]]$max) | is.null(df[[i]]$variation) | is.null(df[[i]]$volume)) {
#               j <- 0
#             } else {
#               Date[[i]] <- df[[i]]$date
#               Value[[i]] <- df[[i]]$value
#               Minimum[[i]] <- df[[i]]$min
#               Maximum[[i]] <- df[[i]]$max
#               Variation[[i]] <- df[[i]]$variation
#               Volume[[i]] <- df[[i]]$volume
#             }
#           }
#           Date <- unlist(Date)
#           Value <- unlist(Value)
#           Minimum <- unlist(Minimum)
#           Maximum <- unlist(Maximum)
#           Variation <- unlist(Variation)
#           Volume <- unlist(Volume)
#           df <- data.frame(Date, Value, Minimum, Maximum, Variation, Volume)
#           rownames(df) <- df$Date
#           df <- df[, -1]
#           options(warn = -1)
#           df
#         },
#         error = function(e) {
#           print("Make sure you have an active internet connection ")
#           print("Put the correct date format ('dd-mm-yyyy')")
#         }
#       )
#     }
#   }
#   else {
#     print("Wrong ticker! You can display all tickers with tickers() function")
#   }
# }

