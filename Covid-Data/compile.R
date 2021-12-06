# This script imports all data from Covid-Data folder, downloaded from JHU.edu
# https://github.com/CSSEGISandData/COVID-19.git
# data is compiled into df.cov and filtered for CA by county
# exports csv to covid-regression folder as "CA-2020-cov-data.csv"


library(plyr)
library(dplyr)
library(readr)
library(stringr)

setwd("/Users/nicholasgunady/Documents/covid-regression")
dir <- "Covid-Data"
#get all csv filenames
filenames <- list.files(path=dir, pattern="*.csv", full.names=TRUE) %>% str_remove("Covid-Data/")
setwd("/Users/nicholasgunady/Documents/covid-regression/Covid-Data")

#mount all data to df.cov VERY COMPUTE HEAVY
# df.cov <- ldply(filenames, read_csv) #careful, this is a very long loop
df <- df.cov %>% filter(Province_State == "California") %>% dplyr::rename(County = Admin2)

#reset working directory
setwd("/Users/nicholasgunady/Documents/covid-regression")

df <- df %>% group_by(County) %>% dplyr::summarise(Case.Count.2020=sum(Confirmed))

write.csv(df, "CA-2020-cov-data.csv")