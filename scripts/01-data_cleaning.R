#### Preamble ####
# Purpose: Cleans the raw plane data
# Author: Yuanyi (Leo) Liu, Qi Er (Emma) Teng
# Date: 13 February 2024
# Contact: leoy.liu@mail.utoronto.ca, e.teng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(here)


#### Cleaned data ####

##Create a function for CTTR##
cttr <- function(textlist, textnamelist, name) {
  
  cttr_list <-
    tibble(
      author = c(),
      title = c(),
      corrected_type_token_ratio = c()
    )
  
  
  #loop through list
  for (i in c(1:length(textlist))) {
    tokens <- strsplit(textlist[i], "\\s+")[[1]]
    types <- length(unique(tokens))
    total_tokens <- length(tokens)
    
    cttr_list <- cttr_list |>
      rbind(
        tibble(
          author = name,
          title = textnamelist[i],
          corrected_type_token_ratio = types / sqrt(2 * total_tokens)
        )
      )
  }
  return(cttr_list)
}


## Hugh Garners CTTR ##
best_stories<- readLines(here::here("inputs/data/Hugh Garners Best Stories (Hugh Garner).txt"), encoding = "UTF-8")
waste_no_tears_raw <- readLines(here::here("inputs/data/Waste No Tears (Hugh Garner).txt"), encoding = "UTF-8")

# clean waste no tears
waste_no_tears <- paste(waste_no_tears_raw[105:3417], collapse = " ")

# select and split 15 short stories from best_stories
the_conversion_of_willie_heaps <- paste(best_stories[701:973], collapse = " ")

the_father <- paste(best_stories[986:1236], collapse = " ")

a_couple_of_quiet_young_guys <- paste(best_stories[1245:1644], collapse = " ")

the_yellow_sweater <- paste(best_stories[1653:1899], collapse = " ")

make_mine_vanilla <- paste(best_stories[1908:2118], collapse = " ")

our_neighbours_the_nuns <- paste(best_stories[2127:2237], collapse = " ")

the_expatriates <- paste(best_stories[2246:2310], collapse = " ")

red_racer <- paste(best_stories[2319:2481], collapse = " ")

tea_with_miss_mayberry <- paste(best_stories[2791:2782], collapse = " ")

a_visit_with_robert <- paste(best_stories[2791:3139], collapse = " ")

one_mile_of_ice <- paste(best_stories[3259:3467], collapse = " ")

the_magnet <- paste(best_stories[3476:3674], collapse = " ")



# calculate the cttr
cttr_hugh <- cttr(
  c(waste_no_tears, the_conversion_of_willie_heaps, the_father, a_couple_of_quiet_young_guys, the_yellow_sweater, make_mine_vanilla, 
    our_neighbours_the_nuns, the_expatriates, red_racer, tea_with_miss_mayberry, a_visit_with_robert, one_mile_of_ice, the_magnet),
  c("waste_no_tears", "the_conversion_of_willie_heaps", "the_father", "a_couple_of_quiet_young_guys", "the_yellow_sweater", "make_mine_vanilla", 
    "our_neighbours_the_nuns", "the_expatriates", "red_racer", "tea_with_miss_mayberry", "a_visit_with_robert", "one_mile_of_ice", "the_magnet"),
  "Hugh Garners")
cttr_hugh

write.csv(cttr_hugh, "outputs/data/cttr_hugh.csv")


## David Herbert Lawrence CTTR ##

#read in txt
england_my_england <- readLines(here::here("inputs/data/England, My England (Lawrence, David Herbert).txt"), encoding = "UTF-8")
kangaroo <- readLines(here::here("inputs/data/Kangaroo (David Herbert Lawrence [Lawrence etc.).txt"), encoding = "UTF-8")
lady_chatterleys_lover <- readLines(here::here("inputs/data/Lady Chatterleys Lover (Lawrence, David Herbert).txt"), encoding = "UTF-8")
odour_of_chrysanthemums <- readLines(here::here("inputs/data/Odour of Chrysanthemums (Lawrence, David Herbert).txt"), encoding = "UTF-8")
sons_and_lovers <- readLines(here::here("inputs/data/Sons and Lovers (Lawrence, David Herbert).txt"), encoding = "UTF-8")
the_plumed_serpent <- readLines(here::here("inputs/data/The Plumed Serpent (Lawrence, David Herbert).txt"), encoding = "UTF-8")
the_rainbow <- readLines(here::here("inputs/data/The Rainbow (David Herbert Lawrence [Lawrence etc.).txt"), encoding = "UTF-8")
the_virgin_and_the_gipsy <- readLines(here::here("inputs/data/The Virgin and the Gipsy (David Herbert Lawrence [Lawrence etc.).txt"), encoding = "UTF-8")


#clean and tostring texts


## Powell Anthony CTTR ##

## Nancy Mitford CTTR ##
the_pursuit_of_loveraw <- readLines(here::here("inputs/data/The Pursuit of Love (Nancy Mitford) (Z-Library).txt"), encoding = "UTF-8")
the_sun_kingraw <- readLines(here::here("inputs/data/The Sun King (Nancy Mitford, Philip Mansel (Introduction)) (Z-Library).txt"), encoding = "UTF-8")
love_in_a_cold_climateraw <- readLines(here::here("inputs/data/Love In A Cold Climate (Nancy Mitford) (Z-Library).txt"), encoding = "UTF-8")
frederick_the_greatraw <- readLines(here::here("inputs/data/Frederick the Great (Mitford Nancy) (Z-Library).txt"), encoding = "UTF-8")
madame_de_pompadourraw <- readLines(here::here("inputs/data/Madame de Pompadour (Nancy Mitford) (Z-Library).txt"), encoding = "UTF-8")
dont_tell_alfredraw <- readLines(here::here("inputs/data/Dont Tell Alfred (Mitford Nancy) (Z-Library).txt"), encoding = "UTF-8")
collection <- readLines(here::here("inputs/data/The Penguin Complete Novels of Nancy Mitford (Nancy Mitford) (Z-Library).txt"), encoding = "UTF-8")


# select and split 15 short stories from best_stories
the_pursuit_of_love <- paste(the_pursuit_of_loveraw[216:3596], collapse = " ")

the_sun_king <- paste(the_sun_kingraw[134:1370], collapse = " ")

love_in_a_cold_climate <- paste(love_in_a_cold_climateraw[218:3925], collapse = " ")

frederick_the_great <- paste(frederick_the_greatraw[246:1544], collapse = " ")

madame_de_pompadour <- paste(madame_de_pompadourraw[171:1712], collapse = " ")

dont_tell_alfred <- paste(dont_tell_alfredraw[169:4761], collapse = " ")

the_expatriates <- paste(best_stories[2246:2310], collapse = " ")

red_racer <- paste(best_stories[2319:2481], collapse = " ")

tea_with_miss_mayberry <- paste(best_stories[2791:2782], collapse = " ")

a_visit_with_robert <- paste(best_stories[2791:3139], collapse = " ")


