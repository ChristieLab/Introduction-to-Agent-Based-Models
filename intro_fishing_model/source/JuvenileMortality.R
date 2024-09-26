JuvenileMortality <- function(pops, parameters) {
  maximum.juvenile.age  <- parameters[["maximum.juvenile.age"]]  #there should not be any juveniles older than maximum.juvenile.age (no hard filter here though, only probablity, hard filter at ageing)
  juvenile.survival.var <- parameters[["juvenile.survival.var"]]
  k.juveniles           <- parameters[["k.juveniles"]]
  k.juv.year            <- parameters[["k.juv.year"]] # must sum to one and must have as many elements as all juvenile year classes; ordered youngest to oldest
  
  # first group individuals
  dems      <- pops[[1]]
  juvs      <- dems[dems[, 4] == 1, ] 
  adults    <- dems[dems[, 4] == 2, ] 

  j.ages <- juvs[, 3]
  juvkey <- 0:(length(k.juv.year)-1) 
  
  JUVS <- NULL
  for(k in 1:length(k.juv.year)) {
    kyear <- k.juv.year[k]
    age   <- juvkey[k]
    keep  <- kyear*k.juveniles  
    keep  <- round(rnorm(1, keep, juvenile.survival.var*keep))
    juvs2 <- length(which(j.ages == age))
    
    if(keep <= 0) {keep = juvs2} # if there are no juveniles of age class, keep all 

    if(keep  < juvs2){ 
      juv2.pos <- which(j.ages == age) # positions of juveniles with age = age
      keepers  <- sample(juv2.pos, keep, replace=FALSE) # will cause a crash if not enough juveniles!
      JUVS    <- c(JUVS, keepers)
      } else {JUVS <- c(JUVS, which(j.ages == age))} # else keep all juveniles
    }
  
  survivors <- juvs[JUVS, ]
  dems      <- rbind(survivors, adults)
  pops[[1]] <- dems  


  return(pops)
}




