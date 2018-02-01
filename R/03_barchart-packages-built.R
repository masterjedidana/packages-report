library(ggplot2)
library(here)

## make a barchart from the frequency table in data/add-on-packages-freqtable.csv

## read that csv into a data frame, then ...
apt_freqtable <- read.csv(here("data","add-on-packages-freqtable.csv"))

## if you use ggplot2, code like this will work:
ggplot(apt_freqtable, aes(x = Built, y = n)) +
  geom_bar(stat = "identity") + theme_bw()

## write this barchart to figs/built-barchart.png
## if you use ggplot2, ggsave() will help

ggsave(here("figs","built-barchart.png"), plot = last_plot())

## YES overwrite the file that is there now
## that came from me (Jenny)

## when this script works, stage & commit it and the png file
## PUSH!
