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
png(filename = "plot2.png", width = 480, height = 480, units = "px")

## create chart
plot(datetime,powerdatareq$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")

## close graphics device
dev.off()