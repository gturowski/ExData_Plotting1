#Getting and Cleaning Data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="HouseholdConsumption")
unzip("HouseholdConsumption")
consumption <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
library(tidyr)
library(dplyr)
#Filtering Data
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
final_cons<-filter(consumption, Date=="2007-02-01" | Date=="2007-02-02")
#Converting Date and Time into Datetime
datetime <- paste(as.Date(final_cons$Date), final_cons$Time)
final_cons$Datetime <- as.POSIXct(datetime)
#Creating graph
plot(final_cons$Global_active_power~final_cons$Datetime, type="l",ylab="Global Active Power (kilowatts)", xlab="")
#Saving data to a file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
