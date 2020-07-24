# Read the Data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
datetime <- as.POSIXct(strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
df <- cbind(df, datetime)
reqData <- subset(df, df$datetime > as.POSIXct("2007-02-01") & df$datetime < as.POSIXct("2007-02-03"))

# Plot the Figure
png("plot3.png", width = 480, height = 480)
with(reqData, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(reqData$datetime, reqData$Sub_metering_2, type = "l", col = "red") 
lines(reqData$datetime, reqData$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "blue", "red"), lty = 1)
dev.off()