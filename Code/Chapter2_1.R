library(readxl)
library(gdata)
library(xts)
library(dplyr)
library(quantmod)
library(tseries)

sep11travel <- read.xls('PTSF-Datasets/Sept11Travel.xls', 
                        stringsAsFactors=FALSE, )

colnames(sep11travel) <- c('Month', 'Air', 'Rail', 'Auto')
sep11travel$Month <- strftime(sep11travel$Month, format="%m-%y")
sep11travel$Air <- as.numeric(gsub(",","",sep11travel$Air))
sep11travel$Rail <- as.numeric(gsub(",","",sep11travel$Rail))
summary(sep11travel)

head(sep11travel)
tail(sep11travel, 12)

plot(sep11travel$Rail, type='l', ylim = c(0, max(sep11travel$Rail)))
lines(sep11travel$Air, type='l', col='green')

sep11travel.ts <- ts(sep11travel$Air.RPM..000s., start = c(1990,1), end = c(2004, 4), 
                     freq = 12)
