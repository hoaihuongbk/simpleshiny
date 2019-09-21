#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  ## Init
  source("lib.R")
  source("util.R")
  
  cols <- reactive({
    cols <-
      colorRampPalette(brewer.pal(8, "Spectral"))(length(input$symbols))
  })
  
  data <- reactive({
    data <-
      getData(input$symbols, input$daterange[1], input$daterange[2])
  })
  
  # Plot
  output$distPlot <- renderPlot({
    plot(
      data(),
      screens = 1,
      xlab = "Time",
      ylab = "Open Price ($)",
      col = cols(),
      lwd = 3
    )
    legend(
      "topleft",
      inset = c(0, 0),
      y.intersp = 1,
      legend = input$symbols,
      lty = 1,
      bty = "n",
      col = cols()
    )
  })
  
  # Summary
  output$selectedSymbol <- renderText(input$symbols)
  output$summary <- renderPrint(summary(data()))
})
