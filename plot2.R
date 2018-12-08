#read dataset of power consumption

powerdata <- read.table("household_power_consumption.txt", 
                        sep = ";", header = TRUE, as.is = TRUE, dec=".")

powerdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]
for (i in 3:9) {
  powerdata[[i]] = as.numeric(powerdata[[i]]);
}

#Creating plot
datetime <- strptime(paste(
  powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, powerdata$Global_active_power, xlab = " ",
     ylab = "Global Active Power (kilowatts)", type = "l")

#Saving plot in png
dev.copy(png, file = "plot2.png")
dev.off()