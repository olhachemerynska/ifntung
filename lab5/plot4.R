# Data reading
dataframe <- read.csv("F:/MyGitHub/TestRepository/STPSS/R_5/exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, dec=".",sep=";")
# Clear all fields with "?"
cleanframe <- dataframe[apply(dataframe, 1, function(row) {all(!('?' %in% row))}),]
# Convert factor to numeric
cleanframe$Global_active_power = as.numeric(levels(cleanframe$Global_active_power))[cleanframe$Global_active_power]
cleanframe$Voltage = as.numeric(levels(cleanframe$Voltage))[cleanframe$Voltage]
cleanframe$Sub_metering_1 = as.numeric(levels(cleanframe$Sub_metering_1))[cleanframe$Sub_metering_1]
cleanframe$Sub_metering_2 = as.numeric(levels(cleanframe$Sub_metering_2))[cleanframe$Sub_metering_2]
cleanframe$Sub_metering_3 = as.numeric(levels(cleanframe$Sub_metering_3))[cleanframe$Sub_metering_3]
cleanframe$Global_reactive_power = as.numeric(levels(cleanframe$Global_reactive_power))[cleanframe$Global_reactive_power]
# Convert factor to Date
cleanframe$Date = as.Date(cleanframe$Date, format = "%d/%m/%Y")
par(mfrow=c(2,2))
#Draw plot #1
plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Global_active_power"]
plot(plotdata,type="l",xaxt="n", xlab="", ylab="Global Active Pover (kilowatts)")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))
#Draw plot #2
plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Voltage"]
plot(plotdata,type="l",xaxt="n", xlab="", ylab="Voltage")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))
#Draw plot #3
plot(plotdata1,type="l",xaxt="n", xlab="", ylab="Energy sub metering")
lines(plotdata2, type="l",col="red")
lines(plotdata3, type="l",col="blue")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))
legend(1200,38, c("Sub metering 1","Sub metering 2","Sub metering 3"),  col=c("black","red","blue"), lty=1);
#Draw plot #4
plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Global_reactive_power"]
plot(plotdata,type="l",xaxt="n", xlab="", ylab="Global Rective Pover")
axis(1, at=c(0,length(plotdata)/2,length(plotdata)),labels=c("Thu","Fri","Sat"))
# Save image
dev.copy(device = png, filename = 'F:/MyGitHub/TestRepository/STPSS/R_5/Plot4.png', width = 480, height = 480)
dev.off ()


