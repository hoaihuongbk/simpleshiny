#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)
library(markdown)

# Define some common variables
variables <-
  list(
    `Apple` = "AAPL",
    `Facebook` = "FB",
    `Netflix` = "NFLX",
    `Google` = "GOOG"
  )

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("superhero"),
  # Application title
  titlePanel("How to use Shiny for get and show stock data"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      checkboxGroupInput(
        "symbols",
        label = h3("Symbol"),
        choices = variables,
        selected = c("AAPL", "FB", "NFLX")
      ),
      dateRangeInput(
        "daterange",
        "Date range:",
        start  = "2017-01-01",
        end    = "2017-12-31",
        min    = "2015-01-01",
        max    = "2018-04-01",
        format = "mm/dd/yyyy",
        separator = " - "
      ),
      div(id = "description", includeMarkdown("description.md"))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(tabsetPanel(
      id = "tab",
      tabPanel("Plot",
               plotOutput("distPlot")),
      tabPanel("Summary",
               verbatimTextOutput("summary"))
    ))
  )
))
