library(readxl)
db <- read_excel("C:/Users/toled/Desktop/Technical_Database.xlsx")

library(tidyverse)

str(db)

df <- db %>%
  select(nameUnicode,country,latitude,longitude,population)

br <- df %>%
  filter(country == "Brazil")
  
br$latitude[1]
br$longitude[1]

library(leaflet)

br <- br %>%
  mutate(lat=latitude) %>%
  mutate(long=longitude) %>%
  select(nameUnicode,lat,long,population)

br <- br %>%
  dplyr::mutate(population.scale = cut(population,c(50000,100000,500000,1000000,99999999999999999999),
                                labels = c('>50000 & <=100000', '>100000 & <=500000', '>500000 & <=1000000','>1000000')))

br.df <- split(br, br$population.scale)

l <- leaflet() %>% addTiles()

names(br.df) %>%
  purrr::walk( function(df) {
    l <<- l %>%
      addMarkers(data=br.df[[df]],
                 lng=~long, lat=~lat,
                 label=~as.character(population),
                 popup=~as.character(population),
                 group = df,
                 clusterOptions = markerClusterOptions(removeOutsideVisibleBounds = F),
                 labelOptions = labelOptions(noHide = F,
                                             direction = 'auto'))
  })

l %>%
  addLayersControl(
    overlayGroups = names(br.df),
    options = layersControlOptions(collapsed = FALSE)
  )
