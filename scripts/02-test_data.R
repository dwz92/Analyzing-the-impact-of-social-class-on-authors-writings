#### Preamble ####
# Purpose: Tests
# Author: Qi Er (Emma) Teng, Wentao Sun, Yang Cheng
# Date: 11 March 2024
# Contact: e.teng@mail.utoronto.ca, wentaosun196@gmail.com, yvonneyang.cheng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(testthat)
library(here)


#### Test data ####

# Load the dataset
cttr_all <- read_csv(here::here("data/analysis_data/cttr_all.csv"))

# Test 1: Check for missing values
test_that("Dataset has no missing values", {
  expect_true(all(!is.na(cttr_all)))
})

# Test 2: Check for reasonable word count ranges
test_that("Word counts are within reasonable ranges", {
  expect_true(all(cttr_all$word_count > 0))
  expect_true(all(cttr_all$types > 0))
})

# Test 3: Check for expected authors
expected_authors <- c("David Herbert Lawrence", "Hugh Garners", "Nancy Mitford", "Powell Anthony")

actual_authors <- unique(cttr_all$author)

test_that("All rows have expected authors", {
  expect_true(all(expected_authors %in% actual_authors) && all(actual_authors %in% expected_authors),
              info = "The dataset contains unexpected authors or is missing expected authors.")
})



# Load the dataset
cttr_dav <- read_csv(here::here("data/analysis_data/cttr_david.csv"))

# Test 1: Check for missing values
test_that("Dataset has no missing values", {
  expect_true(all(!is.na(cttr_dav)))
})

# Test 2: Check for reasonable word count ranges
test_that("Word counts are within reasonable ranges", {
  expect_true(all(cttr_dav$word_count > 0))
  expect_true(all(cttr_dav$types > 0))
})

# Test 3: Check for expected authors
expected_authors <- c("David Herbert Lawrence")

actual_authors <- unique(cttr_dav$author)

test_that("All rows have expected authors", {
  expect_true(all(expected_authors %in% actual_authors) && all(actual_authors %in% expected_authors),
              info = "The dataset contains unexpected authors or is missing expected authors.")
})



# Load the dataset
cttr_hugh <- read_csv(here::here("data/analysis_data/cttr_hugh.csv"))

# Test 1: Check for missing values
test_that("Dataset has no missing values", {
  expect_true(all(!is.na(cttr_hugh)))
})

# Test 2: Check for reasonable word count ranges
test_that("Word counts are within reasonable ranges", {
  expect_true(all(cttr_hugh$word_count > 0))
  expect_true(all(cttr_hugh$types > 0))
})

# Test 3: Check for expected authors
expected_authors <- c("Hugh Garners")

actual_authors <- unique(cttr_hugh$author)

test_that("All rows have expected authors", {
  expect_true(all(expected_authors %in% actual_authors) && all(actual_authors %in% expected_authors),
              info = "The dataset contains unexpected authors or is missing expected authors.")
})



# Load the dataset
cttr_nan <- read_csv(here::here("data/analysis_data/cttr_nancy.csv"))

# Test 1: Check for missing values
test_that("Dataset has no missing values", {
  expect_true(all(!is.na(cttr_nan)))
})

# Test 2: Check for reasonable word count ranges
test_that("Word counts are within reasonable ranges", {
  expect_true(all(cttr_nan$word_count > 0))
  expect_true(all(cttr_nan$types > 0))
})

# Test 3: Check for expected authors
expected_authors <- c("Nancy Mitford")

actual_authors <- unique(cttr_nan$author)

test_that("All rows have expected authors", {
  expect_true(all(expected_authors %in% actual_authors) && all(actual_authors %in% expected_authors),
              info = "The dataset contains unexpected authors or is missing expected authors.")
})



# Load the dataset
cttr_pow <- read_csv(here::here("data/analysis_data/cttr_powell.csv"))

# Test 1: Check for missing values
test_that("Dataset has no missing values", {
  expect_true(all(!is.na(cttr_pow)))
})

# Test 2: Check for reasonable word count ranges
test_that("Word counts are within reasonable ranges", {
  expect_true(all(cttr_pow$word_count > 0))
  expect_true(all(cttr_pow$types > 0))
})

# Test 3: Check for expected authors
expected_authors <- c("Powell Anthony")

actual_authors <- unique(cttr_pow$author)

test_that("All rows have expected authors", {
  expect_true(all(expected_authors %in% actual_authors) && all(actual_authors %in% expected_authors),
              info = "The dataset contains unexpected authors or is missing expected authors.")
})



# Load the datasets
wordcount_dist <- read_csv(here::here("data/analysis_data/wordcount_dist.csv"))
cttr_dist <- read_csv(here::here("data/analysis_data/cttr_dist.csv"))

# Test 1: Consistency Test
test_that("Consistency between datasets", {
  expect_equal(sort(unique(wordcount_dist$author)), sort(unique(cttr_dist$author)))
})

# Test 2: Dataset Completeness Test
test_that("Datasets are not empty and have a minimum expected number of rows", {
  expect_true(nrow(wordcount_dist) > 0)
  expect_true(nrow(cttr_dist) > 0)
  expect_true(nrow(wordcount_dist) >= 4)
  expect_true(nrow(cttr_dist) >= 4)
})

# Test 3: Positive Values Test
test_that("Numerical values are positive", {
  expect_true(all(wordcount_dist$average > 0))
  expect_true(all(cttr_dist$average > 0))
})