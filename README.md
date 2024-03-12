# Lexical Richness as a Lens: Exploring the Influence of Social Class on Authors' Writings

## Overview

This repository contains a paper that explore the influence of social class on lexical richness in the works of authors  after the Great Depression, utilizing a comprehensive analysis of lexical data from literary works and social context of authors. Our findings reveal upper-class authors exhibiting a higher Corrected Type-Token Ratio which indicates greater lexical richness, and reflecting their social milieu. This study employs a thorough lexical analysis, aiming to elucidate the complex interplay between class background and language use in literature. This research contributes to our understanding of how social class background shapes language use in literature, offering insights into the broader cultural forces that drive linguistic creativity.

## Files structure

-   `data/` holds the `raw_data/` directory with original text, `analysis_data` directory with the cleaned dataset.
-   `other` holds the `llm/` directory with llm usage, and `sketch` directory with the sketch for dataset and observation.
-   `paper/` directory featuring the paper's PDF, the R Markdown script, and sourced references.
-   `scripts/` contains the R script employed for data cleaning, simulation, modelling and testing.
-   `models/` directory contains the `.rds` files to build the model.

## LLM Usage

The Chat-GPT4 model contributed to the creation of data validation tests.


---

*Note: Our script does not include a feature for data downloading. For those interested in acquiring the original text, please gather the text files through online sources or contact us for the relevant raw texts. The relevant raw text being analyzed are {Hugh Garners: Waste No Tears, Best Stories}, {David Herbert Lawrence: England My England, Kangaroo, Lady Chatterleys Lover, Odour of chrysanthemums, Sons and Lovers, The Plumed Serpent, The Rainbow, The Virgin and The Gipsy}, {Powell Anthony: Casanovas Chinese Restaurant, The Soldiers Art, Books Do Furnish a Room, The Acceptance World, At Lady Mollys, The Valley of Bones, Hearing Secret Harmonies, Temporary Kings, The Military Philosophers, A Buyers Market, The Kindly Ones}, and {Nancy Mitford: The Pursuit of Love, The Sun King, Love In A Cold Climate, Frederick the Great, Madame de Pompadour, Dont Tell Alfred, The Penguin Complete Novels of Nancy Mitford}. After downloading, use the read function in R to load the data and execute our analysis R scripts.*

---
