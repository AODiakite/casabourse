# casabourse 1.2.0

# casabourse 1.1.0

Error handling with tryCatch()

# casabourse 1.0.0

## Added Masi historical data

Now it is possible to get historical data from the MASI index
```r
daily.data(ticker = 'MASI',from = '01-01-2018', to = '01-01-2022')
```
## New functions get_info(ticker)
This function allows you to get quick information about a company
```r
#' Get informations about ATW
get_info(ticker = 'atw')
```
* Added a `NEWS.md` file to track changes to the package.
