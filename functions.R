library(ggplot2)

makeList <- function(x){
  rlt <- list()
  for(i in 1:length(x)){
    rlt[[i]] <- i
  }
  names(rlt) <- x
  rlt
}


aacBoxPlot <- function(numerator, denominator = NULL,
                       idx_sel = NULL, ylab){
  num <- 0
  for(n in numerator){
    num <- num + meta_data[, n]
  }
  x <- NULL
  if(is.null(denominator)){
    x <- num
  } else {
    dem <- 0
    for(d in denominator){
      dem <- dem + meta_data[, d]
    }
    x <- num / dem
  }
  
  dplot <- data.frame(
    x = x,
    aac = flag_aac
  )
  
  if(is.null(idx_sel)){
    dplot <- dplot[idx_include, ]
  } else {
    dplot <- dplot[idx_include & idx_sel, ]
  }
  
  gp <- ggplot(dplot) + geom_boxplot(aes(x=aac, y = x)) + 
    labs(x="Age at Blood Collection", y = ylab) + 
    theme_light()
  
  gp
}

aacTrend <- function(numerator, denominator = NULL,
                     idx_sel = NULL, ylab){
  num <- 0
  for(n in numerator){
    num <- num + meta_data[, n]
  }
  x <- NULL
  if(is.null(denominator)){
    x <- num
  } else {
    dem <- 0
    for(d in denominator){
      dem <- dem + meta_data[, d]
    }
    x <- num / dem
  }
  
  dplot <- data.frame(
    x = x,
    aac = aac
  )
  
  if(is.null(idx_sel)){
    dplot <- dplot[idx_include, ]
  } else {
    dplot <- dplot[idx_include & idx_sel, ]
  }
  
  gp <- ggplot(dplot) + geom_smooth(aes(x=aac, y = x), method = "gam", formula = y ~ s(x, bs = "cs")) + 
    labs(x="Age at Blood Collection (Hour)", y = ylab) + 
    theme_light()
  
  gp
}