
# Load the data
source("load_data.R")
data <- load_data()

# Plot 3
png(filename="plot3.png", width=480, height=480)
plot(data$datetime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, col="red")
lines(data$datetime, data$Sub_metering_3, col="blue")
# add legend with colored "line" symbols
legend("topright", lty=c(1, 1, 1), col=c("black", "blue", "red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

