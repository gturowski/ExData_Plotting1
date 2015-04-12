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
DateTime <- paste(as.Date(final_cons$Date), final_cons$Time)
final_cons$Datetime <- as.POSIXct(DateTime)
#Creating graph
par(mfrow=c(1,1))
with(final_cons, {
plot(Sub_metering_1~Datetime, type="l",ylab="Energy sub metering", xlab="")
lines(Sub_metering_2~Datetime, col="red")
lines(Sub_metering_3~Datetime, col="blue")
})
#Creating Legend
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=2)
#Saving data to a file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
