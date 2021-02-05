createThroughputJson <- function(L){

  J <- list()
  
  #static
  J[["dbid"]] <- "lipdRe3Placeholder"
  J[["orcid"]] <- "https://orcid.org/0000-0001-5500-0401"
  
  
  
  #objects
  J[["objects"]] <- vector(mode = "list",length  = 2) #preallocate empty list
  J[["objects"]][[1]][["type"]] <- "dataset" #Does this describe the annotation?
  J[["objects"]][[1]][["id"]] <- "annotationId?" #how generate this?
  
  
  J[["objects"]][[2]][["additionalType"]] <- "http://linked.earth/ontology#Dataset"
  J[["objects"]][[2]][["dataid"]] <-  L[[]]$datasetId 
  
  J[["body"]] <- "These sites are missing a geo description"

  return(J)
}
#write to json
#  json <- RJSONIO::toJSON(x = J)

#  writeLines(json, con = "~/Downloads/test.json")

#  return(json)
#}
for i in 1:length(L){