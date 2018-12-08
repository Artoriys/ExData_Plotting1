#read dataset of power consumption

powerdata <- read.table("household_power_consumption.txt", 
                        sep = ";", header = TRUE, as.is = TRUE, dec=".")

powerdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]
for (i in 3:9) {
  powerdata[[i]] = as.numeric(powerdata[[i]]);
}

datetime <- strptime(paste(
  powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
par(mfrow = c(2,2))

#Creating plot

plot(datetime, powerdata$Global_active_power, xlab = " ",
     ylab = "Global Active Power (kilowatts)", type = "l")

plot(datetime, powerdata$Voltage,
     ylab = "Voltage", type = "l")

plot(datetime, powerdata$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering")
lines(datetime, powerdata$Sub_metering_2, col = "Red")
lines(datetime, powerdata$Sub_metering_3, col = "Blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1, bty = "o")

plot(datetime, powerdata$Global_reactive_power,
     ylab = "Global_reactive_power", type = "l")

#Saving plot in png
dev.copy(png, file = "plot4.png")
dev.off()






