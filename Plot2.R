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

## Create Plot 2
plot(powerdata2$Global_active_power~powerdata2$DateTime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Copy Plot in png file
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()

