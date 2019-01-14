#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("大家好!!!"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("radio", label = "Choices", choices = list("Choice 1" = 1, "Choice 2" = 2)),
      sliderInput("slider1", label = "Slider", min = 0, max = 100, value = 50)
    ),
    mainPanel(plotOutput("distPlot"))
  )
))