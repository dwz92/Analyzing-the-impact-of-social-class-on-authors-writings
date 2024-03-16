#### Preamble ####
# Purpose: Simulates data
# Author: Qi Er (Emma) Teng, Wentao Sun, Yang Cheng
# Contact: e.teng@mail.utoronto.ca, wentaosun196@gmail.com, yvonneyang.cheng@mail.utoronto.ca
# Date: 11 March 2024
# License: MIT


#### Workspace setup ####
# install.packages("tidyverse")
# install.packages("dplyr")

library(tidyverse)
library(dplyr)


#### Simulate ####


# In this simulation, we focus on finding the corrected type token ratio (CTTR) from summary statistics of a writing.
# The simulation starts with the word count and unique word count of 4 different authors.
# The simulated data is derived from a poisson distribution since word counts must be integer.
# By dividing the simulated unqie word count with the square root of double the overall word count, we applied the CTTR formula.

set.seed(1008)

# Initialize a tibble
simulated_data <- tibble(
  "author" = sample(c("author1", "author2", "author3", "author4"), size = 50, replace = TRUE),
  "word_count" = rpois(50, lambda = 40000),
  "unique_words" = rpois(50, lambda = 15000)
)

simulated_data$corrected_type_token_ratio <- simulated_data$unique_words / sqrt(2 * simulated_data$word_count)

# View the simulated data
print(simulated_data)