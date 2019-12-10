library(shiny)


source("parameters.R")
source("functions.R")

load("www/500KClean.RData")


shinyServer(function(input, output, session) {
  
  getMeta <- reactive({
    
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
  
})