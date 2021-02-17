#general datasets to annotate for coding, funding,

#figure out how to add date, modify, access, etc
#HOW TO CREATE OWN ANNOTATIONS IN NEO4J, HOW TO QUERY

#lets organize all of the annotations from lipd and show connections
#funding metadata


#keep a google sheet for metadata -- all of the annotations that we are putting in
#get to working on lipd filies

http://nickmckay.github.io/LiPD-utilities/r/index.html
https://github.com/nickmckay/LiPD-utilities
http://nickmckay.github.io/GeoChronR/
https://lipdverse.org/Temp12k/current_version/
  
  
  
  
  
  FIND CODE REPOSITORIES THAT ARE NOT CATALOGUED FOR LINKEDEARTH
go through code repositories and see if they are actually using data and can we figure out what datasets

Use this command in neo4j:

  MATCH (dc:dataCat)
WHERE dc.name CONTAINS("Linked")
WITH dc
MATCH (dc)<-[:Target]-(:ANNOTATION)-[Target]->(cd:codeRepo)
RETURN dc.name, cd.name


In prep for all day workshop:
  
  Morgan is working on typology --
  
  Take the result from my search and tag each repo as it pertains to Morgan's typology

deborah kider

start finding more linkedearth repos that link to databases


https://nickmckay.github.io/LinkedEarth-Neotoma-P418/LE-Neo_UseCase.html
https://github.com/nickmckay/LinkedEarth-Neotoma-P418
http://nickmckay.github.io/GeoChronR/
https://github.com/nickmckay/Temperature12k
process/extract file to send to Claire.
i.e. csv files with wavelengths and depth averaged measurements
