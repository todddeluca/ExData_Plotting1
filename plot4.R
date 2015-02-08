
# Load the data
source("load_data.R")
data <- load_data()

# Plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(data$datetime, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")
plot(data$datetime, data$Voltage, xlab="datetime", ylab="Voltage", type="l")
plot(data$datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=c(1, 1, 1), col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$datetime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()
