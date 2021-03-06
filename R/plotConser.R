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
#' @examples
#'
#' # Example 1: Plot a conservity against of each position for testSeqShort
#'
#' data(testSeqShort)
#' testSeq <- testSeqShort
#'
#' # Use conservityTable() to create table for testSeqShort,
#' # and pass it to plotOverall() for plotting
#' table  <- conservityTable(testSeq)
#' oPar <- par(mar = c(2, 4, 2, 1)) # Set plot parameters to layout plot in center.
#' plotOverall(table)
#'
#' # Example 2: Plot a conservity against of each position for raw data
#' # sampleSeq3.txt. This should takes longer time to run.
#' findpath <- system.file("extdata", "sampleSeq3.txt", package = "conservedPos")
#' rawSeq <- Biostrings::readBStringSet(findpath,"fasta")
#'
#' # Use conservityTable() to create table for rawSeq,
#' # and pass it to plotOverall() for plotting
#' table <- conservityTable(rawSeq)
#' oPar <- par(mar = c(2, 4, 2, 1)) # Set plot parameters to layout plot in center.
#' plotOverall(table)
#'
#' @references
#' R - Bar Charts: Bar:Chart Labels, Title and Colors.
#' \emph{Tutorialpoints-R Tutorial} \href{https://www.tutorialspoint.com/r/r_bar_charts.htm}{Link}
#'
#' Silva, A. (2020) TestingPackage: An Example R Package For BCB410H. Unpublished.
#' \href{https://github.com/anjalisilva/TestingPackage}{Link}
#'
#' R Bar Plot (2018) DataMentor
#' \emph{Getting Started in Data Science With R } \href{https://www.datamentor.io/r-programming/bar-plot/}{Link}
#'
#' @export
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
#' # Example 1: Plot a conservity against of each position for testSeqShort
#' # from position 2 to 15
#' data(testSeqShort)
#' testSeq <- testSeqShort
#' # Use conservityTable() to create table for testSeqShort,
#' # and pass it to plotOverall() for plotting
#' table  <- conservityTable(testSeq)
#' oPar <- par(mar = c(2, 4, 2, 1)) # Set plot parameters to layout plot in center.
#' plotPartial(table, 2, 15)
#'
#' # Example 2: Plot a conservity against of each position for raw data
#' # from position 50 to 100
#' # sampleSeq3.txt. This should takes longer time to run.
#' findpath <- system.file("extdata", "sampleSeq3.txt", package = "conservedPos")
#' rawSeq <- Biostrings::readBStringSet(findpath,"fasta")
#'
#' # Use conservityTable() to create table for rawSeq,
#' # and pass it to plotOverall() for plotting
#' table  <- conservityTable(testSeq)
#' oPar <- par(mar = c(2, 4, 2, 1)) # Set plot parameters to layout plot in center.
#' plotPartial(table, 50, 100)
#'
#'
#' @references
#'R - Bar Charts: Bar Chart Labels, Title and Colors.
#' \emph{Tutorialpoints-R Tutorial} \href{https://www.tutorialspoint.com/r/r_bar_charts.htm}{Link}
#'
#' Silva, A. (2020) TestingPackage: An Example R Package For BCB410H. Unpublished.
#' \href{https://github.com/anjalisilva/TestingPackage}{Link}
#'
#' R Bar Plot (2018) DataMentor
#' \emph{Getting Started in Data Science With R } \href{https://www.datamentor.io/r-programming/bar-plot/}{Link}
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

