#' Plot the conservity of the positions
#'
#' This function plots the overall alignment's conservity
#' using the conservity vector generated from the function
#' conservityTable.
plotOverall <- function(conserV){
  barplot(conserV, xlab = "Position", ylab = "Conservity", col = "blue",
          names.arg = c(1:length(conserV)), main="Conservity for Input Sequences")
}

#' This function plots the conservity for selected alignment region
#' from user using the conservity vector.
plotPartial <- function(conserV, firstIndex, lastIndex){
  maxL <- length(conserV)
  if(firstIndex > maxL | lastIndex > maxL | firstIndex >= lastIndex){
    print("Invalid Index!")
  }else{
    barplot(conserV[firstIndex:lastIndex], xlab = "Position", ylab = "Conservity", col = "blue",
            names.arg = c(firstIndex:lastIndex), main="Conservity for Input Sequences")
  }


}
