# Data reading
dataframe <- read.csv("C:/STSPS/lab5/household_power_consumption.txt", header=TRUE, dec=".",sep=";")

# Clear all fields with "?"
cleanframe <- dataframe[apply(dataframe, 1, function(row) {all(!('?' %in% row))}),]

# Convert factor to numeric
cleanframe$Sub_metering_1 = as.numeric(levels(cleanframe$Sub_metering_1))[cleanframe$Sub_metering_1]
cleanframe$Sub_metering_2 = as.numeric(levels(cleanframe$Sub_metering_2))[cleanframe$Sub_metering_2]
cleanframe$Sub_metering_3 = as.numeric(levels(cleanframe$Sub_metering_3))[cleanframe$Sub_metering_3]
# Convert factor to Date
cleanframe$Date = as.Date(cleanframe$Date, format = "%d/%m/%Y")

plotdata1 <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Sub_metering_1"]
plotdata2 <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Sub_metering_2"]
plotdata3 <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Sub_metering_3"]

#Draw plot
plot(plotdata1,type="l",xaxt="n", xlab="", ylab="Energy sub metering")
lines(plotdata2, type="l",col="red")
lines(plotdata3, type="l",col="blue")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))
legend(1200,38, c("Sub metering 1","Sub metering 2","Sub metering 3"),  col=c("black","red","blue"), lty=1);
# Save image
dev.copy(device = png, filename = 'C:/STSPS/lab5/Plot3.png', width = 480, height = 480)
dev.off ()


