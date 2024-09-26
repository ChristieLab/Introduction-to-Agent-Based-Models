Pairs <- function(pops, parameters) {
  egg.max         <- parameters[["egg.max"]]
  egg.multiplier  <- parameters[["egg.multiplier"]]
  egg.addition    <- parameters[["egg.addition"]]  

  dems    <- pops[[1]]
  adults  <- dems[which(dems[, 4] == 2), ]
  juvs    <- dems[which(dems[, 4] == 1), ]
  males   <- adults[which(adults[, 2] == 2), ] 
  females <- adults[which(adults[, 2] == 1), ] 
 
  n.pairs <- min(c(length(females[, 1]), length(males[, 1])))
  pairs   <- cbind(males[sample(1:n.pairs, replace = FALSE), ], females[sample(1:n.pairs, replace = FALSE), ]) # replace = TRUE = polygynandry
  
  # MAY WANT TO OVERIDE IN PARAMETERS
  n.egg <- as.integer(round(n.pairs*2)) # calculate number of offspring per pair
  n.egg <- 1000/(n.egg/2) # See DensityDepenence_plots for why this step is needed
  n.egg <- (n.egg * egg.multiplier) + egg.addition
  if(n.egg < 1) {n.egg <- 1}
  if(n.egg > egg.max) {n.egg <- egg.max}
  n.egg <- round(n.egg)
  
  # Variance in RS introduced below!!
  n.eggs <- rnbinom(length(pairs[, 1]), n.egg, mu = 20) 
  none   <- which(n.eggs == 0) # ensure all pairs have at least one egg
  n.eggs[none] <- 1
  
  p.name1<- paste(pairs[, 1], pairs[, (ncol(pairs)/2)], sep="_")
  p.name2<- paste(pairs[, ((ncol(pairs)/2)+1)], pairs[, ncol(pairs)], sep="_")
  pairs  <- cbind(p.name1, p.name2, n.eggs)
  return(pairs)
}

