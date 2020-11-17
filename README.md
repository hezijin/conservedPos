
<!-- README.md is generated from README.Rmd. Please edit that file -->

# conservedPos

<!-- badges: start -->

<!-- badges: end -->

## Description

Description: The goal of conservedPos package is to find important
conserved sites for small target region by conducting a site-specific
analysis for a set of aligned DNA sequences. The package will provide
function to count nucleotides occurrances in each position independently
and calculates the frequency of the nucleotides in order to quantify the
conservity of each position.

## Installation

You can install the released version of conservedPos

``` r
require("devtools")
devtools::install_github("hezijin/conservedPos", build_vignettes = TRUE)
library("conservedPos")
```

For tutorial how to use:

``` r
browseVignettes("conservedPos")
```

## Overview

The package contains 4 function to reformat and analyze the input
sequences and 2 function to plot for the result. createPosVec() grabs
the nucleotide for all of sequences at index position. Then in
conservityTable(), it loops all of the index and calculate the most
conserved nucleotide frequency through findConservityFromS().

plotOverall() plots the overall alignment’s conservity using the
conservity vector generated from the function conservityTable while
plotPartial()plots the seleted region from users.

## Contribution

The idea of developing this package is inspired by PWM Viewing and
Searching. The way of clear up and reformat sequence string in function
createPosVec is referenced to many website (show in Reference section).
The idea of function findConservityFromS comes from the function in
Biostirngs package function NucleotideFrequencyAt, while my function
avoids the limitation of the input (NucleotideFrequencyAt is not allowed
to use stirngs with NA, which means length of the input sequences need
to be equal).The function findMaxLen and conservityTable are written by
me. The way of generate bar plot comes from R language Tutorial(show in
Reference section) and used in function plotOverall and plotPartial.

## Reference

1.  How to find the most repeated word in a vector with R
    <https://stackoverflow.com/questions/48632957/how-to-find-the-most-repeated-word-in-a-vector-with-r>

2.R Bar Plot <https://www.datamentor.io/r-programming/bar-plot/>

3.Biostrings in R
<https://web.stanford.edu/class/bios221/labs/biostrings/lab_1_biostrings.html>

4.R - Bar Charts <https://www.tutorialspoint.com/r/r_bar_charts.htm>

5.  H. Pagès, P. Aboyoun, R. Gentleman and S. DebRoy (2020). Biostrings:
    Efficient manipulation of biological strings. R package version
    2.58.0. <https://bioconductor.org/packages/Biostrings>

6.  Orchestrating high-throughput genomic analysis with Bioconductor. W.
    Huber, V.J. Carey, R. Gentleman, …, M. Morgan Nature Methods,
    2015:12, 115.

7.  SeqLogo: Sequence logos for DNA sequence alignments
    <https://rdrr.io/bioc/seqLogo/>

## Acknowledgements

This package was developed as part of an assessment for 2020BCB410H:
Applied Bioinformatics, University of Toronto, Toronto,CANADA.
