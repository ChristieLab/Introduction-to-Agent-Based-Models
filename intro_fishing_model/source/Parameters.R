# Note: this is the default file; all variables are manipulated in Replicates.R
# If a parameter has a value of NA; it is varied directly in Replicates.R

#Input parameters
parameters <- list()          # all parameters must be added to this list (see code below section break : ======)

## Demographic and life history parameters =======================#
k.adults                  <- 500     # 500 default; adult carrying capacity
k.juvenile.multiplier     <- 3        # how many times more juveniles should there be than adults
k.juveniles 	            <- k.adults*k.juvenile.multiplier   # set as proportion of adults (easier to adjust population sizes to obtain Ne)
juvenile.survival.var 	  <- 0.01       # default  = 0.01 , now set as proportion of k.juveniles 
adult.survival.var        <- 0.01       # default = 0.01  , now set as proportion of k.adults

# life history parameters 
maximum.juvenile.age   <- 2     # maximim age for a juvenile ; IF set to 2, a juvenile can be 2 but not 3 (see Stageing)
maximum.adult.age      <- 5     # maximum age for adult (output may be +1 depending on when age is measured (+1 if measured after ageing)) )     
k.juv.year             <- cbind(0.5, 0.3, 0.2) # must sum to one and must have as many elements as all juvenile year classes; ordered youngest to oldest

#Timing parameters 
fishing.start.year   <- 50        # year that fishing starts
n.years              <- 175       # total number of years in the model
fishing.end.year     <- n.years   # n.years is default, but can end earlier
fishing.pressure     <- 0     # proportion of oldest x age classes removed (see Selection.R function)  

# Density dependent egg production
egg.multiplier <- 1   # 1 and 10 seem like good starting places
egg.addition   <- 5   # 5 is default; 150 make it flat
egg.max        <- 150 # maximum number of eggs per pair ()
  
# Growth parameters  can implement standard fisheries growth functions (Von Bertalanffy growth equation below)
##y   <- L * (1-e^(-K * (t-tzero)))
#maximum.juvenile.size <- 150 # equal to L in above equation
#maximum.adult.size    <- 800 # equal to L in above equation
#transform.threshold   <- 80 #20 # size at which all juveniles above will transform into juveniles
#adult.threshold       <- 450 # size at which all juveniles will transform into adults
#shape.parameter       <- 0.0011 # equal to K in above equation
#shape.var             <- 0.0002 # how much within-population, between-individual variation do we want. analagous to k.sd in growth.R
#e                     <- exp(1) # equal to e in above equation
#tzero                 <- -15   # size at age 0, all sizes in mm, shifts lines left or right along x-axis (could add variation in egg size/provisioning by varying this parameter)



# Add all parameters to list===============================================================#
parameters[["n.years"]]            <- n.years
parameters[["fishing.start.year"]] <- fishing.start.year
parameters[["fishing.end.year"]]   <- fishing.end.year  

parameters[["k.juveniles"]]           <- k.juveniles 
parameters[["k.juvenile.multiplier"]] <- k.juvenile.multiplier
parameters[["maximum.juvenile.age"]]  <- maximum.juvenile.age 
parameters[["maximum.adult.age"]]     <- maximum.adult.age

parameters[["juvenile.survival.var"]] <- juvenile.survival.var 
parameters[["adult.survival.var"]]    <- adult.survival.var 
parameters[["egg.max"]]               <- egg.max
parameters[["egg.multiplier"]]        <- egg.multiplier
parameters[["egg.addition"]]          <- egg.addition

parameters[["k.adults"]] <- k.adults
parameters[["fishing.pressure "]] <-  fishing.pressure 
parameters[["k.juv.year"]] <- k.juv.year

