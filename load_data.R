
# Load the "household_power_consumption.txt" data into a data.frame.
# Download the data file if necessary.
# Transform the Date and Time columns into a datetime column (POSIXlt class) and a day column (Date class).
# Subset the data to just the data points from Feb 1st and 2nd, 2007.
load_data = function() {
  if(!file.exists("household_power_consumption.txt")) {
    download_data()
  }
  
  # Estimate the data size in ram based on the size of a 1000 row dataframe and the total number of rows.
  temp.df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", nrows=1000)
  total.rows <- 2075259
  estimated.memory.size <- object.size(temp.df) * (total.rows / 1000)
  print(paste("Estimated data size in memory:", floor(estimated.memory.size / 1024), "KB"))
  
  # Load the data
  data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
  # The date and time in a single column as POSIXlt class
  data$datetime <- as.POSIXlt(paste(as.character(data$Date), as.character(data$Time)), format="%d/%m/%Y %H:%M:%S")
  # The date in a single column as Date class
  data$day <- as.Date(strptime(as.character(data$Date), "%d/%m/%Y"))
  # Subset the data to only 2007-02-01 and 2007-02-02
  data <- data[data$day < "2007-02-03" & data$day >= "2007-02-01", ]
  data
}

# Download and Extract the household_power_consumption.txt data.
download_data = function() {
    url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    zipfile = "household_power_consumption.zip"
    download.file(url, zipfile, method="curl")
    unzip(zipfile) # unzip creates "household_power_consumption.txt"
    file.remove(zipfile) # leave only the text file
}

