Ageing <- function(pops) {
  
  dems <- pops[[1]] # isolate dems matrix
  ages <- dems[, 3] # isolate ages
  ages <- ages + 1  # increment by 1 year

  print(table(ages)) # print ages
  
  dems[, 3] <- ages  # overwrite ages in dems
  
  pops[[1]] <- dems  # return new dems to pops list
  return(pops)       # reutrn results from function
}
