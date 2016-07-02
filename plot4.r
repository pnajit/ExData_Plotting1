rm(list=ls(all=TRUE))
install.packages("dplyr")
library(dplyr)

install.packages("data.table")
library(data.table)

setwd(path.expand("~/EDA"))

newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

newFile$DateTime <- paste(newFile$Date, newFile$Time)
subSetData <- newFile[newFile$Date %in% c("1/2/2007","2/2/2007") ,]
names(subSetData)
Sub_metering_1<- as.numeric(subSetData$Sub_metering_1)
Sub_metering_2<- as.numeric(subSetData$Sub_metering_2)
Sub_metering_3<- as.numeric(subSetData$Sub_metering_3)
globalActivePower <- as.numeric(subSetData$Global_active_power)
#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
voltage <- as.numeric(subSetData$Voltage)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
par(mfrow = c(2, 2),mar=c(4,4,2,1), oma=c(0,0,2,0)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")


plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n",cex=0.5,merge = TRUE)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
  
