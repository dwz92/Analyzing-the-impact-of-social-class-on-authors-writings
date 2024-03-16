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


# In this simulation, we focus on two different age categories for birth rate data: younger and older groups.
# The simulation starts with birth rate of 6 age groups.
# The simulated data is derived from a normal distribution instead of a poisson distribution since birth rate can be more than just integers.
# By applying the abs() function, we guarantee the recording of only positive birth rates for the older age group.



cttr_dav <- read.csv(here::here("data/analysis_data/cttr_david.csv"))
cttr_hug <- read.csv(here::here("data/analysis_data/cttr_hugh.csv"))
cttr_nan <- read.csv(here::here("data/analysis_data/cttr_nancy.csv"))
cttr_pow <- read.csv(here::here("data/analysis_data/cttr_powell.csv"))

cttr_distribution <- cttr_dist(
  list(cttr_dav, cttr_hug, cttr_nan, cttr_pow)
)

cttr_distribution

write.csv(cttr_distribution, "data/analysis_data/cttr_dist.csv")