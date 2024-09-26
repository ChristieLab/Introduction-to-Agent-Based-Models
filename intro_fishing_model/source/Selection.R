Selection <- function(pops, parameters) {
  fishing.pressure <- parameters[["fishing.pressure "]]
  dems <- pops[[1]]

  # what age classes to target
  hist(dems[, 3])
  
  targets <- max(dems[, 3])-1 # find the second oldest age class
  
  old.adults <- which(dems[, 3] >= targets)  # will keep fishing down age classes if fishing pressure is high enough
  selection  <- sample(old.adults, (fishing.pressure * length(old.adults)), replace = FALSE) # remove these adults, find position to index
  
  write.csv(length(selection), "temp.csv")
  
  dems <- dems[-selection, ]
  pops[[1]] <- dems

  return(pops)
}


