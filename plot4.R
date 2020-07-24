# Read the Data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
datetime <- as.POSIXct(strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
df <- cbind(df, datetime)
reqData <- subset(df, df$datetime > as.POSIXct("2007-02-01") & df$datetime < as.POSIXct("2007-02-03"))

#Plot the Figure
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(reqData, {
        plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = "")
        plot(datetime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")
        plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        lines(datetime, Sub_metering_2, type = "l", col = "red")
        lines(datetime, Sub_metering_3, type = "l", col = "blue")
        legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", col = c("black", "blue", "red"), lty = 1)
        plot(datetime, Global_reactive_power, type = "l",  xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()
