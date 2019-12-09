library(shiny)

source("parameters.R")


shinyUI(
  fluidPage(
    titlePanel("RUSPtools",
               title = tags$strong("The influence of age at blood collection to metabolic level")),
    
    sidebarLayout(
      sidebarPanel(
        width = 3,
        tabsetPanel()
      ),
      
      mainPanel()
    )
  )
)