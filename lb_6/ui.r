library(shiny)

source("script.R")

shinyUI(pageWithSidebar(
  headerPanel("The temperature in Ivano-Frankivsk"),
  
  sidebarPanel(
    #checkboxGroupInput("month", "Select months:", months()),
    selectInput("month", "Select months:", choices=months()),
    dateInput("date", "Select the day to get the exact value:", value = "2016-11-01") 
  ),
  
  mainPanel(
    plotOutput("plot"),
    hr(),
    verbatimTextOutput("text")
  )
))