library(shiny)

source("parameters.R")


shinyUI(
  fluidPage(
    titlePanel("RUSPtools",
               title = tags$strong("The influence of age at blood collection to metabolic level")),
    
    sidebarLayout(
      sidebarPanel(
        width = 3,
        tabsetPanel(
          type = "tabs",
          id = "analytes",
          tabPanel(
            "Single",
            value = "single",
            tags$div(
              title = "Select an analyte",
              selectInput(
                "analyte",
                label = h4("Analyte"),
                choices = analytes_all,
                selected = "C3"
              )
            )
          ),
          tabPanel(
            "Ratio",
            value = "ratio",
            tags$div(
              title = "Select numerator and denominator for the ratio. If multiple analytes are selected, they will be added",
              selectInput(
                "numerator",
                label = h4("Numerator"),
                choices = analytes_all,
                selected = "C3"
              ),
              selectInput(
                "denominator",
                label = h4("Denominator"),
                choices = analytes_all,
                selected = "C2"
              )
            )
          )
        ),
        
        hr(),
        
        tags$div(
          title = "Select birth weight range to include in the figure",
          checkboxGroupInput(
            "bw",
            label = h4("Birth Weight (g)"),
            choices = makeList(bw_group),
            selected = 1:length(bw_group)
          )
        ),
        
        tags$div(
          title = "Select gestational age range to include in the figure",
          checkboxGroupInput(
            "ga",
            label = h4("Gestational Age (week)"),
            choices = makeList(ga_group),
            selected = 1:length(ga_group)
          )
        ),
        
        tags$div(
          title = "Select race/ethnicity group(s) to include in the figure",
          checkboxGroupInput(
            "race",
            label = h4("Race/Ethnicity"),
            choices = makeList(race_group),
            selected = 1:length(race_group)
          )
        ),
        
        tags$div(
          title = "Select sex to include in the figure",
          checkboxGroupInput(
            "sex",
            label = h4("Sex"),
            choices = makeList(sex_group),
            selected = 1:length(sex_group)
          )
        ),
        
        tags$div(
          title = "Select TPN status to include in the figure",
          checkboxGroupInput(
            "tpn",
            label = h4("TPN"),
            choices = makeList(tpn_group),
            selected = 1:length(tpn_group)
          )
        )
      ),
      
      mainPanel(
        plotOutput("boxplot"),
        hr(),
        plotOutput("trendplot")
      )
    )
  )
)