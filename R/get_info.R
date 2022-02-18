
#' Get info
#'
#' @param ticker ticker that matches the title that interests us (to remind you know all the tickers of the securities through the tickers() function)
#'
#' @return data frame
#' @description This function allows you to get quick information about a company
#' @examples get_info("adh")
#' @export
#' @examples
get_info <- function(ticker) {
  ticker <- toupper(ticker)
  tryCatch(
    {
      tick <- "ADH, AFM, AFI, GAZ, AGM, ADI, ALM, ARD, ATL, ATW, ATH, NEJ, BAL, BOA, BCP, BCI, CRS, CDM, CDA, CIH, CMA, CMT, COL, CSR, CTM, DRI, DLM, DHO, DIS, DWY, NKL, EQD, FBR, HPS, IBC, IMO, INV, JET, LBV, LHM, LES, LYD, M2M, MOX, MAB, MNG, MLE, IAM, MDP, MIC, MUT, NEX, OUL, PRO, REB, RDS, RISMA, S2M, SAH, SLF, SAM, SMI, SNA, SNP, MSA, SID, SOT, SRM, SBM, STR, TQM, TIM, TMA, UMR, WAA, ZDJ, TGC"
      codeisin <- "MA0000011512, MA0000012296, MA0000012114, MA0000010951, MA0000010944, MA0000011819, MA0000010936, MA0000012460, MA0000011710, MA0000012445, MA0000010969, MA0000011009, MA0000011991, MA0000012437, MA0000011884, MA0000010811, MA0000011868, MA0000010381, MA0000012049, MA0000011454, MA0000010506, MA0000011793, MA0000011934, MA0000012247, MA0000010340, MA0000011421, MA0000011777, MA0000011850, MA0000010639, MA0000011637, MA0000011942, MA0000010357, MA0000011587, MA0000011611, MA0000011132, MA0000012387, MA0000011579, MA0000012080, MA0000011801, MA0000012320, MA0000012031, MA0000011439, MA0000011678, MA0000010985, MA0000011215, MA0000011058, MA0000010035, MA0000011488, MA0000011447, MA0000012163, MA0000012395, MA0000011140, MA0000010415, MA0000011660, MA0000010993, MA0000012239, MA0000011462, MA0000012106, MA0000012007, MA0000011744, MA0000010803, MA0000010068, MA0000011843, MA0000011728, MA0000012312, MA0000010019, MA0000012502, MA0000011595, MA0000010365, MA0000012056, MA0000012205, MA0000011686, MA0000012262, MA0000012023, MA0000010928, MA0000010571, MA0000012528"
      tick <- unlist(strsplit(tick, split = ", "))
      codeisin <- unlist(strsplit(codeisin, split = ", "))
      dat <- data.frame(tick, codeisin)
      isin <- dat[dat$tick == ticker, 2]
      link <- paste("https://www.leboursier.ma/api?method=getStockInfo&ISIN=", "&format=json", sep = isin)
      df_info <- RJSONIO::fromJSON(link)
      df_info <- data.frame(df_info$result)
      colnames(df_info) <- "Information"
      df_info
    },
    error = function(e) {
      print("Make sure you have an active internet connection")
    }
  )
}
