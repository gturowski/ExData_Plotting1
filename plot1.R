#Getting and Cleaning Data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="HouseholdConsumption")
unzip("HouseholdConsumption")
consumption <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?", stringsAsFactors=F)
library(tidyr)
library(dplyr)
#Filtering Data
consumption$Date <- as.Date(consumption$Date, format="%d/%m/%Y")
final_cons<-filter(consumption, Date=="2007-02-01" | Date=="2007-02-02")
#Creating Histogram
hist(final_cons$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
#Saving data to a file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
