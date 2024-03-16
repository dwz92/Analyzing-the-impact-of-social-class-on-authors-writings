#### Preamble ####
# Purpose: Cleans the raw plane data
# Author: Qi Er (Emma) Teng, Wentao Sun, Yang Cheng
# Date: 11 March 2024
# Contact: e.teng@mail.utoronto.ca, wentaosun196@gmail.com, yvonneyang.cheng@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(here)
library(kableExtra)


#### Cleaned data ####

##Create a function for word count info##
word_dist <- function(auth_list) {
  res <- tibble(
    author = c(),
    average =c(),
    stddev = c()
  )
  
  for (info in auth_list) {
    avg = mean(info$word_count)
    std = sd(info$word_count)
    
    res <-
      rbind(res,
            tibble(
              author = info$author,
              average = avg,
              stddev = std
            )
      )
  }
  return(unique(res))
}

##Create a function for CTTR##
cttr <- function(textlist, textnamelist, name) {
  
  cttr_list <-
    tibble(
      author = c(),
      title = c(),
      word_count =c(),
      types = c(),
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
          word_count = total_tokens,
          types = types,
          corrected_type_token_ratio = types / sqrt(2 * total_tokens)
        )
      )
  }
  return(cttr_list)
}


## Hugh Garners CTTR ##
best_stories<- readLines(here::here("data/raw_data/Hugh Garners Best Stories (Hugh Garner).txt"), encoding = "UTF-8")
waste_no_tears_raw <- readLines(here::here("data/raw_data/Waste No Tears (Hugh Garner).txt"), encoding = "UTF-8")

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

tea_with_miss_mayberry <- paste(best_stories[2490:2782], collapse = " ")

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

# write to csv
write.csv(cttr_hugh, "data/analysis_data/cttr_hugh.csv")

# write to file
write.table(waste_no_tears_raw[105:110], "data/analysis_data/waste_no_tear_raw.txt", append = FALSE, col.names = FALSE, row.names = FALSE)


## David Herbert Lawrence CTTR ##

#read in txt
england_my_englandraw <- readLines(here::here("data/raw_data/England, My England (Lawrence, David Herbert).txt"), encoding = "UTF-8")
kangarooraw <- readLines(here::here("data/raw_data/Kangaroo (David Herbert Lawrence [Lawrence etc.).txt"), encoding = "UTF-8")
lady_chatterleys_loverraw <- readLines(here::here("data/raw_data/Lady Chatterleys Lover (Lawrence, David Herbert).txt"), encoding = "UTF-8")
odour_of_chrysanthemumsraw <- readLines(here::here("data/raw_data/Odour of Chrysanthemums (Lawrence, David Herbert).txt"), encoding = "UTF-8")
sons_and_loversraw <- readLines(here::here("data/raw_data/Sons and Lovers (Lawrence, David Herbert).txt"), encoding = "UTF-8")
the_plumed_serpentraw <- readLines(here::here("data/raw_data/The Plumed Serpent (Lawrence, David Herbert).txt"), encoding = "UTF-8")
the_rainbowraw <- readLines(here::here("data/raw_data/The Rainbow (David Herbert Lawrence [Lawrence etc.).txt"), encoding = "UTF-8")
the_virgin_and_the_gipsyraw <- readLines(here::here("data/raw_data/The Virgin and the Gipsy (David Herbert Lawrence [Lawrence etc.).txt"), encoding = "UTF-8")


#clean and tostring texts
england_my_england <- paste(england_my_englandraw[62:486], collapse = " ")

kangaroo <- paste(kangarooraw[64:7008], collapse = " ")

lady_chatterleys_lover <- paste(lady_chatterleys_loverraw[68:7334], collapse = " ")

odour_of_chrysanthemums <- paste(odour_of_chrysanthemumsraw[68:524], collapse = " ")

sons_and_lovers <- paste(sons_and_loversraw[70:13377], collapse = " ")

