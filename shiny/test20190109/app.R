#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(quantmod)
#
ui<-fluidPage(
  titlePanel("stock input"),
  sidebarLayout(  
    sidebarPanel(
      textInput("stock", label = h3("Stock Symbol"), value = "2330.TW"),
      dateRangeInput("time",start = "2008-01-01",end ="2012-06-01", label = h3("Time")),
      fluidRow(column(4,checkboxInput("D5", label = "5D", value = TRUE)),
               column(4,checkboxInput("D20", label = "20D", value = TRUE)),
               column(4,checkboxInput("D240", label = "240D", value = TRUE))
      ) 
    ),
    mainPanel(
      plotOutput("chart")    
    )    
  )
)

#-----------------------------------------------------------------------
server<-
  function(input, output) {
    dataStock <-
      reactive({
        getSymbols(input$stock, auto.assign = FALSE)
      })
    output$chart <-renderPlot({
        timeup<-as.character(input$time[1]) 
        timedown<-as.character(input$time[2]) 
        time <-paste0(timeup,"::",timedown)
        chartSeries(dataStock()[time],theme="white")
        c(if(input$D5){addSMA(n=5,col="red")}, 
          if(input$D20){addSMA(n=20,col="green")},
          if(input$D240){addSMA(n=240,col="purple")}
        )
      })
  }
# Run the application 
shinyApp(ui = ui, server = server)

# deploy app to shinyapp.io
#library(rsconnect)
#deployApp()

