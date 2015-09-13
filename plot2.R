
# Plot 2. Data should be stored in the Current Working directory

# Read Data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract needed dataset
data <- data[(data$Date=="2/1/2007" | data$Date=="2/2/2007"),]

# Combining Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%m/%d/%Y %H:%M:%S")

# Open png device
png("plot2.png", width=480, height=480)

# scatter plot joining the line
plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")

# Turn off device
dev.off()
# To inform that file has been saved to which location on the device
cat("Plot2.png is saved to", getwd())
