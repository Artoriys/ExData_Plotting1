#read dataset of power consumption

powerdata <- read.table("household_power_consumption.txt", 
                        sep = ";", header = TRUE, as.is = TRUE, dec=".")

powerdata <- powerdata[powerdata$Date == "1/2/2007" | powerdata$Date == "2/2/2007",]
for (i in 3:9) {
  powerdata[[i]] = as.numeric(powerdata[[i]]);
}

#Creating plot
hist(powerdata$Global_active_power, 
     col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

#Saving plot in png
dev.copy(png, file = "plot1.png")
dev.off()