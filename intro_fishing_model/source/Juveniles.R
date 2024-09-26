Juveniles <- function(parameters) {
  minimum.juvenile.age <- 0
  maximum.juvenile.age <- parameters[["maximum.juvenile.age"]]
  k.juveniles          <- parameters[["k.juveniles"]]

  ID      <- 1:k.juveniles    # birth year + ID = unique ID, at start of model all individuals have birth.year 0 despite age
  age     <- rep(minimum.juvenile.age:maximum.juvenile.age, k.juveniles)
  age     <- sample(age, k.juveniles, replace = FALSE)  # age classes are roughly equal at the start of the simulation; could change this to decline with age to speed up "age structure" stabilization
  stage   <- 1  
  sex     <- sample(rep(1:2, k.juveniles*10), k.juveniles, replace = TRUE)
  d.dev   <- 0
  b.year  <- 0   
  
  population <- cbind(ID, sex, age, stage, d.dev, b.year) 
  }




