
library(reticulate)
reticulate::py_install("bs4")

#' Mdex Data
#'
#' @return a data.frame
#' @export
madex.data=function(){
  pd=reticulate::import("pandas")
  bs4=reticulate::import("bs4")
  requests=reticulate::import("requests")
  json=reticulate::import("json")
  datetime=reticulate::import("datetime")
  sys=reticulate::import('sys')
  warnings=reticulate::import("warnings")
  codecs=reticulate::import("codecs")
  link="https://www.casablanca-bourse.com/bourseweb/indice-ponderation.aspx?Cat=22&IdLink=298"
  req=requests$get(link)
  bsoup=bs4$BeautifulSoup(req$text,"html.parser")
  view.state=bsoup$find("input",reticulate::dict("id"="__VIEWSTATE"))['value']
  view.state.generator=bsoup$find("input",reticulate::dict("id"="__VIEWSTATEGENERATOR"))
  load=reticulate::dict('TopControl1$ScriptManager1'= 'Ponderation1$UpdatePanel1|Ponderation1$ImageButton1',
            '__EVENTTARGET'= '',
            '__EVENTARGUMENT'= '',
            '__LASTFOCUS'= '',
            '__VIEWSTATE'= view.state,
            '__VIEWSTATEGENERATOR'= view.state.generator,
            'TopControl1$TxtRecherche' = '',
            'TopControl1$txtValeur' = '',
            'Ponderation1$Marche' = 'RBMadex',
            'Ponderation1$DateTimeControl1$TBCalendar' = '04/11/2021',
            'Ponderation1$DateTimeControl2$TBCalendar' = '',
            'Ponderation1$DateTimeControl3$TBCalendar' = '',
            'hiddenInputToUpdateATBuffer_CommonToolkitScripts' = '1',
            '__AjaxControlToolkitCalendarCssLoaded' = '',
            'Ponderation1$ImageButton1.x' = '3',
            'Ponderation1$ImageButton1.y' = '17')
  r=requests$post(link,data = load)
  bsoup=bs4$BeautifulSoup(r$text,'html.parser')
  tabl=bsoup$find_all('table')
  result=list()
  for(i in 1:9){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl0','_LBCIsin',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl0','_LBCIsin1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result=append(result,bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
    }
    else {
      result=append(result,bsoup$find('span',attrs = reticulate::dict('id'= id_)))
    }

  }
  for(i in 10:55){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl','_LBCIsin',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl','_LBCIsin1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result=append(result,bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
    }
    else {
      result=append(result,bsoup$find('span',attrs = reticulate::dict('id'= id_)))
    }

  }

  # les libelles
  x=1
  for(i in 1:9){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl0','_LBLibelle',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl0','_LBLibelle1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){

      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }
  for(i in 10:55){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl','_LBLibelle',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl','_LBLibelle1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }

  #Les titres
  x=1
  for(i in 1:9){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl0','_LBNbreTitre',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl0','_LBNbreTitre1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }
  for(i in 10:55){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl','_LBNbreTitre',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl','_LBNbreTitre1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }
  }

  #Les cours
  x=1
  for(i in 1:9){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl0','_LBCours',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl0','_LBCours1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }
  for(i in 10:55){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl','_LBCours',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl','_LBCours1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }

  #Les flottants
  x=1
  for(i in 1:9){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl0','_LBFactFlot',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl0','_LBFactFlot1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }
  for(i in 10:55){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl','_LBFactFlot',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl','_LBFactFlot1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }

  #Les plafonnements
  x=1
  for(i in 1:9){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl0','_LBFactPlaf',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl0','_LBFactPlaf1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }
  for(i in 10:55){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl','_LBFactPlaf',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl','_LBFactPlaf1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }
  #Les flottants
  x=1
  for(i in 1:9){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl0','_LBCapitFlot',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl0','_LBCapitFlot1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }
  for(i in 10:55){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl','_LBCapitFlot',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl','_LBCapitFlot1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }

  #Les poids
  x=1
  for(i in 1:9){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl0','_LBPoids',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl0','_LBPoids1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }
  for(i in 10:55){
    tabl_id=paste('Ponderation1_RPTLPonderation_ctl','_LBPoids',sep = toString(i))
    id_=paste('Ponderation1_RPTLPonderation_ctl','_LBPoids1',sep = toString(i))
    if(!is.null(bsoup$find('span',attrs = reticulate::dict('id' = tabl_id)))){
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= tabl_id)))
      x=x+1
    }
    else {
      result[[x]]=append(result[[x]],bsoup$find('span',attrs = reticulate::dict('id'= id_)))
      x=x+1
    }

  }

  code=list()
  for(sp in result){
    for(i in 1:8){
      code=append(code,sp[[i]]$text)
    }
  }
  li=list(" ","Total ",
          bsoup$find('span', attrs=reticulate::dict('id'= 'Ponderation1_RPTLPonderation_ctl56_LBTotalTitre'))$text,
          " "," "," ",
          bsoup$find('span',attrs=reticulate::dict('id'="Ponderation1_RPTLPonderation_ctl56_LBTotalCapitalisation"))$text,
          " ")

  code=append(code,li)
  columns=list('Code Isin','Instrument','Nombre de titres','Cours','Facteur flottant',
               'Facteur de plafonnement','Capitalisation flottante','Poids')
  df=matrix(code,nrow = 8)
  df=t(df)
  colnames(df)=columns
  df=data.frame(df)

  return(df)
}






#' Title
#'
#' @param ticker put ticker
#' @param from from date
#' @param to to date
#'
#' @return data frame
#' @export
daily.data=function(ticker,from,to){
  pd=reticulate::import("pandas")
  requests=reticulate::import("requests")
  json=reticulate::import("json")
  datetime=reticulate::import("datetime")
  sys=reticulate::import('sys')
  warnings=reticulate::import("warnings")
  codecs=reticulate::import("codecs")
  dat=reticulate::dict ('ADH' = "MA0000011512", "AFM"= "MA0000012296", "AFI"= "MA0000012114","GAZ"= "MA0000010951",
            "AGM"= "MA0000010944", "ADI"= "MA0000011819", "ALM"= "MA0000010936",
            "ARD"= "MA0000012460", "ATL"= "MA0000011710", "ATW"= "MA0000012445", "ATH"= "MA0000010969",
            "NEJ"= "MA0000011009", "BAL"= "MA0000011991", "BOA"= "MA0000012437",
            "BCP"= "MA0000011884", "BCI"= "MA0000010811", "CRS"= "MA0000011868", "CDM"= "MA0000010381",
            "CDA"= "MA0000012049", "CIH"= "MA0000011454", "CMA"= "MA0000010506",
            "CMT"= "MA0000011793", "COL"= "MA0000011934", "CSR"= "MA0000012247", "CTM"= "MA0000010340",
            "DRI"= "MA0000011421", "DLM"= "MA0000011777", "DHO"= "MA0000011850",
            "DIS"= "MA0000010639", "DWY"= "MA0000011637", "NKL"= "MA0000011942", "EQD"= "MA0000010357",
            "FBR"= "MA0000011587", "HPS"= "MA0000011611", "IBC"= "MA0000011132",
            "IMO"= "MA0000012387", "INV"= "MA0000011579", "JET"= "MA0000012080",
            "LBV"= "MA0000011801", "LHM"= "MA0000012320", "LES"= "MA0000012031", "LYD"= "MA0000011439",
            "M2M"= "MA0000011678", "MOX"= "MA0000010985", "MAB"= "MA0000011215", "MNG"= "MA0000011058",
            "MLE"= "MA0000010035", "IAM"= "MA0000011488", "MDP"= "MA0000011447",
            "MIC"= "MA0000012163", "MUT"= "MA0000012395", "NEX"= "MA0000011140", "OUL"= "MA0000010415",
            "PRO"= "MA0000011660", "REB"= "MA0000010993", "RDS"= "MA0000012239",
            "RISMA"="MA0000011462","S2M"= "MA0000012106", "SAH"= "MA0000012007", "SLF"= "MA0000011744",
            "SAM"="MA0000010803", "SMI"= "MA0000010068", "SNA"= "MA0000011843",
            "SNP"="MA0000011728", "MSA"= "MA0000012312", "SID"= "MA0000010019", "SOT"= "MA0000012502",
            "SRM"="MA0000011595", "SBM"= "MA0000010365", "STR"= "MA0000012056",
            "TQM"= "MA0000012205", "TIM"= "MA0000011686", "TMA"= "MA0000012262", "UMR"= "MA0000012023",
            "WAA"= "MA0000010928", "ZDJ"= "MA0000010571")

  CodeValeur =reticulate::dict("ADH" = "9000" , "AFM" = "12200" , "AFI" = "11700" , "GAZ" = "7100" , "AGM" = "6700" ,
                    "ADI" = "11200" , "ALM" = "6600" , "ARD" = "27" , "ATL" = "10300" , "ATW" = "8200" , "ATH" = "3200" ,
                    "NEJ" = "7000" , "BAL" = "3300" , "BOA" = "1100" , "BCP" = "8000" , "BCI" = "5100" , "CRS" = "8900" ,
                    "CDM" = "3600" , "CDA" = "3900" , "CIH" = "3100" , "CMA" = "4000" , "CMT" = "11000" , "COL" = "9200" ,
                    "CSR" = "4100" , "CTM" = "2200" , "DRI" = "8500" , "DLM" = "10800" , "DHO" = "10900" , "DIS" = "4200" ,
                    "DWY" = "9700" , "NKL" = "11300" , "EQD" = "2300" , "FBR" = "9300" , "HPS" = "9600" , "IBC" = "7600" ,
                    "IMO" = "12" , "INV" = "9500" , "JET" = "11600" , "LBV" = "11100" , "LHM" = "3800" , "LES" = "4800" ,
                    "LYD" = "8600" , "M2M" = "10000" , "MOX" = "7200" , "MAB" = "1600" , "MNG" = "7300" , "MLE" = "2500" ,
                    "IAM" = "8001" , "MDP" = "6500" , "MIC" = "10600" , "MUT" = "21" , "NEX" = "7400" , "OUL" = "5200" ,
                    "PRO" = "9900" , "REB" = "5300" , "RDS" = "12000" , "RISMA" = "8700" , "S2M" = "11800" ,
                    "SAH" = "11400" , "SLF" = "10700" , "SAM" = "6800" , "SMI" = "1500" , "SNA" = "10500" ,
                    "SNP" = "9400" , "MSA" = "12300" , "SID" = "1300" , "SOT" = "9800" , "SRM" = "2000" ,
                    "SBM" = "10400" , "STR" = "11500" , "TQM" = "11900" , "TIM" = "10100" , "TMA" = "12100" , "UMR" = "7500" ,
                    "WAA" = "6400" , "ZDJ" = "5800")
  isin=dat[ticker]

  link=paste('https://www.leboursier.ma/api?method=getPriceHistory&ISIN=','&format=json&from=',sep = toString(isin))
  link=paste(link,'&to=',sep = toString(from))
  link=paste0(link,toString(to))
  r=requests$get(link)
  c=codecs$encode(r$text)
  c=c$decode('UTF-8-SIG')
  data=json$loads(c)
  df0=pd$io$json$json_normalize(data)
  df = pd$DataFrame(df0$result)
  df=t(df)
  Date=rep(list(NULL),length(df))
  Value=rep(list(NULL),length(df))
  Min=rep(list(NULL),length(df))
  Max=rep(list(NULL),length(df))
  Variation=rep(list(NULL),length(df))
  Volume=rep(list(NULL),length(df))

  for(i in 1:length(df)){
  Date[[i]]=df[[i]]$date
  Value[[i]]=df[[i]]$value
  Min[[i]]=df[[i]]$min
  Max[[i]]=df[[i]]$max
  Variation[[i]]=df[[i]]$variation
  Volume[[i]]=df[[i]]$volume
  }
  Date=matrix(Date)
  Value=matrix(Value)
  Min=matrix(Min)
  Max=matrix(Max)
  Variation=matrix(Variation)
  Volume=matrix(Volume)
  df=data.frame(Date,Value,Min,Max,Variation,Volume)
  rownames(df)=df$Date
  df=df[,-1]
  row.names(df)=Date=as.Date(rownames(df),'%d/%m/%Y')
  return(df)

}

