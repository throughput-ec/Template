createThroughputJson <- function(L){
  J <- list()
   
  #static
  J[["dbid"]] <- "r3d100012894"
  J[["orcid"]] <- "https://orcid.org/0000-0001-5500-0401"
   
   
   
  #objects
  J[["objects"]] <- vector(mode = "list",length  = 2) #preallocate empty list
  J[["objects"]][[1]][["type"]] <- "dataset" #Does this describe the annotation?
  J[["objects"]][[1]][["id"]] <- "annotationId?" #how generate this?
   
   
  #J[["objects"]][[2]][["level"]] <- "dataset"
  J[["objects"]][[2]][["additionalType"]] <- "http://linked.earth/ontology#Dataset"

    J[["objects"]][[2]][["dataid"]] <-  L$datasetId#L[[i]]$datasetId 

  J[["body"]] <- "These sites are missing a geo description"
  #J[["body"]] <- createDescription(L)
  #for a publication DOI
  #J[["body"]] <- L$pub[[1]]$doi
  
  #write to json
  #return(J)
#}

  json <- RJSONIO::toJSON(x = J)
  writeLines(json, con = paste0("~/Documents/Github/throughput-lipd/json_files/",L$dataSetName,".json"))
  return(json)
}


createDescription <- function(L){
  #https://developers.google.com/search/docs/data-types/dataset#dataset
  
  #current goal. Automate description using 1) Location, 2) Duration 3) variables and 4) archive type
  
  #location
  sn <- L$geo$siteName
  gcmd <- L$geo$gcmdLocation
  
  if(is.null(sn)){
    noLoc <- TRUE
  }else{
    noLoc <- FALSE
  }
  
  if(is.null(gcmd)){
    locstring <- sn
  }else{
    locstring <- glue::glue("{sn} ({gcmd})")
  }
  
  #duration
  ts <- extractTs(L)
  ages <- try(pullTsVariable(ts,"age"),silent = TRUE)
  years <- try(pullTsVariable(ts,"year"),silent = TRUE)
  au <- try(pullTsVariable(ts,"ageUnits"),silent = TRUE)
  yu <- try(pullTsVariable(ts,"yearUnits"),silent = TRUE)
  
  noDur <- FALSE
  if(class(ages) != "try-error"){#lets go
    if(is.list(ages)){
      young <- min(sapply(ages,min,na.rm = TRUE))
      old <- max(sapply(ages,max,na.rm = TRUE))
    }else{
      young <- min(ages,na.rm = TRUE)
      old <- max(ages,na.rm = TRUE)
    }
    units <- unique(au)[1]
  }else if(class(years) != "try-error"){
    if(is.list(years)){
      young <- max(sapply(ages,max,na.rm = TRUE))
      old <- min(sapply(ages,min,na.rm = TRUE))
    }else{
      young <- max(years,na.rm = TRUE)
      old <- min(years,na.rm = TRUE)
    }
    units <- unique(yu)[1]
  }else{
    noDur <- TRUE
  }
  
  if(!noDur){
    durstring <- glue::glue("from {round(old)} to {round(young)} ({units})")
  }
  
  #variables
  variables <- extractTs(L) %>%
    pullTsVariable("paleoData_variableName") %>%
    setdiff(c("age","depth","year"))
  
  if(length(variables) > 2){
    variables <- paste(variables,collapse= ", ") %>%
      stringr::str_replace(pattern = "(?=[^,]*$)",replacement = " and")
  }else if(length(variables) == 2){
    variables <- paste(variables,collapse= ", ") %>%
      stringr::str_replace(pattern = ",",replacement = " and")
  }
  
  
  if(noLoc){
    descstring <- glue::glue("This dataset is derived from a {L$archiveType} archive, and includes data on {variables}. The data are relevant to the time interval {durstring}.")
  }else{
    descstring <- glue::glue("This dataset from {locstring} is derived from a {L$archiveType} archive, and includes data on {variables}. The data are relevant to the time interval {durstring}.")
  }
  
  return(descstring)

}

