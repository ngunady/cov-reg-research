# This script imports all data from Covid-Data folder, downloaded from JHU.edu
# https://github.com/CSSEGISandData/COVID-19.git
# data is compiled into df.cov and filtered for CA by county
# exports csv to covid-regression folder as "cov-data.csv"
rm(list = ls())

library(plyr)
library(readr)
library(stringr)

setwd("/Users/nicholasgunady/Documents/covid-regression")
dir <- "Covid-Data1"
#get all csv filenames
filenames <- list.files(path=dir, pattern="*.csv", full.names=TRUE) %>% str_remove("Covid-Data/")
setwd("/Users/nicholasgunady/Documents/covid-regression/Covid-Data1")

#mount all data to df.cov VERY COMPUTE HEAVY
df.cov <- ldply(filenames, read_csv) #careful, this is a very long loop
df <- df.cov %>% filter(Country_Region == "CA")

