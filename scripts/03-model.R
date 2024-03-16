#### Preamble ####
# Purpose: Models... [...UPDATE THIS...]
# Author: Qi Er (Emma) Teng, Wentao Sun, Yang Cheng
# Email: e.teng@mail.utoronto.ca, wentaosun196@gmail.com, yvonneyang.cheng@mail.utoronto.ca
# Date: 11 March 2024
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(rstanarm)
library(modelsummary)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/cttr_all.csv")

#For the purpose of fitting our data, we will round up to zero digits in order to use negative binom model

analysis_data$corrected_type_token_ratio <- analysis_data$corrected_type_token_ratio |>
  round(digits = 0)

analysis_data

### Model data ####
author_cttr_rstanarm <-
  stan_glm(
    corrected_type_token_ratio ~ author,
    data = analysis_data,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 3, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 3, autoscale = TRUE),
    seed = 853
  )

author_cttr_rstanarm


author_lines_rstanarm_multilevel <-
  stan_glmer(
    corrected_type_token_ratio ~ (1 | author),
    data = analysis_data,
    family = neg_binomial_2(link = "log"),
    prior = normal(location = 0, scale = 3, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 3, autoscale = TRUE),
    seed = 853
  )

author_lines_rstanarm_multilevel

#### Save model ####
saveRDS(
  author_cttr_rstanarm,
  file = "models/author_cttr_model.rds"
)

saveRDS(
  author_lines_rstanarm_multilevel,
  file = "models/author_cttr_model_multi.rds"
)

modelsummary(
  list(
    "Neg Binom" = author_cttr_rstanarm,
    "Multilevel neg binomial" = author_lines_rstanarm_multilevel
    )
)
