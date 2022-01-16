#Get MASI data
#' masi.data
#'
#'
#' @return data.frame
#' @description This is a function for downloading data from the MASI index. It returns a given table.
#' @examples masi.data()
#' @export
masi.data=function(){
  df=gsheet::gsheet2tbl("https://docs.google.com/spreadsheets/d/1OepCwQ1w4htUL5YvIiCMUAR3KCICdACKouy2uppii0Y/edit?usp=sharing")
  df=df[-77,]
  df=df[-2,]
  df=df[,-seq(1,16,by=2)]
  colnames(df)=df[1,]
  df=df[-1,]
  return(df)
}
