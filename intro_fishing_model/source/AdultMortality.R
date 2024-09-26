AdultMortality <- function(pops, parameters) {
  adult.survival.var      <- parameters[["adult.survival.var"]]
  k.adults                <- parameters[["k.adults"]]
  max.adult.age           <- parameters[["maximum.adult.age"]]

  # first remove all individuals that are too old
  dems      <- pops[[1]]
  juvs      <- dems[dems[, 4] == 1, ] 
  adults    <- dems[dems[, 4] == 2, ] 
  adults    <- adults[which(adults[, 3] <= max.adult.age), ]       # maximum age is set to max.adult.age! Hard cutoff!
     
  # next remove any adults over the carrying capacity 
  keep     <- round(rnorm(1, k.adults, adult.survival.var*k.adults))
  if(keep <= 0) {keep = length(adults)} 
  if(keep < length(adults[, 1])){ 
   adults  <- adults[sample(1:nrow(adults), keep, replace=FALSE), ]
  }
       
 pops[[1]] <- rbind(juvs, adults)

# remove adults from doms too
return(pops)
}
