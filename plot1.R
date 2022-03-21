#####
#Exploratory Data Analysis Project 1
# Plot 1: Histogram of Global Active Power

# x variable: Global active power (household global minute-averaged active power)
# y variable: Frequency (number of observations) of each bin
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

#####
# Step 3: Plot data and save plot as a PNG file
#####
png("plot1.png", height = 480, width = 480)
hist(as.numeric(subData$Global_active_power), main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")
dev.off()