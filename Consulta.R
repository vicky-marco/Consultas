library(tidyverse)
library(sf)


Barrios <- st_read("https://raw.githubusercontent.com/flokihara/DATOS2/main/data/Analysis%20Neighborhoods.geojson")

ggplot()+
  geom_sf(data=Barrios, fill="gray60")

Police <- st_read("https://raw.githubusercontent.com/vicky-marco/IAUII/main/Map_of_Police_Stations__2011_%20(4).csv")

Police <- mutate(Police, ncomisaria=1:n()) %>% 
  mutate(Police, ncomisaria=as.factor(ncomisaria))

sf_police_01 <- Police %>% 
  st_as_sf(coords = c("Lon","Lat"), crs = 4326)

st_crs(sf_police_01)

str(sf_police_01)

Barrios_police <- st_transform(Barrios, crs=st_crs(sf_police_01))

st_crs(Barrios_police)

sf_police_02 <-st_join(Barrios_police,sf_police_01)

st_crs(sf_police_02)

