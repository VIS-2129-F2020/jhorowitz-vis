


library(tidyverse)
library(sf)
library(leaflet)
library(htmltools)
library(htmlwidgets)
library(rnaturalearth)



culturalarts <- st_read ("Cultural_and_Performing_Arts_Centers.geojson") %>% 
  st_as_sf(culturalarts)

#culturalarts %>% 
  #mutate(desc=unite(Name, description,sep=" \n "))

culturalmap <- leaflet(culturalarts) %>% 
  addProviderTiles(providers$Stamen.TonerLite) %>%
  addCircles(fillColor = "darkorange", color = "darkorange", 
             stroke = FALSE, radius = 1000,
             highlightOptions = highlightOptions(fillColor = "red", 
                                                 fillOpacity = 0.1),
           popup = paste("Name:", culturalarts$Name, "<br/>",
                                   "Description:", culturalarts$description
                                   )
  ) %>% 
  
  addControl("Arts and Cultural Centers in LA County", position = "topright") %>%
  addControl('<a href="https://geohub.lacity.org/datasets/lacounty::cultural-and-performing-arts-centers">Data source</a>',
             position = "bottomleft")

saveWidget(culturalmap, file = "cultureandartsLAmap.html") 





