library(shiny)
library(leaflet)

shinyUI(pageWithSidebar(
  headerPanel(""),
  #Enter any header titles above
  sidebarPanel(
    #sidebarpanel creates left side panel
    h4("Select Specialty Below"),
      checkboxGroupInput("specialty","Checkbox",
                         c("Allergy & Immunology" = "Allergy & Immunology",
                           "General Surgery" = "General Surgery",
                           "Obstetrics & Gynecology" = "Obstetrics & Gynecology",
                           "Family Medicine" = "Family Medicine",
                           "Internal Medicine" = "Internal Medicine",
                           "Otolaryngology" = "Otolaryngology",
                           "Pediatrics" = "Pediatrics",
                           "Cardiovascular Disease" = "Cardiovascular Disease",
                           "Pulmonary Disease" = "Pulmonary Disease",
                           "Endocrinology, Diabetes & Metabolism" = "Endocrinology, Diabetes & Metabolism",
                           "Pain Medicine" = "Pain Medicine",
                           "Podiatry" = "Podiatry",
                           "Orthopaedics" = "Orthopaedics",
                           "Hematology/Oncology" = "Hematology/Oncology",
                           "Urology" = "Urology",
                           "Maternal & Fetal Medicine" = "Maternal & Fetal Medicine",
                           "Neurology" = "Neurology")
                         )),
  mainPanel(
    #Leafly map output goes in mainpanel
    h3('Care Center Locations by Specialty'),
    shinyUI(bootstrapPage(
      leafletOutput("mymap", height = "500")
    ))
  )
  ))
