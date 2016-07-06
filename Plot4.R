## SCRIPT PLOT 4 OVERVIEW

## Reads in the “Individual household electric power consumption Data Set” available from the UC Irvine Machine Learning Repository, 
## and produces a histogram of the frequency of Global Active Power consumption in kilowatts for the dates February 1 and 2, 2007. 

## SCRIPT PLOT 4 STEP - By - STEP

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

# 2.- Read data set after unzipping the data file:
data <- read.table("household_power_consumption.txt",header=T, sep=";")

# 3.- Household power consumption for Feb. 1 and 2, 2007 only:
data2 <- data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# 4.- Concatante Date and Time variables:
data2$dateTime = paste(data2$Date, data2$Time)

# 5.- Convert to Date/Time class:
data2$dateTime <- strptime(data2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(data2)

# 6.- Open png device:
png("Plot4.png", width=480, height=480, units="px")

# 7.- Plot Energy sub metering:
par(mfrow=c(2,2))
plot(dateTime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power")

plot(dateTime, as.numeric(as.character(Voltage)), type="l", xlab="datetime", ylab="Voltage")

plot(dateTime, as.numeric(as.character(Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(dateTime, as.numeric(as.character(Sub_metering_2)), col="red")
lines(dateTime, as.numeric(as.character(Sub_metering_3)), col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

plot(dateTime, as.numeric(as.character(Global_reactive_power)), type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()
cat("Plot4.png has been saved in", getwd())

# End Fourth SCRIPT.
