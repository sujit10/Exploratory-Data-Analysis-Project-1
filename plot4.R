## read data
powerdata <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings ="?", colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

## subset data based on dates
library(lubridate)
powerdata$Date <- dmy(powerdata$Date)
lbdate <- dmy("01-02-2007")
ubdate <- dmy("03-02-2007")
powerdatareq <- subset(powerdata, powerdata$Date >=lbdate)
powerdatareq <- subset(powerdatareq, powerdatareq$Date <ubdate)

## create new variable that contains date and time in the dmy_hms format
datetime <- paste(powerdatareq$Date, powerdatareq$Time, sep=" ")
datetime <-ymd_hms(datetime)

## open png graphics device and set size of image
png(filename = "plot4.png", width = 480, height = 480, units = "px")

## include 4 charts in the graphic
par(mfrow = c(2,2))

## chart 1
plot(datetime,powerdatareq$Global_active_power, type = "l", ylab = "Global Active Power", xlab ="")

## chart 2
plot(datetime,powerdatareq$Voltage, type = "l", ylab = "Voltage")

## chart 3
plot(datetime,powerdatareq$Sub_metering_1, type = "l", ylab = "Energy Sub Metering", xlab ="")
lines(datetime,powerdatareq$Sub_metering_2, col = "Red")
lines(datetime,powerdatareq$Sub_metering_3, col = "Blue")

## chart 4
plot(datetime,powerdatareq$Global_reactive_power, type = "l", ylab="Global_reactive_power")

## close graphics device
dev.off()