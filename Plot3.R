## SCRIPT OF PLOT 3 OVERVIEW

## Reads in the “Individual household electric power consumption Data Set” available from the UC Irvine Machine Learning Repository, 
## and produces a histogram of the frequency of Global Active Power consumption in kilowatts for the dates February 1 and 2, 2007. 

## SCRIPT PLOT 3 STEP-BY-STEP: Description:

## CodeBook
## The following descriptions of the 9 variables in the dataset are taken from the UCI web site:

## Date: Date in format dd/mm/yyyy
## Time: time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (in kilowatt)
## Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
## Voltage: minute-averaged voltage (in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). 
##     It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
## Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). 
##     It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
## Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). 
##     It corresponds to an electric water-heater and an air-conditioner.


# 1.-  The directory was previously setting:
setwd("/c/Coursera/Mes 4/Semana 1/Deber")

# 2.- Read Data:
data_full <- read.csv("household_power_consumption.txt", na.string="?", sep=";")
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## 3.- Subsetting the data:
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## 4.- Converting dates:
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## 5.- Plot 3:
with(data, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (Kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## 6.- Saving to file:
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()
cat("Plot3.png has been saved in", getwd())

# End third SCRIPT.
