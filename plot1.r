rm(list=ls(all=TRUE))
install.packages("dplyr")
library(dplyr)

install.packages("data.table")
library(data.table)

setwd(path.expand("~/EDA"))
#read the file

newFile <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", stringsAsFactors=FALSE)
#read date time into a new colum
newFile$DateTime <- paste(newFile$Date, newFile$Time)

#read only 2 days of data
subSetData <- newFile[newFile$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetData$Global_active_power)

#draw the histogram
hist(globalActivePower,main="Global Active Power",col = "red",
      xlab = "Global Active Power(kilowatts)",ylab="Frequency")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
