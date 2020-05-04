library(shiny)


source("parameters.R")
source("functions.R")

load("www/500KClean.RData")

shinyServer(function(input, output, session) {
  
  getMeta <- reactive({
    if(input$meta == "analytes"){
      ana_sel <- input$analyte
      if(length(ana_sel) == 0){
        # ## ERROR MESSAGE
        # showModal(
        #   modalDialog(
        #     title = "Warning!",
        #     "At least one analyte should be selected and the default analyte is selected",
        #     easyClose = TRUE
        #   )
        # )
        
        # updateSelectInput(
        #   session, "analyte", selected = which(analytes_all=="C3")
        # )
        
        meta <- meta_data[, which(analytes_all=="C3")]
        return(list(meta=meta, name = "C3"))
      } else if(length(ana_sel) == 1){
        meta <- meta_data[, as.integer(ana_sel)]
        return(list(meta=meta, name = analytes_all[as.integer(ana_sel)]))
      } else {
        meta <- rowSums(meta_data[, as.integer(ana_sel)])
        return(list(meta=meta, name = paste(analytes_all[sort(as.integer(ana_sel))], collapse = " + ")))
      }
    } else {
      num_sel <- input$numerator
      den_sel <- input$denominator
      meta_num <- NULL
      meta_den <- NULL
      name_num <- NULL
      name_den <- NULL
      
      if(length(num_sel) == 0){
        # ## ERROR MESSAGE
        # showModal(
        #   modalDialog(
        #     title = "Warning!",
        #     "At least one analyte should be selected and the default analyte is selected",
        #     easyClose = TRUE
        #   )
        # )
        # updateSelectInput(
        #   session, "numerator", selected = which(analytes_all=="C3")
        # )
        meta_num <- meta_data[, which(analytes_all=="C3")]
        name_num <- "C3"
      } else if(length(num_sel) == 1){
        meta_num <- meta_data[, as.integer(num_sel)]
        name_num <- analytes_all[as.integer(num_sel)]
      } else {
        meta_num <- rowSums(meta_data[, as.integer(num_sel)])
        name_num <- paste0("(", paste(analytes_all[sort(as.integer(num_sel))], collapse = " + "), ")")
      }
      
      
      if(length(den_sel) == 0){
        ## ERROR MESSAGE
        # showModal(
        #   modalDialog(
        #     title = "Warning!",
        #     "At least one analyte should be selected and the default analyte is selected",
        #     easyClose = TRUE
        #   )
        # )
        # updateSelectInput(
        #   session, "denominator", selected = which(analytes_all=="C2")
        # )
        meta_den <- meta_data[, which(analytes_all=="C2")]
        name_den <- "C2"
      } else if(length(den_sel) == 1){
        meta_den <- meta_data[, as.integer(den_sel)]
        name_den <- analytes_all[as.integer(den_sel)]
      } else {
        meta_den <- rowSums(meta_data[, as.integer(den_sel)])
        name_den <- paste0("(", paste(analytes_all[sort(as.integer(den_sel))], collapse = " + "), ")")
      }
      
      meta <- meta_num / meta_den
      return(list(meta=meta, name = paste0(name_num, "/", name_den)))
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
  
  compareIndex <- reactive({
    return(input$compare)
  })
  
  
  output$boxplot <- renderPlot({
    if(as.integer(compareIndex())>-1){
      idx_sel <- bwIndex() & gaIndex() & raceIndex() & sexIndex() & tpnIndex()
      aacBoxPlot(getMeta()$meta, flag_aac, idx_include, idx_sel, getMeta()$name)
    } else {
      idx_sel <- bwIndex() & gaIndex() & raceIndex() & sexIndex() & tpnIndex()
      aacBoxPlotCompare(getMeta()$meta, flag_aac, as.integer(compareIndex()), idx_include, idx_sel, 
                 flag_sex, flag_bw, flag_ga, flag_race, flag_tpn,
                 getMeta()$name)
    }
  })
  
  
  output$trendplot <- renderPlot({
    if(as.integer(compareIndex())==1){
      idx_sel <- bwIndex() & gaIndex() & raceIndex() & sexIndex() & tpnIndex()
      aacTrend(getMeta()$meta, aac, idx_include, idx_sel, getMeta()$name)
    } else {
      idx_sel <- bwIndex() & gaIndex() & raceIndex() & sexIndex() & tpnIndex()
      aacTrendCompare(getMeta()$meta, aac, as.integer(compareIndex()), idx_include, idx_sel, 
                      flag_sex, flag_bw, flag_ga, flag_race, flag_tpn,
                      getMeta()$name)
    }
  })
  
})