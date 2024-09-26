Stageing <- function(pops, parameters) {
  maximum.juvenile.age <- parameters[["maximum.juvenile.age"]]
  dems   <- pops[[1]]

  # isolate juveniles, identify juvs too old, increment their stage
  adults <- dems[which(dems[, 4] == 2), ]
  juvs   <- dems[which(dems[, 4] == 1), ]
  ages   <- juvs[, 3]
  new    <- which(ages > maximum.juvenile.age) # GREATER THAN NOT GREATER THAN EQUAL

  juvs[new, 4] <- 2
  dems         <- rbind(juvs, adults)
  
  pops[[1]] <- dems
  return(pops)
}
