# Read the Data
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
datetime <- as.POSIXct(strptime(paste(df$Date, df$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))
df <- cbind(df, datetime)
reqData <- subset(df, df$datetime > as.POSIXct("2007-02-01") & df$datetime < as.POSIXct("2007-02-03"))

# Plot the figure
png("plot2.png", width = 480, height = 480)
with(reqData, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", main = ""))
dev.off()
