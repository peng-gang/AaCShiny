library(shiny)


source("parameters.R")
source("functions.R")

load("www/500KClean.RData")


shinyServer(function(input, output, session) {
  
  getMeta <- reactive({
    if(input$meta == "analytes"){
      ana_sel <- input$analyte
      if(length(ana_sel) == 0){
        ## ERROR MESSAGE
      } else if(length(ana_sel) == 1){
        meta <- meta_data[, as.integer(ana_sel)]
        names(meta) <- analytes_all[as.integer(ana_sel)]
        return(meta)
      } else {
        meta <- rowSums(meta_data[, as.integer(ana_sel)])
        names(meta) <- paste( analytes_all[as.integer(ana_sel)], collapse = " + ")
        return(meta)
      }
      
    } else {
      num_sel <- input$numerator
      den_sel <- input$denominator
    }
  })
  
  bwIndex <- reactive({
    bw_sel <- input$bw
    if(length(bw_sel) == length(bw_group)){
      return(rep(TRUE, nrow(meta_data)))
    } else {
      return(flag_bw %in% bw_group[as.integer(bw_sel)])
    }
  })
  
  
  gaIndex <- reactive({
    ga_sel <- input$ga
    if(length(ga_sel) == length(ga_group)){
      return(rep(TRUE, nrow(meta_data)))
    } else {
      return(flag_ga %in% ga_group[as.integer(ga_sel)])
    }
  })
  
  raceIndex <- reactive({
    race_sel <- input$race
    if(length(race_sel) == length(race_group)){
      return(rep(TRUE, nrow(meta_data)))
    } else {
      return(flag_race %in% race_group[as.integer(race_sel)])
    }
  })
  
  sexIndex <- reactive({
    sex_sel <- input$sex
    if(length(sex_sel) == length(sex_group)){
      return(rep(TRUE, nrow(meta_data)))
    } else {
      return(flag_sex %in% sex_group[as.integer(sex_sel)])
    }
  })
  
  tpnIndex <- reactive({
    tpn_sel <- input$tpn
    if(length(tpn_sel) == length(tpn_group)){
      return(rep(TRUE, nrow(meta_data)))
    } else {
      return(flag_tpn %in% tpn_group[as.integer(tpn_sel)])
    }
  })
  
  
  output$boxplot <- renderPlot({
    
  })
})