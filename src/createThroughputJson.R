createThroughputJson <- function(lipdObject, additionalType, body, tokenFile){
  
  token <- readr::read_file("token.R")
  
  postObject <- list(dbid = "r3d100012894",
                           orcid = "0000-0001-5500-0401",
                           additionalType = additionalType,
                           id = lipdObject$datasetId,
                           body = body,
                           token = token[1])
  
  postTest <- httr::POST("throughputdb.com", 
                         body = postObject,
                         encode = "json")
  
  if (postTest$status_code == 200) {
    message("Success!")
    return(NULL)
  } else {
    return(postTest)
  }
}
