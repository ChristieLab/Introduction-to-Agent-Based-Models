Plots <- function(output) {
  #beep(2) # add beep to end of model run
  if(length((dev.list()["RStudioGD"])) > 0) {dev.off(dev.list()["RStudioGD"])} # clear old plots if present
  plot(output[, 1], output[, 2], xlab = "year", ylab="N juveniles", cex=0.02, pch =19, col="dodgerblue", bty="l", ylim = c(0, max(output[, 2])))
  lines(output[, 1], output[, 2], col="blue", bty="l", ylim = c(0, max(output[, 3])))
  points(output[, 1], output[, 2], pch=19, cex=1,col="dodgerblue")
  
  plot(output[, 1], output[, 3], xlab = "year", ylab="adults", cex=0.02, pch =19, col="dodgerblue", bty="l", ylim = c(0, max(output[, 3])))
  lines(output[, 1], output[, 3], col="blue", bty="l", ylim = c(0, max(output[, 3])))
  points(output[, 1], output[, 3], pch=19, cex=1,col="dodgerblue")
  
  plot(output[, 1], output[, 4], xlab = "year", ylab="N adults fished out of population", cex=0.02, pch =19, col="dodgerblue", bty="l", ylim = c(0, max(output[, 4])))
  lines(output[, 1], output[, 4], col="blue", bty="l", ylim = c(0, max(output[, 3])))
  points(output[, 1], output[, 4], pch=19, cex=1,col="orange")
}
