## Exploring drivers of avian diversity in a northern saskatchewan lake system

<br />
<br />

**data/avian_traits.csv**
```
From: Global database of all bird species shows how body shape predicts lifestyle
ref: Macroevolutionary convergence connects morphological form to ecological function in birds
https://sci-hub.se/https://www.nature.com/articles/s41559-019-1070-4
In three dimensions, trophic niche space is best described by PC1, PC3 and PC4
PC1 = body size
PC2 = body versus beak size
PC4 = tail length versus beak depth
PC5 = Tarsus length versus body size
Beak_PC1 = variation in beak size
Beak_PC2 = variation in beak shape
```

<br />
<br />

**data/aaron.csv**

```
island_id - the two-letter code pertaining to the island name or identity
latitude - y coord
longitude - x coord
area - size of the island measured in hectares
log10_area_1 - calculated using "=log10(area+1)". The '+1' was added because log10 of small numbers (island area <1 ha) will give a negative value
d_mainland - distance to mainland measured in meters using the Near Tool in ArcGIS
log10_dist_1 -  log10 of distance to mainland
buffer_1k - an alternative measure of isolation that used a 1000 metre buffer around the island to quantify the amount of land (mainland or other islands) vs. water within the 1000 metre buffer. The value ranges from 0 to 1 with values closer to 0 indicating more land is within the buffer (less isolated) and values closer to 1 indicating that there is more water within the buffer than land (more isolated). This was done in ArcMap
buffer_5k - same as 'Buffer1000' but using a 5000 metre buffer around the island
time_since_fire - an estimation of when the most recent fire was measured in years up to 2019 (when the cores were sampled). For islands that have burned since the 1980s, this was determined using yearly Landsat imagery (exact year of the fire is known). For islands that burned pre-1980s (Landsat not available), fire history was reconstructed using tree cores from the 25 trees nearest the center of the island plot. I am still working through this data, but the current values in the spreadsheet are based off of the oldest tree cored. These values might change slightly but should be good to go for now. Note that fire-history reconstructed from cores is probably less accurate than Landsat as we're using an indicator of fire (tree establishment) versus the more accurate Landsat imagery.
basal_area_total - an estimate of stand density using the diameter breast height (DBH) of trees (≥ 4cm) within 10 metres of the centre of the island plot. I used the equation from wikipedia: (Pie*((DBH/2)^2))/10000 where DBH is the diameter breast height of each tree (which I summed for each island plot) and the value 10,000 converts the basal area measurement to metres. So the value expressed in the data is essentially metres^2 (of wood) per site (measured in the 10 metre radius).
basal_area_living - same as 'basal.area.total' except only including living trees
basal_area_dead - same as 'basal.area.total' except only dead trees
total_cwd_volume - total volume of coarse woody debris (CWD - fallen logs/trees) expressed in m^3/site. For this I measured the diameter of each long and its length and then used the equation for calculating the volume of a cylinder
total_cwd_volume
cwd_dc1 - volume of CWD (m^3/site) within decay class 1 (least decayed). I used a decay class system where 1 is the least decayed and 5 is the most decayed.
cwd_dc2 - volume of CWD (m^3/site) within decay class 2 (see cwd.dc1 description)
cwd_dc3 - volume of CWD (m^3/site) within decay class 3 (see cwd.dc1 description)
cwd_dc4 - volume of CWD (m^3/site) within decay class 4 (see cwd.dc1 description)
cwd_dc5 - volume of CWD (m^3/site) within decay class 5 (see cwd.dc1 description)
```


