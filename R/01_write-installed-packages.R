## deja vu from yesterday!

# libraries
library(here)

## create a data frame of your installed packages

## keep the variables
##   * Package
##   * LibPath
##   * Version
##   * Priority
##   * Built
cols.2keep <- c("Package","LibPath","Version","Priority","Built")
pkgs <- as.data.frame(installed.packages())
pkgs <- pkgs[,colnames(pkgs) %in% cols.2keep]

## write it to data/installed-packages.csv
write.csv(pkgs, here("data","installed-packages.csv"))

## YES overwrite the file that is there now
## that came from me (Jenny)
## it an example of what yours should look like

## when this script works, stage & commit it and the csv file
## PUSH!
