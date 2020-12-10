context("Test functions in PositionCal.R")


test_that("create correct Position Vec", {
  data(testSeqShort)
  testSeq <- testSeqShort
  pos <- createPosVec(testSeq, 1)
  expect_equal(pos, "ATT")
})

test_that("find correct conservity from a index 1", {
  data(testSeqShort)
  testSeq <- testSeqShort
  pos <- createPosVec(testSeq, 1)
  cons <- findConservityFromS(pos)
  expect_equal(cons, 2/3)
})

test_that("find correct conservity from a index 12", {
  data(testSeqShort)
  testSeq <- testSeqShort
  pos <- createPosVec(testSeq, 12)
  cons <- findConservityFromS(pos)
  expect_equal(cons, 2/3)
})

test_that("find conserved nucleotide from a index 12", {
  data(testSeqShort)
  testSeq <- testSeqShort
  pos <- createPosVec(testSeq, 12)
  cons <- findConservedNul(pos)
  expect_equal(cons, "A")
})

test_that("find conserved nucleotide from a index 2", {
  data(testSeqShort)
  testSeq <- testSeqShort
  pos <- createPosVec(testSeq, 2)
  cons <- findConservedNul(pos)
  expect_equal(cons, "G")
})

test_that("find conserved nucleotide from a index 20", {
  findpath <- system.file("extdata", "sampleSeq2.txt", package = "conservedPos")
  rawSeq <- Biostrings::readBStringSet(findpath,"fasta")
  pos <- createPosVec(rawSeq, 20)
  cons <- findConservedNul(pos)
  expect_equal(cons, "T")
})

test_that("find correct max length in BStringSet", {
  data(testSeqUnequal)
  testSeq <- testSeqUnequal
  maxL <- findMaxLen(testSeq)
  expect_equal(maxL, 37)
})

test_that("find correct max length in BStringSet", {
  data(testSeqUnequal)
  testSeq <- testSeqUnequal
  maxL <- findMaxLen(testSeq)
  expect_equal(maxL, 37)
})

test_that("find correct max length in BStringSet", {
  data(testSeqShort)
  testSeq <- testSeqShort
  maxL <- findMaxLen(testSeq)
  expect_equal(maxL, 37)
})

test_that("find correct max length in BStringSet", {
  findpath <- system.file("extdata", "sampleSeq1.txt", package = "conservedPos")
  rawSeq <- Biostrings::readBStringSet(findpath,"fasta")
  maxL <- findMaxLen(rawSeq)
  expect_equal(maxL, 28)
})

test_that("find correct max length in BStringSet", {
  findpath <- system.file("extdata", "sampleSeq2.txt", package = "conservedPos")
  rawSeq <- Biostrings::readBStringSet(findpath,"fasta")
  maxL <- findMaxLen(rawSeq)
  expect_equal(maxL, 210)
})

test_that("find correct max length in BStringSet", {
  findpath <- system.file("extdata", "sampleSeq3.txt", package = "conservedPos")
  rawSeq <- Biostrings::readBStringSet(findpath,"fasta")
  maxL <- findMaxLen(rawSeq)
  expect_equal(maxL, 140)
})

test_that("check the conservity vector value at several index", {
  data(testSeqUnequal)
  testSeq <- testSeqUnequal
  conserV <- conservityTable(testSeq)

  expect_equal(conserV[37], 1)
  expect_equal(conserV[1], 2/3)
  expect_equal(conserV[2], 1)
})

test_that("check the conservity vector value at several index", {
  findpath <- system.file("extdata", "sampleSeq1.txt", package = "conservedPos")
  rawSeq <- Biostrings::readBStringSet(findpath,"fasta")
  conserV <- conservityTable(rawSeq)

  expect_equal(conserV[11], 0.5)
  expect_equal(conserV[5], 2/3)
  expect_equal(conserV[10], 0.5)
})

