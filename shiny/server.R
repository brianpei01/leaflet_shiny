library(shiny)
library(leaflet)
Carecenterbyregion <- read.csv("leaflet_shiny/shiny/dataCarecenterbyregion.csv")
shinyServer(function(input, output, session){
  
  lats <- reactive({
    a <- subset(Carecenterbyregion, Carecenterbyregion$Primary.Specialty %in% input$specialty)
    lats <- a$Latitude
    return(lats)
  })
  
  longs <- reactive({
    a <- subset(Carecenterbyregion, Carecenterbyregion$Primary.Specialty %in% input$specialty)
    longs <- a$Longitude
    return(longs)
  })
  
  newlabels <- reactive({
    a <- subset(Carecenterbyregion, Carecenterbyregion$Primary.Specialty %in% input$specialty)
    newlabels <- paste(a$Account.Name, a$Primary.Specialty, sep=", ")
    return(newlabels)
  })
  
  output$mymap <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = -77.17862, lat = 38.93652, zoom = 10) %>%
      addMarkers(lng = longs(), lat = lats(), popup=newlabels())
  })
})
