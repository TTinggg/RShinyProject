#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#




library(shiny)
library(tidyverse)
library(ggplot2)

library(fmsb)
library(RColorBrewer)
library(scales)


shinyServer(function(input, output) {
    
    output$plot <- renderPlot({
        
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
        
        
        
        
    })
    output$dataSet <- DT::renderDataTable({
        DT::datatable(cars)
    })
    
    output$graph<- renderPlot({
        
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
        
        
        
        
    })
    
    
  
   
     df<-reactive({
       tab2_bonds %>% select(input$checkbox)
   })
    
    
    
    
    output$radarplot<-renderPlot({
      if (length(input$checkbox) < 3) {
        output$selected_num<-renderText(paste("Please choose at least 3 Bonds"))
      } else{
        
        coul <- brewer.pal(10, "RdBu")
        colors_in <- alpha(coul,0.3)
        
        
        colors_border <- coul
        radarchart( df(), axistype=0 , maxmin=F,
                    #custom polygon
                    pcol=colors_border , pfcol=colors_in,plwd=3, plty=2,
                    #custom the grid
                    cglcol="grey", cglty=1, axislabcol="black", cglwd=0.8, 
                    #custom labels
                    vlcex=1)
        legend(1.4, 1.25, legend = rownames(tab2_bonds), col = colors_border, seg.len = 2, border = "transparent", pch = 16, lty = 1)
        
        
        }
        
        
    })
    
    
    
    output$car<- renderPlot({
        
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
        
        
        
        
    })
    
    output$kill<- renderPlot({
        
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
        
        
        
        
    })
    

    
})