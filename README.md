![alt text](https://github.com/AODiakite/casabourse/blob/main/casabourse.png)

![CRAN/METACRAN](https://img.shields.io/cran/v/casabourse )
![CRAN/METACRAN](https://img.shields.io/cran/l/casabourse)


## Casabourse

```r
library(casabourse)
```
Casabourse est un R package qui permet d’obtenir des données à temps réel de la bourse de Casablanca. L’objectif est de faciliter l’accès aux données à tous les utilisateurs du langage de programmation R. Ce package comporte une diversité de données accessibles juste par appel de fonction.

## Guide d'installation
Ce package est disponible sur [github](https://github.com/AODiakite/casabourse) et sur le [CRAN](https://cran.r-project.org/web/checks/check_results_casabourse.html) pour l’installer vous devez exécuter ces lignes de codes suivantes

```r
#Version CRAN
install.packages("casabourse")
#Version de dev github
devtools::install_github("AODiakite/casabourse")
```


## La fonction **tickers()**
 
Cette fonction ne prend aucun argument et retourne une table de données associant chaque entreprise à un ticker. Il est important de visualiser les tickers. En effet, ils sont utilisés par les autres fonctions du package pour représenter les entreprises auxquelles ils correspondent.

```r
#' Affichage des tickers
tickers()
```

```
## # A tibble: 76 × 2
##    Titre           Ticker
##    <chr>           <chr> 
##  1 Addoha          ADH   
##  2 AFMA            AFM   
##  3 Afric Indus.    AFI   
##  4 Afriquia Gaz    GAZ   
##  5 Agma            AGM   
##  6 Alliances       ADI   
##  7 Aluminium Maroc ALM   
##  8 Aradei Capital  ARD   
##  9 ATLANTASANAD    ATL   
## 10 AttijariwafaBk  ATW   
## # … with 66 more rows
```

## La fonction **msi20.data()**
 
C’est une fonction permettant de télécharger les données de l’indice MSI20. Elle renvoie une table de  données.

```r
msi20 <- msi20.data() #affection de la table MSI20 a la variable ms
msi20 #afichage des premiers elements de la table
```

```
## # A tibble: 20 × 6
##    Libellé              Place      Cours Quantité `Var.(%)` Date      
##    <chr>                <chr>      <dbl> <chr>    <chr>     <chr>     
##  1 ATLANTASANAD         Casablanca   116 -        -         15/12/2021
##  2 ATTIJARIWAFA BANK    Casablanca  4826 -        -         15/12/2021
##  3 BANK OF AFRICA       Casablanca   187 -        -         15/12/2021
##  4 BCP                  Casablanca   277 -        -         15/12/2021
##  5 CIMENTS DU MAROC     Casablanca  1860 -        -         15/12/2021
##  6 COSUMAR              Casablanca 26295 -        -         15/12/2021
##  7 DISWAY               Casablanca   704 -        -         15/12/2021
##  8 DOUJA PROM ADDOHA    Casablanca  1073 -        -         15/12/2021
##  9 HPS                  Casablanca  6780 -        -         15/12/2021
## 10 ITISSALAT AL-MAGHRIB Casablanca  1419 -        -         15/12/2021
## 11 LABEL VIE            Casablanca  4750 -        -         15/12/2021
## 12 LAFARGEHOLCIM MAROC  Casablanca  2175 -        -         15/12/2021
## 13 MANAGEM              Casablanca  1610 -        -         15/12/2021
## 14 MICRODATA            Casablanca   630 -        -         15/12/2021
## 15 MUTANDIS SCA         Casablanca 24515 -        -         15/12/2021
## 16 SMI                  Casablanca  1522 -        -         15/12/2021
## 17 SNEP                 Casablanca   744 -        -         15/12/2021
## 18 SODEP-Marsa Maroc    Casablanca  2781 -        -         15/12/2021
## 19 SONASID              Casablanca   624 -        -         15/12/2021
## 20 TAQA MOROCCO         Casablanca  1100 -        -         15/12/2021
```

## La fonction **masi.data()**
 
C’est une fonction permettant de télécharger les données de l’indice MASI. Elle renvoie une table de  données.

```r
#' Affichage des données de MASI
ms <- masi.data() #affection de la table MASI a la variable ms
head(ms) #afichage des premiers elements de la table
```

```
## # A tibble: 6 × 8
##   `Code Isin`  Instrument           `Nombre de titres` Cours    `Facteur flotta…
##   <chr>        <chr>                <chr>              <chr>    <chr>           
## 1 MA0000012445 ATTIJARIWAFA BANK    215 140 839,00     483,50   0,30            
## 2 MA0000011488 ITISSALAT AL-MAGHRIB 879 095 340,00     142,10   0,20            
## 3 MA0000012320 LAFARGEHOLCIM MAR    23 431 240,00      2 170,00 0,30            
## 4 MA0000011884 BCP                  203 312 473,00     277,00   0,20            
## 5 MA0000012247 COSUMAR              94 487 143,00      267,95   0,40            
## 6 MA0000012437 BANK OF AFRICA       205 606 648,00     187,95   0,25            
## # … with 3 more variables: Facteur de plafonnement <chr>,
## #   Capitalisation flottante <chr>, Poids <chr>
```

## La fonction **madex.data()**
 
Par équivalence à la fonction masi.data(), madex.data() retourne une table de données de l’indice MADEX.

```r
#' Affichage des données de MADEX
mx <- madex.data() #affection de la table MADEX a la variable ma
head(mx) #afichage des premiers elements de la table
```

```
##      Code.Isin           Instrument Nombre.de.titres    Cours Facteur.flottant
## 1 MA0000012445    ATTIJARIWAFA BANK      215 140 839   496,50             0,30
## 2 MA0000011488 ITISSALAT AL-MAGHRIB      879 095 340   143,50             0,20
## 3 MA0000012320    LAFARGEHOLCIM MAR       23 431 240 2 220,00             0,30
## 4 MA0000011884                  BCP      203 312 473   282,50             0,20
## 5 MA0000012247              COSUMAR       94 487 143   270,00             0,40
## 6 MA0000012437       BANK OF AFRICA      205 606 648   186,00             0,25
##   Facteur.de.plafonnement Capitalisation.flottante  Poids
## 1                    1,00        32 045 227 969,05 0,1930
## 2                    1,00        25 230 036 258,00 0,1519
## 3                    1,00        15 605 205 840,00 0,0940
## 4                    1,00        11 487 154 724,50 0,0692
## 5                    1,00        10 204 611 444,00 0,0614
## 6                    1,00         9 560 709 132,00 0,0576
```

 
## La fonction **daily.data("ticker", "from", "to")** :
 
Comme son nom l’indique, cette fonction renvoie les cours journaliers d’un titre entre deux dates données par l’utilisateur. Elle reçoit trois arguments :
* ticker : qui correspond au ticker du titre qui nous intéresse ( pour rappelle vous pouvez connaitre tous les tickers des titres grâce à la fonction tickers() )
* from : représente la date de début de collecte de données. Cet argument est du type ‘’jour-mois-année’’.
* to : représente la date d’arrêt de collecte de données. Cet argument est du type ‘’jour-mois-année’’.
NB : Les week-end ne sont pas pris en compte lors du téléchargement des données et en plus Il est important de mettre chaque argument entre des doubles quotes( ‘’ ‘’)


```r
#Affichage des cours journaliers de ATTIJARIWAFA BANK entre 01 janvier 2017 et le 14 decembre 2021
atw <- daily.data("ATW","01-01-2017","14-12-2021") #affection de la table a la variable atw
head(atw) #afichage des premiers elements de la table
```

```
##            Value    Min    Max Variation Volume
## 2017-01-02   410    405    410     -0.73   5176
## 2017-01-03   420  405.1    420      2.44  26773
## 2017-01-04 420.5    412  436.9      0.12  94876
## 2017-01-05 436.1 420.05 436.95      3.71 316576
## 2017-01-06   441    441    457      1.12 313947
## 2017-01-09   455 436.05    455      3.17 244021
```

 
## La fonction **bySector()** :
 
Elle renvoie une table contenant des données par secteur d’activités. Elle est une fonction sans argument.

```r
#Afichage des données par secteur d'activité
bySector()
```

```
## # A tibble: 23 × 4
##    Secteur                                      Valeur    `Var %` `Var % 31/12`
##    <chr>                                        <chr>     <chr>   <chr>        
##  1 PETROLE & GAZ                                21 366,37 3,42 %  43,07 %      
##  2 BOISSONS                                     15 881,44 2,39 %  11,23 %      
##  3 INGENIERIES & BIENS D’EQUIPEMENT INDUSTRIELS 121,80    1,89 %  81,01 %      
##  4 SOCIETES DE PLACEMENT IMMOBILIER             984,49    1,17 %  6,54 %       
##  5 CHIMIE                                       6 500,81  1,16 %  63,44 %      
##  6 MINES                                        25 648,92 0,36 %  21,08 %      
##  7 SOCIETES DE PORTEFEUILLES - HOLDINGS         4 932,88  0,30 %  -6,80 %      
##  8 BATIMENT & MATERIAUX DE CONSTRUCTION         21 100,13 0,23 %  26,97 %      
##  9 ELECTRICITE                                  2 458,10  -       20,22 %      
## 10 LOISIRS ET HOTELS                            484,24    -       -6,14 %      
## # … with 13 more rows
```

 
## La fonction **instruments()** :
 
Elle est sans argument et nous donne les informations sur les instruments financiers du marché, telles que le code ISIN, le compartiment, le nombre de titres etc.


```r
#Afichage les instruments financiers du marché
instruments()
```

```
## # A tibble: 75 × 5
##    `Code ISIN`  `Libelle instrum… `Secteur/Catégo… Compartiment `Nombre de titr…
##    <chr>        <chr>             <chr>            <chr>        <chr>           
##  1 MA0000012296 AFMA              ACTIONS 1ERE LI… Principal B  1000000         
##  2 MA0000012114 AFRIC INDUSTRIES… ACTIONS 1ERE LI… Principal B  291500          
##  3 MA0000010951 AFRIQUIA GAZ      ACTIONS 1ERE LI… Principal A  3437500         
##  4 MA0000010944 AGMA              ACTIONS 1ERE LI… Alternatif A 200000          
##  5 MA0000011819 ALLIANCES         ACTIONS 1ERE LI… Principal B  22078588        
##  6 MA0000010936 ALUMINIUM DU MAR… ACTIONS 1ERE LI… Principal B  465954          
##  7 MA0000012460 ARADEI CAPITAL    ACTIONS 1ERE LI… Principal F  10645783        
##  8 MA0000011710 ATLANTASANAD      ACTIONS 1ERE LI… Principal B  60283595        
##  9 MA0000012445 ATTIJARIWAFA BANK ACTIONS 1ERE LI… Principal A  215140839       
## 10 MA0000010969 AUTO HALL         ACTIONS 1ERE LI… Principal B  50294528        
## # … with 65 more rows
```

 
## La classe de fonctions **today.** :
 
C’est une classe de fonctions permettant d’obtenir des informations de la date d’aujourd’hui. Nous pouvons y trouver les fonctions suivantes :

> - **today.prizelist("up_or_down")** : reçoit ‘’up’’ ou ‘’down’’ et renvoie respectivement une table de palmarès de hausse ou de baisse des cours des instruments du marché

```r
#Afichage du palmares de hausse des cours de la journée
today.prizelist('up')
```

```
## # A tibble: 18 × 8
##    Valeur      `Variation %` Cours   Ouverture `+ Haut` `+ Bas` Quantité Volume 
##    <chr>       <chr>         <chr>   <chr>     <chr>    <chr>      <dbl> <chr>  
##  1 Afriquia G… +3,99%        5 211,… 5 211,00  5 211,00 5 211,…       10 52 110…
##  2 Aradei Cap… +0,95%        409,00  409,00    409,00   409,00         6 2 454,…
##  3 Ciments Ma… +0,27%        1 860,… 1 860,00  1 860,00 1 860,…       26 48 360…
##  4 Delattre L… +5,15%        51,90   51,88     51,90    51,88        315 16 342…
##  5 Delta Hold… +0,31%        32,49   32,49     32,49    32,49      11666 379 02…
##  6 DISWAY      +2,77%        704,00  676,10    704,00   674,00       314 216 04…
##  7 FENIE BROS… +0,26%        154,40  150,00    154,40   148,10       293 43 617…
##  8 IBMaroc.com +5,99%        33,45   33,00     33,45    32,99        220 7 322,…
##  9 Immorente   +1,90%        102,00  102,00    102,00   101,00      1791 180 90…
## 10 INVOLYS     +1,85%        126,90  126,90    126,90   126,90         2 253,80 
## 11 Jet Contra… +0,40%        239,95  239,95    239,95   239,95         5 1 199,…
## 12 LafargeHol… +0,23%        2 175,… 2 175,00  2 175,00 2 150,…        6 12 952…
## 13 Maghreb Ox… +2,91%        404,95  404,95    404,95   404,95         1 404,95 
## 14 Managem     +0,62%        1 610,… 1 610,00  1 610,00 1 610,…      150 241 50…
## 15 Mutandis    +0,02%        245,15  246,00    246,00   245,05       253 62 103…
## 16 SNEP        +1,00%        744,00  735,00    750,00   734,90       193 142 88…
## 17 Ste Boisso… +2,88%        2 820,… 2 820,00  2 820,00 2 820,…      284 800 88…
## 18 TotalEnerg… +2,34%        1 750,… 1 750,00  1 750,00 1 750,…      400 700 00…
```

> - **today.market()** : est sans argument et renvoie le cours actuel des instruments financier ainsi que leurs variations, leurs cours à l’ouverture, leurs max etc.

```r
#Affichage des données du marché d'aujourd'hui
today.market()
```

```
## # A tibble: 75 × 9
##    Valeur   `Date/Heure` Ouverture Cours  `Variation %` Quantité Volume `+ Haut`
##    <chr>    <chr>        <chr>     <chr>  <chr>            <dbl> <chr>  <chr>   
##  1 Addoha   15.12.2021   10,98     10,73  -2,37%          337344 3 620… 10,98   
##  2 AFMA     15.12.2021   1 319,00  1 319… 0,00%                1 1 319… 1 319,00
##  3 Afric I… 15.12.2021   345,00    344,00 -0,29%           24668 8 485… 345,00  
##  4 Afriqui… 15.12.2021   5 211,00  5 211… +3,99%              10 52 11… 5 211,00
##  5 Agma     15.12.2021   4 266,00  4 266… 0,00%               23 98 11… 4 266,00
##  6 Allianc… 15.12.2021   39,82     39,80  -0,50%            1630 64 85… 39,95   
##  7 Alumini… 15.12.2021   1 400,00  1 400… 0,00%                1 1 400… 1 400,00
##  8 Aradei … 15.12.2021   409,00    409,00 +0,95%               6 2 454… 409,00  
##  9 ATLANTA… 15.12.2021   116,10    116,00 -0,09%              84 9 708… 116,10  
## 10 Attijar… 15.12.2021   482,10    482,60 -0,19%           18738 9 031… 482,60  
## # … with 65 more rows, and 1 more variable: + Bas <chr>
```

> - **today.transactions()** : permet d’obtenir une table des transactions de la journée. Elle est une fonction sans argument.

```r
#Affichages des transactions de la journée
today.transactions()
```

```
## # A tibble: 50 × 5
##    Heure    `Insturment financier` Cours    Quantité Volume    
##    <chr>    <chr>                  <chr>    <chr>    <chr>     
##  1 15:38:56 COSUMAR                262,95   1,00     262,95    
##  2 15:38:40 ITISSALAT AL-MAGHRIB   141,90   1 000,00 141 900,00
##  3 15:38:17 STOKVIS NORD AFRIQUE   16,99    485,00   8 240,15  
##  4 15:38:17 STOKVIS NORD AFRIQUE   16,99    15,00    254,85    
##  5 15:37:48 STOKVIS NORD AFRIQUE   16,99    500,00   8 495,00  
##  6 15:37:17 COSUMAR                262,95   1 900,00 499 605,00
##  7 15:37:15 COSUMAR                262,95   3,00     788,85    
##  8 15:37:01 AUTO HALL              105,00   10,00    1 050,00  
##  9 15:37:00 ATTIJARIWAFA BANK      482,60   300,00   144 780,00
## 10 15:36:39 CIMENTS DU MAROC       1 860,00 25,00    46 500,00 
## # … with 40 more rows
```

## Exemples d'utilisations de la library(casabourse) :
> - Nous allons tracer la courbe de variations des cours des titres de Attijariwafa Bank et de la Banque Populaire du Maroc entre le début de l’année 2020 et le 15 décembre 2021.



```r
#lecture des données de Attijariwafa Bank
atw <- daily.data(ticker = "ATW", from = "01-01-2020", to = "15-12-2021")
#lecture des données de la Banque Populaire du Maroc
bcp <- daily.data(ticker = "BCP", from = "01-01-2020", to = "15-12-2021")
data=data.frame(atw,bcp)

plt <- plot_ly(data = data, x=~as.Date(rownames(data)), y=~data$Value, 
               name = "Attijariwafa Bank", type = 'scatter', mode = 'lines') 

plt <- plt %>% add_trace(y=~data$Value.1,name = "Banque Populaire du Maroc" )
plt <- plt %>% layout(title= 'Variation des cours',
                      xaxis = list(title = 'Dates'), yaxis = list(title = 'Cours'))
plt
```
![alt text](https://github.com/AODiakite/casabourse/blob/main/newplot%20(4).png)



> - Traçons maintenant la courbe des taux de rentabilités des titres de Attijariwafa Bank et de la Banque Populaire du Maroc entre le 15 octobre 2021 et le 15 décembre 2021.


```r
#function de return
rent=function(x){
  r=list(0)
  for (i in 2:length(x)) {
    
    r[i]=(x[i]/x[i-1] -1)*100
  }
  return(t(data.frame(r)))
}
#lecture des données de Attijariwafa Bank
atw <- daily.data(ticker = "ATW", from = "15-10-2021", to = "15-12-2021")
#lecture des données de la Banque Populaire du Maroc
bcp <- daily.data(ticker = "BCP", from = "15-10-2021", to = "15-12-2021")
#Utilisation de la function rent
returnATW=rent(as.numeric(atw$Value))
returnBCP=rent(as.numeric(bcp$Value))

#Traçage de la courbe
df=data.frame(returnATW,returnBCP)
rownames(df)=rownames(atw)
plt <- plot_ly(data = df, x=~as.Date(rownames(df)), y=~df$returnATW, 
               name = "Attijariwafa Bank", type = 'scatter', mode = 'lines') 

plt <- plt %>% add_trace(y=~df$returnBCP,name = "Banque Populaire du Maroc" )
plt <- plt %>% layout(title= 'Variation des renatbilités',
                      xaxis = list(title = 'Dates'), 
                      yaxis = list(title = 'Returns'))
plt
```
![alt text](https://github.com/AODiakite/casabourse/blob/main/newplot%20(5).png)


