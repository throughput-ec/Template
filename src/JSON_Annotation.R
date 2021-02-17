JSONannotation <- function(L){
  J <- list()
  
  #static
  J[["dbid"]] <- "r3d100012894"
  J[["orcid"]] <- "0000-0001-5500-0401"
  J[["additionalType"] <- "http://linked.earth/ontology#Dataset"
  
  J[["id"]] <-  L$datasetId#L[[i]]$datasetId 
  
  J[["body"]] <- "These sites are missing a geo description"
  J[["token"]] <- #secret token
  json <- RJSONIO::toJSON(x = J)
  writeLines(json, con = paste0("~/Documents/Github/throughput-lipd/json_files/",L$dataSetName,".json"))
  return(json)
}