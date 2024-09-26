#==================================================================================================#
# Script created by Mark Christie, contact at markchristie1500@gmail.com
# Script created in version R 4.2.1
# This script:  Generates model output for rescue projects
# Usage notes: Set all parameters and then source this file (see markdown for details)
#==================================================================================================#
# set working directory, load packages
setwd("/media/lar/Elements/work/workshops/AFS_IBM/intro_fishing_model/")
base.directory <- getwd()

test <- 12

#==================================================================================================#

source(paste(base.directory, "/source/FunctionSourcer.R", sep = '')) #loads packages, sources functions, and sets source directory
data.frame(unlist(parameters)) # show all parameters
n.replicates  <- 2             # number of replicates for each combination of parameters
replicates    <- Replicates(parameters, n.replicates)

for(i in 1:length(replicates[, 1])){
  parameters[["k.adults.final"]]    <- replicates[i, 1]  # adult population size
  parameters[["fishing.pressure"]]  <- replicates[i, 2]  # fishing pressure
  model <- RunModel_replicates(n.generations, i)
}

