
#' construct_download_url
#'
#' @param url link
#' @param format a format like csv...
#' @param sheetid bool default TRUE
#'
#' @return text
construct_download_url <- function(url, format='csv', sheetid = NULL){
  key <- stringr::str_extract(url, '[[:alnum:]_-]{30,}')
  if(is.null(sheetid) & stringr::str_detect(url, 'gid=[[:digit:]]+')){
    sheetid <- as.numeric(stringr::str_extract(stringr::str_extract(url,'gid=[[:digit:]]+'),'[[:digit:]]+'))
  }
  address <- paste0('https://docs.google.com/spreadsheets/export?id=',key,'&format=',format)
  if(!is.null(sheetid)){
    address <- paste0(address, '&gid=', sheetid)
  }
  return(address)
}
#Scraping data.frame from Google Sheet link

#' gsheet2tbl
#'
#' @param url link
#' @param sheetid bool default TRUE
#' @return data.frame
#' @description It receives a link from a Google sheet spreadsheet as an argument and automatically reads the data that is there in the form of a table without having to download the sheet to your computer.
#' @export
gsheet2tbl <- function(url, sheetid = NULL){
  if(requireNamespace('readr', quietly=TRUE)){
    suppressMessages(table <- readr::read_csv(file = construct_download_url(url, format='csv', sheetid = NULL)))
  }else{
    table <- utils::read.csv(text=gsheet2text(url=url, format='csv', sheetid=sheetid), stringsAsFactors=FALSE)
    class(table) <- c("tbl_df", "tbl", "data.frame")
  }
  return(table)
}
#Scraping text from Google Sheet link
#' gsheet2txt
#'
#' @param url link
#' @param format a format like csv...
#' @param sheetid bool default TRUE
#' @description It receives a link from a Google sheet spreadsheet as an argument and automatically reads the data therein in text form without having to download the sheet to your computer.
#' @return text
#' @export
gsheet2text <- function(url, format='csv', sheetid = NULL){
  address <- construct_download_url(url=url, format=format, sheetid = sheetid)
  page <- httr::GET(address)
  if(stringr::str_detect(page$headers$`content-type`, stringr::fixed('text/html'))){
    stop("Unable to retrieve document. Is 'share by link' enabled for this sheet?")
  }
  content <- httr::content(page, as='text')
  return(content)
}
#Get MASI data
#' masi.data
#'
#'
#' @return data.frame
#' @description This is a function for downloading data from the MASI index. It returns a given table.
#' @export
masi.data=function(){
  df=gsheet2tbl("https://docs.google.com/spreadsheets/d/1OepCwQ1w4htUL5YvIiCMUAR3KCICdACKouy2uppii0Y/edit?usp=sharing")
  df=df[-77,]
  df=df[-2,]
  df=df[,-seq(1,16,by=2)]
  colnames(df)=df[1,]
  df=df[-1,]
  return(df)
}

#Get all tickers
#' tickers
#'
#'
#' @return data.frame
#' @description This function takes no arguments and returns a data table associating each company with a ticker. It is important to visualize the tickers. Indeed, they are used by the other functions of the package to represent the companies to which they correspond.
#' @export
tickers=function(){
  return(gsheet2tbl("https://docs.google.com/spreadsheets/d/1o8IgWa040xazF3QFoFidMcR1xqOT36CtKswQRZeEmws/edit?usp=sharing"))
}
#Get Value By Sector
#' bySector
#'
#'
#' @return data.frame
#' @description It returns a table containing data by industry. It is a function without arguments.
#' @export
bySector=function(){
  return(gsheet2tbl("https://docs.google.com/spreadsheets/d/1gYSo8SnPLs2xN96j1KPa5_ESIay_Tew779kJ7vBHiYY/edit?usp=sharing"))
}
#GET today market high,low...
#' today.market
#'
#'
#' @return data.frame
#' @description is without argument and returns the current price of financial instruments as well as their variations, their opening prices, their max etc.
#' @export
today.market=function(){
  return(gsheet2tbl("https://docs.google.com/spreadsheets/d/1WKZphnEyC7RcSbfY_4d3kCRoEskCGY1umKOwMqoaHqM/edit?usp=sharing"))
}
#Get today market prize list receive 'up' or 'down'
#' today.prizelist
#'
#' @param up_or_down rise or fall prize list
#'
#' @return data.frame
#' @description It receives '' up '' or '' down '' respectively and returns a table prizelist of rising or falling prices of market instruments
#' @export
today.prizelist=function(up_or_down){
  if(up_or_down=="up"){
    palup=gsheet2tbl("https://docs.google.com/spreadsheets/d/13QVauapLls-SxlZlRKPaY1935HLLSD3yNj8L6bbGH3Q/edit?usp=sharing")
    palup=palup[order(palup$Valeur),]
    return(palup)
  }
  else if(up_or_down=="down"){
    paldown=gsheet2tbl("https://docs.google.com/spreadsheets/d/1r2gt_n9tSyZkk7UJUQanM4BQaecCn4eVhpV4V08tm1o/edit?usp=sharing")
    paldown=paldown[order(paldown$Valeur),]
    return(paldown)
  }
  else{
    print("today.prizelist('up') or today.prizelist('down')")

  }
}
#Get all financial instruments
#' instruments
#'
#'
#' @return data.frame
#' @description It is without argument and gives us information on the financial instruments of the market, such as the ISIN code, the sub-fund, the number of securities etc.
#' @export
instruments=function(){
  instru=gsheet2tbl('https://docs.google.com/spreadsheets/d/13COW6CoojBm-6f4SmhHpnYgBsSd2m528J0qiwyDYoaM/edit?usp=sharing')
  instru=instru[,-seq(1,9,2)]
  instru=stats::na.omit(instru)
  colnames(instru)=instru[1,]
  instru=instru[-1,]
  return(instru)

}

#' today.transactions
#'
#' @return data.frame
#' @description It allows you to obtain a table of transactions for the day. It is a function without arguments.
#' @export
today.transactions=function(){
  trans=gsheet2tbl("https://docs.google.com/spreadsheets/d/10BxmdDLzWHV2WOIYwSewp-G_gs-XOxvxFoZc5DWUAqk/edit?usp=sharing")
  trans=trans[,-seq(1,9,2)]
  trans=stats::na.omit(trans)
  colnames(trans)=trans[1,]
  trans=trans[-1,]
  return(trans)
}

