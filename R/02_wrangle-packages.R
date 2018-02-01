#libraries
library(here)
## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()
pkgs <- read.csv(here("data","installed-packages.csv"), header = T)
pkgs <- pkgs[,-1] # remove bad rownames
## filter out packages in the default library
## keep variables Package and Built
## if you use dplyr, code like this will work:
apt <- ipt %>%
  filter(LibPath == .libPaths()[1]) %>%
  select(Package, Built)

pkgs.2 <- pkgs[!(pkgs$LibPath == .libPaths()[1]),c(1,5)]

## write this new, smaller data frame to data/add-on-packages.csv

write.csv(pkgs.2, here("data","add-on-packages.csv"))

## make a frequency table of package by the version in Built
## if you use dplyr, code like this will work:

num.v <- t(t(summary(pkgs.2$Built)))
apt_freqtable <- data.frame(Built=row.names(num.v), n=num.v, prop=num.v/sum(num.v))

## write this data frame to data/add-on-packages-freqtable.csv
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples

write.csv(apt_freqtable, here("data","add-on-packages-freqtable.csv"))

## when this script works, stage & commit it and the csv files
## PUSH!
