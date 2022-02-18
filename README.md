![CRAN/METACRAN](https://www.r-pkg.org/badges/version/casabourse)
![CRAN/METACRAN](https://badgen.net/cran/license/casabourse)
[![](https://cranlogs.r-pkg.org/badges/casabourse)](https://cran.r-project.org/package=casabourse)
[![](https://cranlogs.r-pkg.org/badges/grand-total/casabourse?color=brightgreen)](https://cran.r-project.org/package=casabourse)

<img align=left src="https://github.com/AODiakite/casabourse/blob/main/casabourse-logo.png" alt="drawing" width="200" />


## Casabourse

```r
library(casabourse)
```
Casabourse est un R package qui permet d’obtenir des données à temps réel de la bourse de Casablanca. L’objectif est de faciliter l’accès aux données à tous les utilisateurs du langage de programmation R. Ce package comporte une diversité de données accessibles juste par appel de fonction.

## Guide d'installation
Ce package est disponible sur [github](https://github.com/AODiakite/casabourse) et sur le [CRAN](https://cran.r-project.org/web/packages/casabourse/index.html) pour l’installer vous devez exécuter une de ces lignes de codes :

```r
#CRAN version
install.packages("casabourse")
#Or github dev version
devtools::install_github("AODiakite/casabourse")
```


## La fonction **tickers()**
 
Cette fonction ne prend aucun argument et retourne une table de données associant chaque entreprise à un ticker. Il est important de visualiser les tickers. En effet, ils sont utilisés par les autres fonctions du package pour représenter les entreprises auxquelles ils correspondent.

```r
#' Affichage des tickers
tickers <- tickers()
head(tickers)
```

```
##   tick     codeisin
## 1 MASI         MASI
## 2  ADH MA0000011512
## 3  AFM MA0000012296
## 4  AFI MA0000012114
## 5  GAZ MA0000010951
## 6  AGM MA0000010944
```
## La fonction **get_info(ticker)**

Depuis la version 1.0.0 de 'casabourse', il est possible d'obtenir des informations rapides sur une entreprise.

```r
#Information sur Addoha P
get_info('adh')
```

```
##                            Information
## name                          Addoha P
## name_2                          ADDOHA
## ISIN                      MA0000011512
## nbTitre                      402551254
## cours                           11.900
## cloture                          11.55
## capitalisation           4790359922.60
## cotation         18/02/2022 \xe0 15:39
## variation                         3.03
## volume_variation                  0.35
## volume                        30613642
## volumeTitre                    2572575
## ouverture                       11.900
## min                             11.700
## max                             12.240
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
##  1 ATLANTASANAD         Casablanca  1396 -        -         11/02/2022
##  2 ATTIJARIWAFA BANK    Casablanca   493 -        -         11/02/2022
##  3 BANK OF AFRICA       Casablanca   220 -        -         11/02/2022
##  4 BCP                  Casablanca 29455 -        -         11/02/2022
##  5 CIMENTS DU MAROC     Casablanca  1996 -        -         11/02/2022
##  6 COSUMAR              Casablanca 27145 -        -         11/02/2022
##  7 DISWAY               Casablanca  7671 -        -         11/02/2022
##  8 DOUJA PROM ADDOHA    Casablanca  1179 -        -         11/02/2022
##  9 HPS                  Casablanca  6631 -        -         11/02/2022
## 10 ITISSALAT AL-MAGHRIB Casablanca  1363 -        -         11/02/2022
## 11 LABEL VIE            Casablanca  5301 -        -         11/02/2022
## 12 LAFARGEHOLCIM MAROC  Casablanca  2271 -        -         11/02/2022
## 13 MANAGEM              Casablanca  1820 -        -         11/02/2022
## 14 MICRODATA            Casablanca   655 -        -         11/02/2022
## 15 MUTANDIS SCA         Casablanca   263 -        -         11/02/2022
## 16 SMI                  Casablanca  1499 -        -         11/02/2022
## 17 SNEP                 Casablanca  8611 -        -         11/02/2022
## 18 SODEP-Marsa Maroc    Casablanca  2897 -        -         11/02/2022
## 19 SONASID              Casablanca   750 -        -         11/02/2022
## 20 TAQA MOROCCO         Casablanca  1249 -        -         11/02/2022
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
##   `Code Isin`  Instrument           `Nombre de titres` Cours    `Facteur flott…`
##   <chr>        <chr>                <chr>              <chr>    <chr>           
## 1 MA0000012445 ATTIJARIWAFA BANK    215 140 839,00     493,00   0,30            
## 2 MA0000011488 ITISSALAT AL-MAGHRIB 879 095 340,00     136,70   0,20            
## 3 MA0000012320 LAFARGEHOLCIM MAR    23 431 240,00      2 280,00 0,30            
## 4 MA0000011884 BCP                  203 312 473,00     295,00   0,20            
## 5 MA0000012437 BANK OF AFRICA       205 606 648,00     223,00   0,25            
## 6 MA0000012247 COSUMAR              94 487 143,00      271,95   0,40            
## # … with 3 more variables: `Facteur de plafonnement` <chr>,
## #   `Capitalisation flottante` <chr>, Poids <chr>
```


 
## La fonction **daily.data("ticker", "from", "to")** :
 
Comme son nom l’indique, cette fonction renvoie les cours journaliers d’un titre entre deux dates données par l’utilisateur. Elle reçoit trois arguments :
* ticker : qui correspond au ticker du titre qui nous intéresse ou même de l'indice MASI( pour rappelle vous pouvez connaitre tous les tickers des titres grâce à la fonction tickers() )
* from : représente la date de début de collecte de données. Cet argument est du type ‘’jour-mois-année’’.
* to : représente la date d’arrêt de collecte de données. Cet argument est du type ‘’jour-mois-année’’.
NB : Les week-end ne sont pas pris en compte lors du téléchargement des données et en plus Il est important de mettre chaque argument entre des doubles quotes( ‘’ ‘’)


```r
#Affichage des cours journaliers de ATTIJARIWAFA BANK entre 01 janvier 2017 et le 14 decembre 2021
atw <- daily.data("atw","01-01-2017","14-12-2021") #affection de la table a la variable atw
head(atw) #afichage des premiers elements de la table
```

```
##             Value Minimum Maximum Variation Volume
## 09/02/2017 430.05  430.05  431.50      0.00  49717
## 10/02/2017 430.00  430.00  432.95     -0.01  20909
## 13/02/2017 440.00  430.00  440.00      2.33   3028
## 14/02/2017 427.00  427.00  435.00     -2.95   2038
## 15/02/2017 430.00  427.00  432.00      0.70  82428
## 16/02/2017 430.00  427.00  433.80      0.00   4937
```

 
## La fonction **bySector()** :
 
Elle renvoie une table contenant des données par secteur d’activités. Elle est une fonction sans argument.

```r
#Afichage des données par secteur d'activité
bySector()
```

```
## # A tibble: 23 × 4
##    Secteur                                          Valeur `Var %` `Var % 31/12`
##    <chr>                                            <chr>  <chr>   <chr>        
##  1 LOISIRS ET HOTELS                                515,69 2,66 %  3,83 %       
##  2 INGENIERIES & BIENS D’EQUIPEMENT INDUSTRIELS     182,61 0,93 %  51,34 %      
##  3 BOISSONS                                         17 38… 0,67 %  8,50 %       
##  4 SERVICES DE TRANSPORT                            4 456… 0,42 %  3,50 %       
##  5 SOCIETE DE FINANCEMENT & AUTRES ACTIVITES FINAN… 9 517… 0,28 %  7,50 %       
##  6 SOCIETES DE PLACEMENT IMMOBILIER                 1 091… 0,23 %  9,07 %       
##  7 SERVICES AUX COLLECTIVITES                       1 166… -       18,62 %      
##  8 ELECTRICITE                                      2 791… -       18,95 %      
##  9 BATIMENT & MATERIAUX DE CONSTRUCTION             22 50… -0,09 % 4,52 %       
## 10 MINES                                            28 14… -0,13 % 9,91 %       
## # … with 13 more rows
```

 
## La fonction **instruments()** :
 
Elle est sans argument et nous donne les informations sur les instruments financiers du marché, telles que le code ISIN, le compartiment, le nombre de titres etc.


```r
#Afichage les instruments financiers du marché
instruments()
```

```
## # A tibble: 76 × 5
##    `Code ISIN`  `Libelle instru…` `Secteur/Catég…` Compartiment `Nombre de tit…`
##    <chr>        <chr>             <chr>            <chr>        <chr>           
##  1 MA0000012296 AFMA              ACTIONS 1ERE LI… Principal B  1000000         
##  2 MA0000012114 AFRIC INDUSTRIES… ACTIONS 1ERE LI… Principal B  291500          
##  3 MA0000010951 AFRIQUIA GAZ      ACTIONS 1ERE LI… Principal A  3437500         
##  4 MA0000010944 AGMA              ACTIONS 1ERE LI… Alternatif A 200000          
##  5 MA0000011819 ALLIANCES         ACTIONS 1ERE LI… Principal B  22078588        
##  6 MA0000010936 ALUMINIUM DU MAR… ACTIONS 1ERE LI… Principal B  465954          
##  7 MA0000012460 ARADEI CAPITAL    ACTIONS 1ERE LI… Principal F  10645783        
##  8 MA0000011710 ATLANTASANAD      ACTIONS 1ERE LI… Principal A  60283595        
##  9 MA0000012445 ATTIJARIWAFA BANK ACTIONS 1ERE LI… Principal A  215140839       
## 10 MA0000010969 AUTO HALL         ACTIONS 1ERE LI… Principal A  50294528        
## # … with 66 more rows
```

 
## La classe de fonctions **today.** :
 
C’est une classe de fonctions permettant d’obtenir des informations de la date d’aujourd’hui. Nous pouvons y trouver les fonctions suivantes :

> - **today.prizelist("up_or_down")** : reçoit ‘’up’’ ou ‘’down’’ et renvoie respectivement une table de palmarès de hausse ou de baisse des cours des instruments du marché

```r
#Afichage du palmares de hausse des cours de la journée
today.prizelist('up')
```

```
## # A tibble: 38 × 7
##    Nom          Cours `1 sem. perf.%` `Max 1 sem.` `Min 1 sem.` `Quantité 1 se…`
##    <chr>        <chr> <chr>           <chr>        <chr>        <chr>           
##  1 Alliances P  47,00 +19,90%         48,40        39,00        2 036 166,00    
##  2 FENIE BROSS… 165,… +15,42%         170,00       137,85       62 888,00       
##  3 Lydec P      280,… +11,96%         -            -            360,00          
##  4 BALIMA P     124,… +8,06%          124,00       114,75       45,00           
##  5 Oulmes P     1 24… +7,52%          1 244,00     1 157,00     38,00           
##  6 Mutandis Br  263,… +5,45%          268,50       248,00       167 341,00      
##  7 IBMaroc.com… 43,99 +4,74%          43,99        40,74        6 127,00        
##  8 Immr Invest… 115,… +4,55%          118,00       106,50       247 645,00      
##  9 SNEP P       861,… +4,25%          890,00       809,00       124 579,00      
## 10 Cartier Saa… 31,50 +3,96%          31,50        30,10        8 540,00        
## # … with 28 more rows, and 1 more variable: `Volume 1 sem.` <chr>
```

> - **today.market()** : est sans argument et renvoie le cours actuel des instruments financier ainsi que leurs variations, leurs cours à l’ouverture, leurs max etc.

```r
#Affichage des données du marché d'aujourd'hui
today.market()
```

```
## # A tibble: 75 × 9
##    Valeur    `Date/Heure` Ouverture Cours `Variation %` Quantité Volume `+ Haut`
##    <chr>     <chr>        <chr>     <chr> <chr>         <chr>    <chr>  <chr>   
##  1 Addoha    11.02.2022   11,97     11,79 -1,75%        623 750  7 399… 12,10   
##  2 AFMA      11.02.2022   1 390,00  1 39… -0,36%        7        9 730… 1 390,00
##  3 Afric In… 11.02.2022   357,00    357,… -2,99%        85       30 38… 358,00  
##  4 Afriquia… 11.02.2022   5 750,00  5 75… -2,54%        8        46 00… 5 750,00
##  5 Agma      11.02.2022   4 801,00  4 80… 0,00%         14       67 21… 4 801,00
##  6 Alliances 11.02.2022   47,00     47,00 +2,06%        177 070  8 408… 48,40   
##  7 Aluminiu… 11.02.2022   1 445,00  1 44… -1,63%        27       39 00… 1 445,00
##  8 Aradei C… 11.02.2022   450,10    451,… +0,22%        25 245   11 36… 458,95  
##  9 ATLANTAS… 11.02.2022   141,10    139,… -0,99%        22 435   3 151… 142,00  
## 10 Attijari… 11.02.2022   493,00    493,… 0,00%         16 404   8 091… 494,05  
## # … with 65 more rows, and 1 more variable: `+ Bas` <chr>
```

> - **today.transactions()** : permet d’obtenir une table des transactions de la journée. Elle est une fonction sans argument.

```r
#Affichages des transactions de la journée
today.transactions()
```

```
## # A tibble: 50 × 5
##    Heure    `Insturment financier`  Cours    Quantité Volume      
##    <chr>    <chr>                   <chr>    <chr>    <chr>       
##  1 15:40:13 SOTHEMA                 1 650,00 7,00     11 550,00   
##  2 15:39:52 DELATTRE LEVIVIER MAROC 96,98    14,00    1 357,72    
##  3 15:39:52 DELATTRE LEVIVIER MAROC 96,98    10,00    969,80      
##  4 15:39:52 DELATTRE LEVIVIER MAROC 96,98    10,00    969,80      
##  5 15:39:30 COSUMAR                 271,45   79,00    21 444,55   
##  6 15:39:30 COSUMAR                 271,45   521,00   141 425,45  
##  7 15:39:30 COSUMAR                 271,45   430,00   116 723,50  
##  8 15:39:20 ATTIJARIWAFA BANK       493,00   2 850,00 1 405 050,00
##  9 15:39:14 SALAFIN                 755,00   37,00    27 935,00   
## 10 15:39:14 SALAFIN                 755,00   338,00   255 190,00  
## # … with 40 more rows
```

## Exemples d'utilisations de la library(casabourse) :
> - Nous allons tracer la courbe de variations des cours des titres de Attijariwafa Bank et de la Banque Populaire du Maroc entre le début de l’année 2020 et le 15 décembre 2021.



```r
#lecture des données de Attijariwafa Bank
atw <- daily.data(ticker = "ATW", from = "01-01-2020", to = "15-12-2021")
```


```r
#lecture des données de la Banque Populaire du Maroc
bcp <- daily.data(ticker = "BCP", from = "01-01-2020", to = "15-12-2021")
```

```r
data=data.frame(atw,bcp)

plt <- plot_ly(data = data, x=~as.Date(rownames(data),'%d/%m/%Y'), y=~data$Value, 
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
```

```r
#lecture des données de la Banque Populaire du Maroc
bcp <- daily.data(ticker = "BCP", from = "15-10-2021", to = "15-12-2021")
```


```r
#Utilisation de la function rent
returnATW=rent(as.numeric(atw$Value))
returnBCP=rent(as.numeric(bcp$Value))

#Traçage de la courbe
df=data.frame(returnATW,returnBCP)
rownames(df)=rownames(atw)
plt <- plot_ly(data = df, x=~as.Date(rownames(df),'%d/%m/%Y'), y=~df$returnATW, 
               name = "Attijariwafa Bank", type = 'scatter', mode = 'lines') 

plt <- plt %>% add_trace(y=~df$returnBCP,name = "Banque Populaire du Maroc" )
plt <- plt %>% layout(title= 'Variation des rentabilités',
                      xaxis = list(title = 'Dates'), 
                      yaxis = list(title = 'Returns'))
plt
```
![alt text](https://github.com/AODiakite/casabourse/blob/main/newplot%20(5).png)


