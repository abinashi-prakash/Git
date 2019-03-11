# Read the file
power_consumption<-read.table("household_power_consumption.txt",header = TRUE, sep= ";", na.strings = "?")


#Convert Date
power_consumption$Date <- as.Date(powerdata$Date, "%d/%m/%Y")

#Select the data in the date range
powerdata2 <- subset(power_consumption,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# Combine Date and Time in a single variable
powerdata$DateTime<-paste(powerdata$Date, powerdata2$Time)

#Convert date time
powerdata2$DateTime <- as.POSIXct(powerdata2$DateTime)

## Remove Date and Time column
powerdata2 <- powerdata2[ ,!(names(powerdata2) %in% c("Date","Time"))]

## Create the histogram
hist(powerdata2$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## Save file and close device
dev.copy(png,"Plot1.png", width=480, height=480)
dev.off()