the_plumed_serpent <- paste(the_plumed_serpentraw[64:11379], collapse = " ")

the_rainbow <- paste(the_rainbowraw[64:9214], collapse = " ")

the_virgin_and_the_gipsy <- paste(the_virgin_and_the_gipsyraw[68:2028], collapse = " ")


# calculate the cttr
cttr_david <- cttr(
  c(england_my_england, kangaroo, lady_chatterleys_lover, odour_of_chrysanthemums, sons_and_lovers, the_plumed_serpent, 
    the_rainbow, the_virgin_and_the_gipsy),
  c("england_my_england", "kangaroo", "lady_chatterleys_lover", "odour_of_chrysanthemums", "sons_and_lovers", "the_plumed_serpent", 
    "the_rainbow", "the_virgin_and_the_gipsy"),
  "David Herbert Lawrence")
cttr_david

# write to csv
write.csv(cttr_david, "data/analysis_data/cttr_david.csv")



## Powell Anthony CTTR ##
casanovas_chinese_restaurantraw <- readLines(here::here("data/raw_data/Casanovas Chinese Restaurant (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
the_soldiers_artraw <- readLines(here::here("data/raw_data/The Soldiers Art (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
books_do_furnish_a_roomraw <- readLines(here::here("data/raw_data/Books Do Furnish a Room (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
the_acceptance_worldraw <- readLines(here::here("data/raw_data/The Acceptance World (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
at_lady_mollysraw <- readLines(here::here("data/raw_data/At Lady Mollys (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
the_valley_of_bonesraw <- readLines(here::here("data/raw_data/The Valley of Bones (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
hearing_secret_harmoniesraw <- readLines(here::here("data/raw_data/Hearing Secret Harmonies (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
temporary_kingsraw <- readLines(here::here("data/raw_data/Temporary Kings (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
the_military_philosophersraw <- readLines(here::here("data/raw_data/The Military Philosophers (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
a_buyers_marketraw <- readLines(here::here("data/raw_data/A Buyers Market (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")
the_kindly_onesraw <- readLines(here::here("data/raw_data/The Kindly Ones (Powell Anthony) (Z-Library).txt"), encoding = "UTF-8")


# select and split
casanovas_chinese_restaurant <- paste(casanovas_chinese_restaurantraw[36:3197], collapse = " ")

the_soldiers_art <- paste(the_soldiers_artraw[36:3884], collapse = " ")

books_do_furnish_a_room <- paste(books_do_furnish_a_roomraw[36:3268], collapse = " ")

the_acceptance_world <- paste(the_acceptance_worldraw[35:3355], collapse = " ")

at_lady_mollys <- paste(at_lady_mollysraw[36:3524], collapse = " ")

the_valley_of_bones <- paste(the_valley_of_bonesraw[36:4745], collapse = " ")

hearing_secret_harmonies <- paste(hearing_secret_harmoniesraw[37:4315], collapse = " ")

temporary_kings <- paste(temporary_kingsraw[36:3831], collapse = " ")

the_military_philosophers <- paste(the_military_philosophersraw[36:4072], collapse = " ")

a_buyers_market <- paste(a_buyers_marketraw[36:2723], collapse = " ")

the_kindly_ones <- paste(the_kindly_onesraw[36:3985], collapse = " ")


# calculate the cttr
cttr_powell <- cttr(
  c(casanovas_chinese_restaurant, the_soldiers_art, books_do_furnish_a_room, the_acceptance_world, at_lady_mollys, 
    the_valley_of_bones, hearing_secret_harmonies, temporary_kings, the_military_philosophers, a_buyers_market, the_kindly_ones),
  c("casanovas_chinese_restaurant", "the_soldiers_art", "books_do_furnish_a_room", "the_acceptance_world", "at_lady_mollys", 
    "the_valley_of_bones", "hearing_secret_harmonies", "temporary_kings", "the_military_philosophers", "a_buyers_market", "the_kindly_ones"),
  "Powell Anthony")
cttr_powell

# write to csv
write.csv(cttr_powell, "data/analysis_data/cttr_powell.csv")




## Nancy Mitford CTTR ##
the_pursuit_of_loveraw <- readLines(here::here("data/raw_data/The Pursuit of Love (Nancy Mitford) (Z-Library).txt"), encoding = "UTF-8")
the_sun_kingraw <- readLines(here::here("data/raw_data/The Sun King (Nancy Mitford, Philip Mansel (Introduction)) (Z-Library).txt"), encoding = "UTF-8")
love_in_a_cold_climateraw <- readLines(here::here("data/raw_data/Love In A Cold Climate (Nancy Mitford) (Z-Library).txt"), encoding = "UTF-8")
frederick_the_greatraw <- readLines(here::here("data/raw_data/Frederick the Great (Mitford Nancy) (Z-Library).txt"), encoding = "UTF-8")
madame_de_pompadourraw <- readLines(here::here("data/raw_data/Madame de Pompadour (Nancy Mitford) (Z-Library).txt"), encoding = "UTF-8")
dont_tell_alfredraw <- readLines(here::here("data/raw_data/Dont Tell Alfred (Mitford Nancy) (Z-Library).txt"), encoding = "UTF-8")
collection <- readLines(here::here("data/raw_data/The Penguin Complete Novels of Nancy Mitford (Nancy Mitford) (Z-Library).txt"), encoding = "UTF-8")


# select and split
the_pursuit_of_love <- paste(the_pursuit_of_loveraw[216:3596], collapse = " ")

the_sun_king <- paste(the_sun_kingraw[134:1370], collapse = " ")

love_in_a_cold_climate <- paste(love_in_a_cold_climateraw[218:3925], collapse = " ")

frederick_the_great <- paste(frederick_the_greatraw[246:1544], collapse = " ")

madame_de_pompadour <- paste(madame_de_pompadourraw[171:1712], collapse = " ")

dont_tell_alfred <- paste(dont_tell_alfredraw[169:4761], collapse = " ")

highland_fling <- paste(collection[102:3513], collapse = " ")

christmas_pudding <- paste(collection[3519:6289], collapse = " ")

wigs_on_the_green <- paste(collection[6245:9139], collapse = " ")

pigeon_pie <- paste(collection[9145:11111], collapse = " ")

# calculate the cttr
cttr_nancy <- cttr(
  c(the_pursuit_of_love, the_sun_king, love_in_a_cold_climate, frederick_the_great, madame_de_pompadour, dont_tell_alfred, 
    highland_fling, christmas_pudding, wigs_on_the_green, pigeon_pie),
  c("the_pursuit_of_love", "the_sun_king", "love_in_a_cold_climate", "frederick_the_great", "madame_de_pompadour", "dont_tell_alfred", 
    "highland_fling", "christmas_pudding", "wigs_on_the_green", "pigeon_pie"),
  "Nancy Mitford")
cttr_nancy

# write to csv
write.csv(cttr_nancy, "data/analysis_data/cttr_nancy.csv")




# create model csv
cttr_all <- rbind(cttr_david,cttr_hugh, cttr_nancy, cttr_powell)

cttr_all

# write to csv
write.csv(cttr_all, "data/analysis_data/cttr_all.csv")


## Word count distributio n##
cttr_dav <- read.csv(here::here("data/analysis_data/cttr_david.csv"))
cttr_hug <- read.csv(here::here("data/analysis_data/cttr_hugh.csv"))
cttr_nan <- read.csv(here::here("data/analysis_data/cttr_nancy.csv"))
cttr_pow <- read.csv(here::here("data/analysis_data/cttr_powell.csv"))

word_distribution <- word_dist(
  list(cttr_dav, cttr_hug, cttr_nan, cttr_pow)
)

write.csv(word_distribution, "data/analysis_data/wordcount_dist.csv")