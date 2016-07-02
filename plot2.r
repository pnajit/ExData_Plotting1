rm(list=ls(all=TRUE))
install.packages("dplyr")
library(dplyr)

install.packages("data.table")
library(data.table)

setwd(path.expand("~/EDA"))

newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)

newFile$DateTime <- paste(newFile$Date, newFile$Time)
subSetData <- newFile[newFile$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetData$Global_active_power)
#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 



plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()