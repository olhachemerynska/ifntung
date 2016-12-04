
# Data reading
dataframe <- read.csv("C:/STSPS/lab5/household_power_consumption.txt", header=TRUE, dec=".",sep=";")

# Clear all fields with "?"
cleanframe <- dataframe[apply(dataframe, 1, function(row) {all(!('?' %in% row))}),]

# Convert factor to numeric
cleanframe$Global_active_power = as.numeric(levels(cleanframe$Global_active_power))[cleanframe$Global_active_power]
# Convert factor to Date
cleanframe$Date = as.Date(cleanframe$Date, format = "%d/%m/%Y")

plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Global_active_power"]

#Draw plot
plot(plotdata,type="l",xaxt="n", xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))
# Save image
dev.copy(device = png, filename = 'C:/STSPS/lab5/Plot2.png', width = 480, height = 480)
dev.off ()