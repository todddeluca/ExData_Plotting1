
# Load the data
source("load_data.R")
data <- load_data()

# Plot 2
png(filename="plot2.png", width=480, height=480)
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

