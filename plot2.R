#####
#Exploratory Data Analysis Project 1
# Plot 2: Plot of Global Active Power over Time

# x variable: Time
# y variable: Global active power (household global minute-averaged active power)
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
png("plot2.png", height = 480, width = 480)
plot(datetime, as.numeric(subData$Global_active_power), type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()