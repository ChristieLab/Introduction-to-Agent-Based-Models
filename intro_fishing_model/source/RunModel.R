# RunModel <- function(n.generations, i) {

# checks to begin at model start ================
# 1. output directory specified

## for DEV ONLY ==================================================================================# 
  rm(list = ls())
  getwd()  # delete/source
  setwd("C:/Users/fishf/local/work/workshops/AFS_IBM/intro_fishing_model/")    
  getwd()
  #library("hierfstat")
  #library("inbreedR")
  #library("purgeR")
  #library("dplyr")
  library("beepr")
  options(scipen=999)  # prevent scientific notation for long numbers, can be important for some models
 
  base.directory <- getwd() 
  outdir         <- paste(base.directory,"/output/",sep="")  # directory to save model output  
  source(paste(base.directory, "/source/FunctionSourcer.R", sep = '')) #loads packages, sources functions, and sets source directory
  data.frame(unlist(parameters)) # show all parameters
  
##==============================================================================================#  
    
  # initialize populations: create juveniles, adults
  # dems positions are as follows; design so can always add on and expand (add columns): 
  #1 ID; only unique when combined with b.year 
  #2 sex
  #3 age
  #4 stage; 1= juvenile, 2 = adult
  #5 d.dev; # siblings in year 0 (not overly informative, could be modified)
  #6 b.year; birth year
  

  juveniles<- Juveniles(parameters)
  adults   <- Adults(parameters)
  dems     <- rbind(juveniles, adults)
  
  pops     <- list(dems) # a one element list to start
  OUTPUT   <- list()     # a list to add important output from functions too
  
  for(n in 1:parameters[["n.years"]]){

    pops <- Ageing(pops) # add one year to all individuals ages

    pops <- Stageing(pops, parameters) # change stage based on age 
    
    pops <- AdultMortality(pops, parameters)  # random mortality of adults back to carrying capacity
    
    # Reproduction (2 stages): 1. create pairs (currently monogamous); 2. create offspring per pair
    pairs <- Pairs(pops, parameters) # variance in RS introduced as rnbinom in egg production
    pops  <- Reproduction(pops, pairs, parameters, n)  # only performs reproduction
      
    pops  <- JuvenileMortality(pops, parameters) #juvenile mortality
    
    if(n >= fishing.start.year & n <= fishing.end.year & parameters[["fishing.pressure "]] > 0) {
      pops <- Selection(pops, parameters) # NO d.dev currently!
      }
    
    
    #calculates output
    output <- Output2(pops, n, OUTPUT) 
  }

 Plots(output) # comment out if running on cluster; includes beep too
 beep(2)
 # uncommenting the below line will write output to output directory; note append is set to TRUE 
 #write.table(output, "../output/output.txt", append = TRUE, sep = ",", col.names = TRUE, row.names = FALSE) # writes output  
  
#}
  
