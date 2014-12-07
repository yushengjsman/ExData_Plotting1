# Read data
energydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Select data we need
subData <- energydata[which(energydata$Date == "1/2/2007" | energydata$Date == "2/2/2007"), ]
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
Sys.setlocale("LC_TIME", "English")
png("plot2.png", width = 480, height = 480)
with(subData3, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)"))
dev.off()
