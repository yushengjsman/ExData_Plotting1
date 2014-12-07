# Read data
energydata <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
# Select data we need
subData <- energydata[which(energydata$Date == "1/2/2007" | energydata$Date == "2/2/2007"), ]
subData$Global_active_power <- as.numeric(as.character(subData$Global_active_power))
subData$Voltage <- as.numeric(as.character(subData$Voltage))
subData$Global_reactive_power <- as.numeric(as.character(subData$Global_reactive_power))
subData <- cbind(subData, dateTime = paste(subData$Date, subData$Time))
subData$dateTime <- strptime(subData$dateTime, "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "English")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(subData3, plot(dateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

with(subData3, plot(dateTime, Voltage, type = "l"))

with(subData, plot(dateTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(subData, points(dateTime, Sub_metering_2, type = "l", col = "red"))
with(subData, points(dateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"), cex = 0.75)

with(subData, plot(dateTime, Global_reactive_power, type = "l"))