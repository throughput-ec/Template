remotes::install_github("nickmckay/lipd-utilities",subdir = "R")
remotes::install_github("nickmckay/nuspectral")
remotes::install_github("nickmckay/geoChronR")
install_github("nickmckay/LiPD-Utilities", subdir = "R")

library(geoChronR)
library(devtools)
library(lipdR)
library(dplyr)

D=readLipd("~/Desktop/Temp12k1_0_1")
length(D)
#redownload data and rerun


e <- D[which(names(D)==naz$dataSetName)]
length(e)
#D=readLipd("~/Desktop/globalHolocene1_0_0")
ts = extractTs(D)
tib <- ts2tibble(ts)

t2 <- tib%>%group_by(dataSetName)%>%select(geo_description)%>%distinct()
t3 <-  t2[!is.na(t2$geo_description),]
naz <-  t2[is.na(t2$geo_description),]
da <- subset(D,names(D) %in% naz$dataSetName)



tib[which(is.na(tib$ageUnits)),]%>%select(age)
sel <- tib[which(tib$ageUnits=="unitless"),]
#looking for variables that dont have units
tib[which(is.na(tib$depthUnits)),]
#age units,year, depth units missing
#^start with these

##level description
##dataset level
tib$dataSetName
t2 <- tib%>%group_by(dataSetName)%>%select(geo_description)%>%distinct()
t3 <-  t2[!is.na(t2$geo_description),]
naz <-  t2[is.na(t2$geo_description),]

t2[which(is.na(t2)),]
dim(t2)
tib[which(is.na(tib$geo_description)),]
tib[which(is.na(tib$geo_location)),]
tib[which(is.na(tib$geo_notes)),]
tib[which(is.na(tib$chronDoi)),]

#geographic metadata easy to visualize/understand


#annotations for units should be at #column level
#unique identifier for column
tib$paleoData_TSid


##site descriptions missing?
head(sel)

tib2<-tib[,c(26:38,41:49,301:391)]
as.data.frame(tib2[1,70:106])
tib%>% select()

godad <- D$`117_723A.Godad.2011`$pub
D$Deep.Shuman.2016
  
  library(rlist)
library(dplyr)
pubz <- D%>%
  list.select(pub)

library(naniar)
head(pubz)
class(tib2)
tibby %>% replace_with_na(replace = list(x = <NA>))
tibby <- data.frame(tib2)

tibby$pub1_author <- with(tibby, rep(pub1_author, lengths(dataSetName)))
tibby$pub1_author[sapply(tibby$pub1_author, function(x) length(x)==0L)] <- NA
tibby$pub1_author <- gsub("name","",tibby$pub1_author)
tibby$pub1_author <- unlist(tibby$pub1_author)

tibby$pub2_author <- with(tibby, rep(pub2_author, lengths(dataSetName)))
tibby$pub2_author[sapply(tibby$pub2_author, function(x) length(x)==0L)] <- NA
tibby$pub2_author <- gsub("name","",tibby$pub2_author)
tibby$pub2_author <- unlist(tibby$pub2_author)

tibby$pub3_author <- with(tibby, rep(pub3_author, lengths(dataSetName)))
tibby$pub3_author[sapply(tibby$pub3_author, function(x) length(x)==0L)] <- NA
tibby$pub3_author <- gsub("name","",tibby$pub3_author)
tibby$pub3_author <- unlist(tibby$pub3_author)

tibby$pub4_author <- with(tibby, rep(pub4_author, lengths(dataSetName)))
tibby$pub4_author[sapply(tibby$pub4_author, function(x) length(x)==0L)] <- NA
tibby$pub4_author <- gsub("name","",tibby$pub4_author)
tibby$pub4_author <- unlist(tibby$pub4_author)

tibby$pub5_author <- with(tibby, rep(pub5_author, lengths(dataSetName)))
tibby$pub5_author[sapply(tibby$pub5_author, function(x) length(x)==0L)] <- NA
tibby$pub5_author <- gsub("name","",tibby$pub5_author)
tibby$pub5_author <- unlist(tibby$pub5_author)

write.csv(tibby,file = "allPubData.csv")

#plut into database structure -- take a stab at it 
#cypher script to pull into neo4j from csv
#work on the ruler with the core photo
#separate routine -- takes pnj
#a nice, plotrgb function 
#email Kim about paleo-seminar




#for(i in 1:length(annot)){
#    a[i] <- rjson::fromJSON(annot[[i]])
#    stack(a)
#}
