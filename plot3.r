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


plot(datetime, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2, type="l", col="red")
lines(datetime, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
