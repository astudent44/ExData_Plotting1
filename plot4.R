#####
#Exploratory Data Analysis Project 1
# Plot 4: Combined Plots 2, 3, voltage over time, and global reactive power over time
#####

#####
# Step 1: Read input data
#####
inputData <- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", na.strings = "?")

#####
# Step 2: Subset input data
#####
inputData$Date <- as.Date(inputData$Date, format = "%d/%m/%Y")
subData <- subset(inputData, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
datetime <- as.POSIXct(paste(subData$Date, subData$Time))

#####
# Step 3: Plot data and save plot as a PNG file
#####
png("plot4.png", height = 480, width = 480)
par(mfrow = c(2, 2))

plot(datetime, as.numeric(subData$Global_active_power), type = "l", 
     xlab = "", ylab = "Global Active Power")

plot(datetime, as.numeric(subData$Voltage), type = "l", 
     xlab = "datetime", ylab = "Voltage")

plot(datetime, as.numeric(subData$Sub_metering_1), type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(datetime, as.numeric(subData$Sub_metering_2), type = "l", col = "Red")
lines(datetime, as.numeric(subData$Sub_metering_3), type = "l", col = "Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2.5, bty = "n", col = c("Black", "Red", "Blue"))

plot(datetime, as.numeric(subData$Global_reactive_power), type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()