source("script.R")
data <- read.xls()

draw <- function(month){
  plotValues <- dataByMonth(data, month)
  
  if(!is.null(plotValues)){
    plot(1:nrow(plotValues), plotValues[, 2], type = "l", xaxt = "n", xlab = "Month", ylab = "Temperature, C")
    
    if(is.null(month)){
      title("The temperature in Ivano-Frankivsk")
    } else {
      title(paste("The temperature in Ivano-Frankivsk", month, sep = ", "))
    }
    
    axis(1, at = 1:nrow(plotValues),  labels = plotValues[, 1])
  }
}

text <- function(date){
  valueByDate(data, date)
}

shinyServer(
  function(input, output) {
    output$plot <- renderPlot({
      draw(input$month)
    })
    
    output$text <- renderText({
      text(input$date)
    })
  }
)