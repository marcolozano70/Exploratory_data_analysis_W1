## SCRIPT OF PLOT 2 OVERVIEW

## Reads in the “Individual household electric power consumption Data Set” available from the UC Irvine Machine Learning Repository, 
## and produces a histogram of the frequency of Global Active Power consumption in kilowatts for the dates February 1 and 2, 2007. 

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


## SCRIPT OF PLOT 2 STEP - By - STEP


# 1.-  The directory was previously setting
setwd("/c/Coursera/Mes 4/Semana 1/Deber")


# 2.- Read Data:
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# 3.- Household power consumption for Feb. 1 and 2, 2007 only:
data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

# 4.- Concatante Date and Time variables:
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

# 5.- Open png device:
png("Plot2.png", width=480, height=480)

# 6.- Plot the graph:
plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (Kilowatts)")

# 7.- Turn off device:
dev.off()
cat("Plot2.png has been saved in", getwd())

# End second SCRIPT.
