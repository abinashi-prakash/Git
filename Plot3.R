# Read the file
powerdata<-read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings = "?")

#Convert Date
powerdata$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

#Select the data in the date range
powerdata2 <- subset(powerdata,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# Combine Date and Time in a single variable
powerdata2$DateTime<-paste(powerdata2$Date, powerdata2$Time)

#Convert date time
powerdata2$DateTime <- as.POSIXct(powerdata2$DateTime)


## Create Plot 3
with(powerdata2, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Saving to file
dev.copy(png, file="Plot3.png", height=480, width=480)
dev.off()


