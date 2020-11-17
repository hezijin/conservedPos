context("Test functions in PositionCal.R")


test_that("create correct Position Vec", {
  data(testSeqShort)
  testSeq <- testSeqShort
  pos <- createPosVec(testSeq, 1)
  expect_equal(pos, "ATT")
})

test_that("find correct conservity from a index", {
  data(testSeqShort)
  testSeq <- testSeqShort
  pos <- createPosVec(testSeq, 1)
  cons <- findConservityFromS(pos)
  expect_equal(cons, 2/3)
})

test_that("find correct max length in DNAStringSet", {
  data(testSeqUnequal)
  testSeq <- testSeqUnequal
  maxL <- findMaxLen(testSeq)

  expect_equal(maxL, 37)
})

test_that("check the conservity vector value at several index", {
  data(testSeqUnequal)
  testSeq <- testSeqUnequal
  conserV <- conservityTable(testSeq)

  expect_equal(conserV[37], 1)
  expect_equal(conserV[1], 2/3)
  expect_equal(conserV[2], 1)
})

