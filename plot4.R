# Exploratory Data Analysis,  week1 project
# Plot 1
# Author: Jeremy Eade
# Date: 4/23/2016

# Clear-out objects
rm(list=ls())
plot.new()

# Dependent libraries
library(dplyr)
library(tidyr)
library(lubridate)

# Read data and select dates 2007-02-01 and 2007-02-0
colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
df <- read.table(file="household_power_consumption.txt",header=TRUE,sep=";",dec=".",na.strings="?",colClasses=colClasses)
df <- tbl_df(df)
feb2007 <- filter(df,Date=="1/2/2007" | Date=="2/2/2007")

# Create date time from character Date and Time columns
feb2007 <- mutate(feb2007,dayTime=dmy_hms(paste(Date,Time)))

# Make the plot
par(mfrow=c(2,2))

# Upper-left
with(feb2007,plot(dayTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

# Upper-right
with(feb2007,plot(dayTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

# Lower-left
with(feb2007,plot(dayTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(feb2007,lines(dayTime,Sub_metering_1))
with(feb2007,lines(dayTime,Sub_metering_2,col="red"))
with(feb2007,lines(dayTime,Sub_metering_3,col="blue"))
legend("topright",lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Lower-right
with(feb2007,plot(dayTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

# Make the PNG file
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Upper-left
with(feb2007,plot(dayTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

# Upper-right
with(feb2007,plot(dayTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))

# Lower-left
with(feb2007,plot(dayTime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(feb2007,lines(dayTime,Sub_metering_1))
with(feb2007,lines(dayTime,Sub_metering_2,col="red"))
with(feb2007,lines(dayTime,Sub_metering_3,col="blue"))
legend("topright",lwd=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Lower-right
with(feb2007,plot(dayTime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))

dev.off()

