library(shiny)
library(leaflet)
library(dplyr)

r_colors <- rgb(t(col2rgb(colors()) / 255))
names(r_colors) <- colors()

points <- read.csv('geo.csv') %>%
  mutate(popup = paste0("nom: ", nom, "<br>addresse: ",  address, "<br>Nombre de demandes: ", count))

ui <- fluidPage(
  leafletOutput("mymap"),
  p(),
  sliderInput(
    "slider", label = h3("Nombre de déclarations CNIL"), min = 0, 
    max = 20, value = c(0, 20), step=1)
)

server <- function(input, output, session) {
  output$mymap <- renderLeaflet({
    leaflet() %>%
      setView(lat = 46.85, lng = 2.3518, zoom = 5) %>%
      addProviderTiles(
        providers$Stamen.TonerLite,
        options = providerTileOptions(noWrap = TRUE)
      )
  })
  
  observe({
    minCount <- input$slider[1]
    maxCount <- input$slider[2]

    sites <- points %>% 
      filter(count <= maxCount & count >= minCount)
    
    leafletProxy("mymap") %>% 
      clearMarkers() %>%
      clearMarkerClusters() %>%
      addMarkers(
        lng = sites$Longitude,
        lat = sites$Latitude,
        popup = sites$popup,
        clusterOptions = markerClusterOptions()
      )
  })
}

shinyApp(ui, server)
