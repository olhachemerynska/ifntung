
#PLOT 1

# Data reading
dataframe <- read.csv("F:/MyGitHub/TestRepository/STPSS/R_5/exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, dec=".",sep=";")

# Clear all fields with "?"
cleanframe <- dataframe[apply(dataframe, 1, function(row) {all(!('?' %in% row))}),]

# Convert factor to numeric, factor to Date
cleanframe$Global_active_power = as.numeric(levels(cleanframe$Global_active_power))[cleanframe$Global_active_power]
cleanframe$Date = as.Date(cleanframe$Date, format = "%d/%m/%Y")

plotdata <- cleanframe[cleanframe["Date"]=="2007-02-01" | cleanframe["Date"]=="2007-02-02","Global_active_power"]

# Draw hist
hist(plotdata, col="red", xlab="Global Active Pover (kilowatts)", main="Global Active Pover")
# Save image
dev.copy(device = png, filename = 'F:/MyGitHub/TestRepository/STPSS/R_5/Plot1.png', width = 480, height = 480)
dev.off ()


