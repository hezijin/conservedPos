#' Find most conserved nucleotide in each position and its frequency
#'
#' This function grab the nucleotide for all of sequences at index position
#' to create a XString sequence for a collection of this nucleotide. Then
#' the function reformats the Xstring into a string clean it up.
#'
#' @param seqSet A set of aligned sequence read from fasta file
#' @param index A numeric index for generating Position String at that position.
#'
#' @return A String containing nucleotides at index position for sequences.
#'
createPosVec <- function(seqSet, index){
  position <- c()

  # Loop over each sequences and grab the nucleotide at index postion.
  for (i in 1: length(seqSet)){
    if(length(seqSet[[i]]) >= index){
      nul <- seqSet[[i]][index]
      nul <- paste(nul, "")
      position[i] <- nul
    }
  }

  # Reformat position from vector to a string and remove NA and whitespace
  position <- paste(position, collapse = "")
  position <- gsub(" ", "", position, fixed = TRUE)
  position <- gsub("NA", "", position, fixed = TRUE)
  return (position)
}

#' This function finds the highest frequency of nucleotide in input string.
#'
#' @param str A string containing character nucleotides
#'
#' @return  Return a numeric value for highest frequency
#'
findConservityFromS <- function(str){

  # Split the str into character vector and find max occurances
  # of certain nucleotide.
  split <- strsplit(str, "")
  maxval <- max(table(split))

  # Use the length of the str to calculate the highest frequency
  # of the nulceotide.
  length <- nchar(str)
  return(maxval / length)
}

#' This function finds the max length of sequence for input sequence set
#'
#' @param seqSet seqSet A set of aligned sequence read from fasta file
#'
#' @return A numeric value of the max length of sequence for seqSet

findMaxLen <- function(seqSet){
  max <- 0
  for (i in 1:length(seqSet)){
    if (max < length(seqSet[[i]])){
      max <- length(seqSet[[i]])
    }
  }
  return(max)
}

#' This function calculates the conservity of all positions for input
#' sequences and generate a vector contains each position's conservity
#'
#' @param seqSet seqSet A set of aligned sequence read from fasta file
#'
#' @return a vector contains each position's
#'
conservityTable <- function(seqSet){
  # Find max length of sequences in seqSet, it is used as the max range of
  # position to compute the conservity. It also guarantees that each position
  # to be calculated even the sequences have slightly length differences.
  max <- findMaxLen(seqSet)

  # From index 1 to max length, create a position string for each index
  # and find the conservity from that index.
  conserVec <- c()
  for (i in 1:max){
    newstr <- createPosVec(seqSet, i)
    conser <- findConservityFromS(newstr)
    conserVec[i] <- conser
  }
  return(conserVec)
}
