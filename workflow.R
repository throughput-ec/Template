
#If its got a missing value, post an annotation that says its missing values
#change function to take large set of values
#maybe create for loop that looks first for condition and then creates annotation if ==yes

remotes::install_github("nickmckay/lipd-utilities",subdir = "R")
remotes::install_github("nickmckay/nuspectral")
remotes::install_github("nickmckay/geoChronR")
install_github("nickmckay/LiPD-Utilities", subdir = "R")

library(geoChronR)
library(devtools)
library(lipdR)
library(dplyr)
library(purrr)

source('src/createThroughputJson.R')

D <- lipdR::readLipd("https://lipdverse.org/Temp12k/1_0_2/Temp12k1_0_2.zip")
ts <- lipdR::extractTs(D)
tib <- lipdR::ts2tibble(ts)

t2 <- tib %>%
  group_by(dataSetName) %>% 
  select(geo_description) %>% 
  distinct()

naz <-  t2[is.na(t2$geo_description), ]
da <- subset(D, names(D) %in% naz$dataSetName)

additionalType <- "http://linked.earth/ontology#Dataset"
body <- "These sites are missing a geo description"

output <- da %>% 
  purrr::map(function(x) {
    createThroughputJson(lipdObject = x,
                         additionalType = additionalType,
                         body = body,
                         tokenFile = "token.R")
  })
