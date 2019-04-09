#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(lmtest)
library(ggplot2)
library(plotly)
library(rpart)
library(rpart.plot)
library(readr)


# Define server logic required to plot
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    birthwt <- as.data.frame(birthwt)
    birthwt_e <- as.data.frame(birthwt[ , 1:9])
    
    birthwt_tree <- rpart(low ~ . ,data = birthwt_e, method = 'class', cp = input$cp)
    rpart.plot(birthwt_tree, type = 1, extra = 1)
    
    
  })
  
  output$distPlot_2 <- renderPlot({
    birthwt_tree <- rpart(low ~ . ,data = birthwt_e, method = 'class', cp = input$cp)
    plotcp(birthwt_tree)
  })

})

