context("Test function plotPartial index validity")

test_that("Input Index out of range", {
  data(testSeqUnequal)
  testSeq <- testSeqUnequal
  conserV <- conservityTable(testSeq)

  message <- plotPartial(conserV, 1, 100)
  expect_equal(message, "Invalid Index!")
  message <- plotPartial(conserV, 100, 1)
  expect_equal(message, "Invalid Index!")
})

test_that("first Index is larger", {
  data(testSeqUnequal)
  testSeq <- testSeqUnequal
  conserV <- conservityTable(testSeq)

  message <- plotPartial(conserV, 12, 5)
  expect_equal(message, "Invalid Index!")
})

