#==================================================================================================#
# Script created by Mark Christie, contact at markchristie1500@gmail.com
# Script created in version R 4.2.3
# This script:  Basic introduction to R for ABMs
# Usage notes: Run line by line
#==================================================================================================#
# set working directory, load packages
# comments proceeded with hash # 
setwd("/media/lar/Elements/work/workshops/AFS_IBM/intro_fishing_model")
getwd()

install.packages("beepr")
library("beepr")
beep()

### Vectors ====================================================================#

fish.id <- 1:10  # create a vector
fish.id          # look at the vector
fish.id[1]       # index the vector
fish.id[2:8]     # index the vector
new.fish.id <- fish.id[2:8]  # keep the output of indexing
new.fish.id                  # look at output again   

### Matrices ====================================================================#
# useful for your agents, use when possible

agents <- matrix(2,3,4) # create a simple matrix
agents
colnames(agents) <- cbind("ID", "age", "stage", "birth.year") # give columns names
agents

agents[1, ]  # index first row, all columns
agents[, 1]  # index first column, all rows
agents[1, 1] # index first row and column

agents[1, 1] # index first row and column
agents[1:2, ] # index first two rows, all columns

dim(agents)
nrow(agents)
ncol(agents)

### Data frames ====================================================================#
# useful for your agents, use when factors needed

# say you want to add some factorial data
new <- rep("perch", 3)
agents <- cbind(agents, new)  # add it as a column
agents # look at it
is.data.frame(agents) # is it a data.frame; no
agents <- data.frame(agents) # is it a data.frame; yes
is.data.frame(agents)
class(agents)


### Lists ====================================================================#
# useful for aplications when combinding data types (e.g., vectors, matrices, data frames)

perch <- list()
length(perch)
class(perch)
perch

perch[[1]] <- agents
perch[[2]] <- rep("fish are friends not food", 3)
perch[[3]] <- 1:10
perch

perch[[2]] # index elements from list
perch[[1]][1, 4] # advanced indexing!!

### Functions ====================================================================#

dat <- perch[[1]] # isolate data frame
dat
dat <- as.numeric(dat[, 1]) # take first column only

Addone <- function(x) {x + 1}
Addone(x=dat)


