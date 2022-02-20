library(tidyverse)





dat <- read_csv("data/merged_full.csv") %>%
    filter(species_class == "AVES")

# How many recordings processed from each location? -> 6
dat %>%
    mutate(recording_id = paste0(location, recording_date, recording_time)) %>%
    filter(!duplicated(recording_id)) %>%
    count(location) %>%
    pull(n) %>%
    range


# Trophic Niche ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#   - most warblers are NA for trophic niche, replace with invertivore
dat %>%
    filter(str_detect(species_english_name, "Warbler")) %>% 
    select(species_english_name, trophic_level, trophic_niche, foraging_niche) %>%
    filter(is.na(foraging_niche)) %>%
    filter(!duplicated(species_english_name)) %>%
    pull(species_english_name)



# Count and presence absence by island ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

n_pres <- dat %>%
    # filter(!str_detect(foraging_niche, "Aquatic")) %>%    # uncomment this if you want to remove aquatic spp
    expand(island_id, species_code) %>%
    left_join(
        x %>%
        count(island_id, species_code),
        by = c("island_id", "species_code")
    ) %>%
    replace_na(list(n = 0)) %>%
    mutate(pres = ifelse(n > 0, 1, 0))

n_pres %>%
    group_by(island_id) %>%
    summarize(total_species = sum(pres)) %>%
    left_join(
        dat %>%
            select(island_id, d_mainland, time_since_fire,
                basal_area_total, basal_area_living,
                basal_area_dead, total_cwd_volume) %>%
            filter(!duplicated(island_id)),
        by = "island_id") %>%
    ggplot() +
    geom_point(aes(x = total_species, y = time_since_fire))
