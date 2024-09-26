#FunctionSourcer <- function() {
# Set working directory, import packages, source functions, 
setwd(paste(base.directory,"/source/", sep = ''))    # set temp working directory 
source(paste(getwd(), "/Juveniles.R", sep = ''))
source(paste(getwd(), "/Adults.R", sep = ''))
source(paste(getwd(), "/Plots.R", sep = ''))
source(paste(getwd(), "/JuvenileMortality.R", sep = ''))
source(paste(getwd(), "/AdultMortality.R", sep = ''))
source(paste(getwd(), "/Output2.R", sep = ''))
source(paste(getwd(), "/Parameters.R", sep = ''))
source(paste(getwd(), "/Replicates.R", sep = ''))
source(paste(getwd(), "/RunModel_replicates.R", sep = ''))  #uncomment when adding replicates!
source(paste(getwd(), "/Selection.R", sep = ''))
source(paste(getwd(), "/Ageing.R", sep = ''))
source(paste(getwd(), "/Stageing.R", sep = ''))
source(paste(getwd(), "/Pairs.R", sep = ''))
source(paste(getwd(), "/Reproduction.R", sep = ''))

