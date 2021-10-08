library(tidyverse)


aaron <- read_csv("data/aaron.csv") %>%
  # for some reason \xa1 is attached to lat long
  mutate(latitude = str_replace(latitude, "\xa1", ""),
         longitude = str_replace(longitude, "\xa1", ""),)



steve <- read_csv("data/steve.csv") %>%
    # add new column to match aaron's island_id
  mutate(island_id = str_sub(steve$location, 10))


# 1. Explore a few oddities -----------------------------------------------

# Comparing locations between the two datasets ~~~~
# steve's islands
(steve_un_locations <- unique(steve$island_id))

# aaron's islands
(aarons_un_locations <- unique(aaron$island_id))

# locations in Aaron's, but not in steve's
setdiff(aarons_un_locations, steve_un_locations)
setdiff(steve_un_locations, aarons_un_locations) # and vice versa


# See what location in aaron's data set has the same lat long combo as steve's IL2
steve_IL2_location <- steve %>%
  mutate(lat_long_unique = paste0(latitude, longitude)) %>% 
  filter(!duplicated(lat_long_unique) & island_id == "IL2") %>%
  pull(lat_long_unique)

aaron %>%
  mutate(lat_long_unique = paste0(latitude,longitude)) %>%
  filter(lat_long_unique %in% steve_IL2_location)


# 2.  merge data ----------------------------------------------------------

#' Since IL2 has the exact coordinates as BT, as a temporary fix, let's just rename steve's IL2 to BT

# change IL2 -> BT and merge with aaron's data
df <- steve %>%
    mutate(island_id = str_replace(island_id, "IL2", "BT")) %>%
    left_join(select(aaron, -latitude, -longitude), by = "island_id")


# species tally by island
(spp_tally <- df %>%
  group_by(island_id) %>%
  filter(!duplicated(species_code)) %>%
  tally())

x <- spp_tally %>%
  left_join(aaron, by = "island_id") 

# quick look at spatial variation in spp richness
with(x,
     plot(longitude, latitude, cex = n/max(n), asp = 1)
)
  

