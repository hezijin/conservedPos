context("Test functions in PositionCal.R")
library(Biostrings)

test_that("create correct Position Vec", {
  testSeq <- DNAStringSet("AGAATATTTGCGATTGATTTGGCCAGCTGGTCTTCGA")
  testSeq <- c(testSeq, "TGAAAATGAAAAAAATAATGATGGTTACACTGGTCA",
               "TGAAAATGAAAAAAATAATGATGGTTACACTGGTCA")
  pos <- createPosVec(testSeq, 1)
  expect_equal(pos, "ATT")
})

test_that("find correct conservity from a index", {
  testSeq <- DNAStringSet("AGAATATTTGCGATTGATTTGGCCAGCTGGTCTTCGA")
  testSeq <- c(testSeq, "TGAAAATGAAAAAAATAATGATGGTTACACTGGTCA",
               "TGAAAATGAAAAAAATAATGATGGTTACACTGGTCA")
  pos <- createPosVec(testSeq, 1)
  cons <- findConservityFromS(pos)
  expect_equal(cons, 2/3)
})

test_that("find correct max length in DNAStringSet", {
  testSeq <- DNAStringSet("AGAATATTTGCGATTGATTTGGCCAGCTGGTCTTCGA")
  testSeq <- c(testSeq, "TGAAAATGAAAAAAA",
               "TGAA")
  maxL <- findMaxLen(testSeq)

  expect_equal(maxL, 37)
})

test_that("check the conservity vector value at several index", {
  testSeq <- DNAStringSet("AGAATATTTGCGATTGATTTGGCCAGCTGGTCTTCGA")
  testSeq <- c(testSeq, "TGAAAATGAAAAAAA",
               "TGAA")
  conserV <- conservityTable(testSeq)

  expect_equal(conserV[37], 1)
  expect_equal(conserV[1], 2/3)
  expect_equal(conserV[2], 1)
})

