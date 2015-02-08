
# Load the data
source("load_data.R")
data <- load_data()

# Plot 1
png(filename="plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
