library(XLConnect)

read.xls <- function(){
  data <- data.frame(readWorksheet(loadWorkbook("data.xls"), sheet = "sheet", startRow = 7))
  data <- data[, 1:2]
  colnames(data) <- c("Date", "Temperature")
  data[, 2] <- as.numeric(data[, 2])
  
  result <- matrix(ncol = 2)
  colnames(result) <- colnames(data)
  
  date <- ""
  temperature <- 0
  count <- 0
  
  for(row in 1:nrow(data)){
    v <- strsplit(data[row, 1], "[ ]")[[1]]
    current_date <- v[1]
    current_temperature <- data[row, 2]
    
    if(current_date == date){
      temperature <- temperature + current_temperature
      count <- count + 1
    } else {
      if(length(date) > 0){
        result <- rbind(result, matrix(list(date, temperature / count), ncol = 2))
      }
      
      temperature <- current_temperature
      count <- 1
    }
    
    date <- current_date
  }
  
  result <- result[-1, ]
  result <- result[-1, ]
  
  return (data.frame(result))
}

months <- function(){
  days <- read.xls()[, 1]
  
  result <- vector()
  
  for(i in 1:length(days)){
    result <- c(result, format(as.Date(days[i][[1]], format = "%d.%m.%Y"), "%b %Y"))
  }
  
  return (unique(result))
}

dataByMonth <- function(data, month){
  if(length(month) == 0){
    return (NULL)
  }
  
  result <- matrix(ncol = 2)
  
  for(row in 1:nrow(data)){
    date <- data[row, 1][[1]]
    
    if(format(as.Date(date, format = "%d.%m.%Y"), "%b %Y") == month){
      result <- rbind(result, matrix(list(date, data[row, 2][[1]]), ncol = 2))
    }
  }
  
  result <- result[-1, ]
  
  return (data.frame(result[nrow(result):1,]))
}

valueByDate <- function(data, date){
  text <- "We have not value for that date"
  
  for(row in 1:nrow(data)){
    f <- format(date, "%d.%m.%Y")
    
    if(data[row, 1] == format(date, "%d.%m.%Y")){
      text <- paste("The average temperature for", f, "was", data[row, 2], "C", sep = " ")
    }
  }
  
  return (text)
}