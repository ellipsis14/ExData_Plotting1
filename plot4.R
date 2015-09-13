# Plot 4. Data should be stored in the Current Working directory

# Read Data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract needed dataset
data <- data[(data$Date=="2/1/2007" | data$Date=="2/2/2007"),]

# Combining Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%m/%d/%Y %H:%M:%S")

# Open png device
png("plot4.png", width=480, height=480)

# Plot the graph
par(mfrow=c(2, 2))
plot(data$DateTime, data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(data$DateTime, data$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_Power")
# Turn off device
dev.off()
# To inform that file has been saved to which location on the device
cat("Plot4.png is saved to", getwd())