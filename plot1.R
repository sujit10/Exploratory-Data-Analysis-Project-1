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
png(filename = "plot1.png", width = 480, height = 480, units = "px")

## create histogram
hist(powerdatareq$Global_active_power, col = "Red", xlab ="Global Active Power (kilowatts)", main = "Global Active Power")

## close graphics device
dev.off()