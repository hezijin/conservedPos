#' Plot the conservity of the positions
#'
#'
#' This function plots the overall alignment's conservity
#' using the conservity vector generated from the function
#' conservityTable.
#'
#' @param conserV a vector with serveral number of conservity
#'
#' @return a plot to view the overall alignment's conservity
#'
#' @importFrom graphics barplot
plotOverall <- function(conserV){
  graphics::barplot(conserV, xlab = "Position", ylab = "Conservity", col = "blue",
          names.arg = c(1:length(conserV)), main="Conservity for Input Sequences")
}

#' This function plots the conservity for selected alignment region
#' from user using the conservity vector.
#'
#' @param conserV a vector with serveral number of conservity
#' @param firstIndex a number to point the start index of selected region
#' @param lastIndex a number to point the end index of selected region
#'
#' @return a plot to view the seleted region alignment's conservity
#'
#' @examples
#'
#'
#' @export
#' @importFrom graphics barplot
plotPartial <- function(conserV, firstIndex, lastIndex){
  maxL <- length(conserV)
  if(firstIndex > maxL | lastIndex > maxL | firstIndex >= lastIndex){
    print("Invalid Index!")
  }else{
    graphics::barplot(conserV[firstIndex:lastIndex], xlab = "Position", ylab = "Conservity", col = "blue",
            names.arg = c(firstIndex:lastIndex), main = "Plot of site conservity")
  }


}

