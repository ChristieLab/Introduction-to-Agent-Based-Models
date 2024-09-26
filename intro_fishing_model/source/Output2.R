Output2 <- function(pops, n, OUTPUT) {
  if(n == 1) {output <- NULL} # initialize; does not do anything
  
  dems     <- pops[[1]]
  sexes    <- table(dems[, 2])
  ages     <- table(dems[, 3])
  stages   <- table(dems[, 4])

  
  # calculate number killed by fishing; written to file in Selection.R
  if(n < fishing.start.year | parameters[["fishing.pressure "]] == 0) {n.killed <- 0} else 
    {n.killed <-  read.csv("temp.csv")
     n.killed <-  as.numeric(n.killed[2])
    }  # number killed by selection
  
  output.new <- c(n, stages[1], stages[2], n.killed)
  output.new <- t(data.frame(output.new))
  colnames(output.new) <- c("year", "juvs", "adults", "n_killed_selection")
  
  output     <- rbind(output, output.new)
  return(output)
}
