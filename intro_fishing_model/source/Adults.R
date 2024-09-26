Adults <- function(parameters) {
  minimum.adult.age    <- parameters[["maximum.juvenile.age"]] + 1
  maximum.adult.age    <- parameters[["maximum.adult.age"]]
  k.adults             <- parameters[["k.adults"]]

  ID     <- (k.juveniles+1):(k.juveniles+k.adults)  # birth year + ID = unique ID, at start of model all individuals have birth.year 0 despite age
  age    <- rep(minimum.adult.age:maximum.adult.age, k.adults)
  age    <- sample(age, k.adults, replace = FALSE)  # age classes are roughly equal at the start of the simulation; could change this to decline with age to speed up "age structure" stabilization
  stage  <- 2  
  sex    <- sample(rep(1:2, k.adults*10), k.adults, replace = TRUE)
  d.dev  <- 0
  b.year <- 0 
  
  population <- cbind(ID, sex, age, stage, d.dev, b.year) 
}

