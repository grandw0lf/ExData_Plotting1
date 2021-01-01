library("data.table")
#Downloading File from UCI Website:
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
here <- getwd()
setwd(here)
destfile <- "household_power_consumption.zip"
download.file(url, destfile)
zipF<- file.choose(destfile) 
outDir<- here # Define the folder where the zip file should be unzipped to 
unzip(zipF,exdir=outDir)  # unzip your file 

#Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#Calling the plot
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

png("plot1.png", width=480, height=480)

# Annotating graph
title(main="Global Active Power")

dev.off()