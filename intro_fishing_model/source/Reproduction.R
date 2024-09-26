Reproduction <- function(pops, pairs, parameters, n) {

  dems <- pops[[1]]
  current.year <- n
  n.egg  <- as.numeric(pairs[, 3]) 

  gtype1 <- pairs[,1]
  gtype2 <- pairs[,2]
  
  #step 2: populate offspring matrix
  offs <- rep(seq_len(length(n.egg)), times = n.egg)

  # finalize IDS 
  ID    <- 1:length(offs)
  sex   <- sample(1:2, length(offs), replace = TRUE)
  age   <- 0
  stage <- 1
  d.dev <- offs  # keeps track of families (literally pair row number)
  b.year<- current.year  

  new  <- cbind(ID, sex, age, stage, d.dev, b.year)
  pops[[1]] <- rbind(new, dems)

  return(pops)
}

