# Plot 1. Data should be stored in the Current Working directory

# Read Data
data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

# Extract needed dataset
data <- data[(data$Date=="2/1/2007" | data$Date=="2/2/2007"),]

# Combining Date and Time
data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%m/%d/%Y %H:%M:%S")

# Open png device
png("plot1.png", width=480, height=480)

# Plotting the graph
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# Turn off device
dev.off()
# To inform that file has been saved to which location on the device
cat("Plot1.png has been saved in", getwd())