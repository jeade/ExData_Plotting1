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
with(feb2007,plot(dayTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))

# Make the PNG file
png(filename="plot2.png", width=480, height=480)
with(feb2007,plot(dayTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()

