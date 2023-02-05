library(readr)
library(dplyr)
library(janitor)
library(tidyr)

df <- read_csv(here::here("Inputs/data/raw_df.csv"))

#removing repeat evaluations
dfu <- df[!duplicated(df[c("RSN")], fromLast = TRUE), ]

#selecting our desired variables
clean_df <- clean_names(dfu) |>
  select(year_built, latitude, longitude, graffiti, exterior_cladding, exterior_grounds, exterior_walkways)

#used to check the bounds of dates of evaluations
dates_left <- as.Date(dfu$EVALUATION_COMPLETED_ON, format = "%Y-%m-%d")

#renaming
clean_df <- rename(clean_df, age = year_built, cladding = exterior_cladding, grounds = exterior_grounds, walkways = exterior_walkways)

#correction of variable type 
clean_df$age <- as.numeric(clean_df$age)
clean_df$longitude <- as.numeric(clean_df$longitude)
clean_df$latitude <- as.numeric(clean_df$latitude)
clean_df$graffiti <- as.numeric(clean_df$graffiti)
clean_df$cladding <- as.numeric(clean_df$cladding)
clean_df$walkways <- as.numeric(clean_df$walkways)
clean_df$grounds <- as.numeric(clean_df$grounds)

#dropping NA
clean_df = drop_na(clean_df)

#converting to age from year built
clean_df$age <- 2023 - clean_df$age

write_csv(clean_df, here::here("Outputs/data/clean_df.csv"))