#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that plots
shinyUI(fluidPage(
  
  # Application title
  titlePanel("My Tree"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("cp",
                  "Select cp:",
                  min = 0,
                  max = 0.05,
                  value = 0.013)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  ) ,
  
  mainPanel(" ###### Ptl = Number of premature labour 
            ###### lwt = Mother's weight in pounds at last menstrual period
            ###### age = Mother's age in years
            ###### ht = History of hypertension
            ###### This tree showcases the classifications for someone to give birth to a baby whose weight is less than 2.5kg.
            Depending on the cp level chosen, there are generally either 3 (ptl, lwt, age) or 4 (ptl, lwt, ht, age) attributes which influence the baby's weight"), 
  
  plotOutput("distPlot_2")
  
))

