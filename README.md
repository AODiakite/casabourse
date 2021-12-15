---
title: "Library Casabourse"
author: "ABDOUL OUDOUSS DIAKITE"
date: "15 décembre,2021"
---


## Casabourse

```r
library(casabourse)
```
Casabourse est un R package qui permet d’obtenir des données à temps réel de la bourse de Casablanca. L’objectif est de faciliter l’accès aux données à tous les utilisateurs du langage de programmation R. Ce package comporte une diversité de données accessibles juste par appel de fonction.

## Guide d'installation
Ce package est disponible sur [github](https://github.com/AODiakite/casabourse) pour l’installer vous devez exécuter ces lignes de codes suivantes

```r
#Installez les packages devtools et reticulate si vous ne les avez pas déjà
library(devtools)
library(reticulate)
devtools::install("AODiakite/casabourse")
```

Une fois que vous avez installé casabourse, vous devez appeler la fonction **install.tools** qui installera toutes les dépendences du package.

```r
library(casabourse)
install.tools()
# Si ">>>" apparait, inserer le mot exit, appuyer sur entrer puis laisser le telechargement sur poursuivre jusqu'à l'apparition de '>'
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
## 1 MA0000012445 ATTIJARIWAFA BANK    215 140 839,00     482,10   0,30            
## 2 MA0000011488 ITISSALAT AL-MAGHRIB 879 095 340,00     142,10   0,20            
## 3 MA0000012320 LAFARGEHOLCIM MAR    23 431 240,00      2 170,00 0,30            
## 4 MA0000011884 BCP                  203 312 473,00     280,00   0,20            
## 5 MA0000012247 COSUMAR              94 487 143,00      266,00   0,40            
## 6 MA0000012437 BANK OF AFRICA       205 606 648,00     186,05   0,25            
## # … with 3 more variables: Facteur de plafonnement <chr>,
## #   Capitalisation flottante <chr>, Poids <chr>
```

## La fonction **madex.data()**
 
Par équivalence à la fonction masi.data(), madex.data() retourne une table de données de l’indice MADEX.

```r
#' Affichage des données de MADEX
mx <- madex.data() #affection de la table MADEX a la variable mx
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
NB : Les week-end ne sont pas pris en compte lors du téléchargement des données et en plus Il est important de mettre chaque argument entre des doubles quotes(" ")


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
##    Secteur                              Valeur    `Var %` `Var % 31/12`
##    <chr>                                <chr>     <chr>   <chr>        
##  1 SERVICES DE TRANSPORT                4 323,08  0,90 %  33,81 %      
##  2 AGROALIMENTAIRE / PRODUCTION         37 313,82 0,46 %  20,52 %      
##  3 BATIMENT & MATERIAUX DE CONSTRUCTION 21 052,60 0,08 %  26,68 %      
##  4 BANQUES                              13 994,25 0,08 %  14,64 %      
##  5 DISTRIBUTEURS                        46 477,84 -       47,70 %      
##  6 ELECTRICITE                          2 458,10  -       20,22 %      
##  7 INDUSTRIE PHARMACEUTIQUE             8 374,70  -       182,35 %     
##  8 LOISIRS ET HOTELS                    484,24    -       -6,14 %      
##  9 TELECOMMUNICATIONS                   2 085,60  -       -2,00 %      
## 10 TRANSPORT                            2 512,59  -       5,76 %       
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
## # A tibble: 12 × 8
##    Valeur     `Variation %` Cours   Ouverture `+ Haut` `+ Bas` Quantité Volume  
##    <chr>      <chr>         <chr>   <chr>     <chr>    <chr>      <dbl> <chr>   
##  1 Aluminium… +0,36%        1 400,… 1 400,00  1 400,00 1 400,…        4 5 600,00
##  2 ATLANTASA… +0,09%        116,10  115,00    117,00   115,00     23760 2 755 9…
##  3 Attijariw… +0,29%        483,50  483,50    486,00   483,50     26761 12 990 …
##  4 Auto Hall  +0,09%        105,80  105,00    105,80   105,00      1120 117 690…
##  5 BoA        +1,02%        187,95  186,05    187,95   186,00      2526 472 491…
##  6 Cartier S… +0,03%        30,09   30,09     30,09    30,09         35 1 053,15
##  7 Ciments M… +0,27%        1 855,… 1 860,00  1 860,00 1 855,…       45 83 585,…
##  8 COSUMAR    +0,73%        267,95  265,00    267,95   263,00     83240 21 957 …
##  9 DISWAY     +0,15%        685,00  685,00    685,00   672,00       201 137 672…
## 10 Resid Dar… +1,72%        29,50   29,80     29,80    28,64       6456 186 851…
## 11 Saham Ass… +1,02%        1 484,… 1 484,00  1 484,00 1 484,…       90 133 560…
## 12 SODEP      +0,90%        281,00  282,00    282,00   279,15      1488 417 513…
```

> - **today.market()** : est sans argument et renvoie le cours actuel des instruments financier ainsi que leurs variations, leurs cours à l’ouverture, leurs max etc.

```r
#Affichage des données du marché d'aujourd'hui
today.market()
```

```
## # A tibble: 75 × 9
##    Valeur   `Date/Heure` Ouverture Cours `Variation %` Quantité Volume  `+ Haut`
##    <chr>    <chr>        <chr>     <chr> <chr>            <dbl> <chr>   <chr>   
##  1 Addoha   14.12.2021   11,18     10,99 -1,88%          148431 1 634 … 11,24   
##  2 AFMA     14.12.2021   1 319,00  1 31… 0,00%                1 1 319,… 1 319,00
##  3 Afric I… 14.12.2021   345,00    345,… 0,00%                3 1 035,… 345,00  
##  4 Afriqui… 14.12.2021   5 011,00  5 01… 0,00%               14 70 154… 5 011,00
##  5 Agma     14.12.2021   4 266,00  4 26… 0,00%               23 98 118… 4 266,00
##  6 Allianc… 14.12.2021   40,00     40,00 0,00%            25552 1 023 … 40,50   
##  7 Alumini… 14.12.2021   1 400,00  1 40… +0,36%               4 5 600,… 1 400,00
##  8 Aradei … 14.12.2021   405,15    405,… 0,00%             1731 701 31… 405,15  
##  9 ATLANTA… 14.12.2021   115,00    116,… +0,09%           23760 2 755 … 117,00  
## 10 Attijar… 14.12.2021   483,50    483,… +0,29%           26761 12 990… 486,00  
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
##  1 15:38:03 MANAGEM                1 600,00 10,00    16 000,00 
##  2 15:36:30 LESIEUR CRISTAL        187,30   12,00    2 247,60  
##  3 15:36:15 DOUJA PROM ADDOHA      10,99    10,00    109,90    
##  4 15:36:06 ATLANTASANAD           116,10   485,00   56 308,50 
##  5 15:35:40 ATLANTASANAD           116,10   200,00   23 220,00 
##  6 15:34:30 ATTIJARIWAFA BANK      483,50   300,00   145 050,00
##  7 15:34:22 DOUJA PROM ADDOHA      10,99    200,00   2 198,00  
##  8 15:33:35 ITISSALAT AL-MAGHRIB   142,10   400,00   56 840,00 
##  9 15:32:47 MED PAPER              25,67    10,00    256,70    
## 10 15:32:25 ITISSALAT AL-MAGHRIB   142,10   1,00     142,10    
## # … with 40 more rows
```

 
## Les fonctions annexes :
 
Ce package contient aussi des fonctions annexes très utiles. Parmi elles :

> - **install.tools()** : pour une première utilisation du package, vous devez exécuter cette fonction qui permettra de télécharger automatiquement toutes les dépendances dont vous aurez besoin
> - **gsheet2tbl("url")** : reçoit un lien d’une feuille de calcul Google sheet comme argument et permet de lire automatique les données qui s’y trouve sous forme d’une table sans avoir à télécharger la feuille dans votre ordinateur.
> - **gsheet2txtl("url")** : reçoit un lien d’une feuille de calcul Google sheet comme argument et permet de lire automatique les données qui s’y trouve sous forme de texte sans avoir à télécharger la feuille dans votre ordinateur.
