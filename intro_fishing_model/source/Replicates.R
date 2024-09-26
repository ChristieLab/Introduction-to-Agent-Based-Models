Replicates <- function(parameters, n.replicates) {
  # takes all *.set variables and creates the precise number of replicates for each variable
 
 k.adults.final   <- c(1500, 3000)
 fishing.pressure <- c(0.9, 0.5)

 replicates <- expand.grid(k.adults.final, fishing.pressure)
 replicates <- replicates[rep(seq_len(nrow(replicates)), n.replicates), ]
 
 return(replicates)
}  
