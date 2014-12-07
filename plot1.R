# Read data
energydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Select data we need
subData <- energydata[which(energydata$Date == "1/2/2007" | energydata$Date == "2/2/2007"), ]
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
png("plot1.png", width = 480, height = 480)
with(subData, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red"))
dev.off()