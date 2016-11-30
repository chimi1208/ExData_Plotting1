
############################################
## Course: Exploratory Data Analytics
## Week 1
## Peer Graded Assignment
## Plot 4:
############################################


# Read in file (be sure to set working directory before call)
rawdata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
# Convert to date for analysis
rawdata$DateFormat <- as.Date(rawdata$Date, "%d/%m/%Y")
# Extract the relevant dates Feb 1, 2007 and Feb 2, 2007
datesInScope <- c(as.Date("2007-02-01", "%Y-%m-%d"), as.Date("2007-02-02", "%Y-%m-%d"))
dataforplots <- rawdata[which(rawdata$DateFormat %in% datesInScope),]

# Add dateTimeformat
dataforplots$DateTimeFormat <- strptime(paste(dataforplots$Date,dataforplots$Time),format = "%d/%m/%Y %H:%M:%S")
dataforplots$TimeFormat <- strptime(dataforplots$Time,format = "%H:%M:%S") # Note that the day is today

# Adjust data to numeric
dataforplots$Sub_metering_1 <- as.numeric(dataforplots$Sub_metering_1)
dataforplots$Sub_metering_2 <- as.numeric(dataforplots$Sub_metering_2)
dataforplots$Sub_metering_3 <- as.numeric(dataforplots$Sub_metering_3)

# Create 4 slots for plots
par(mfrow = c(2,2))


# Create plot 1 - Top left
plot(dataforplots$DateTimeFormat,as.numeric(dataforplots$Global_active_power)/500, type = "l", 
     ylab = "Global Active Power", 
     xlab = "")

# Create plot 2 - Top right
plot(dataforplots$DateTimeFormat,as.numeric(dataforplots$Voltage)/8.5, type = "l", ylab = "Voltage", xlab = "datetime")

# Create plot (3) - Bottom left
plot(dataforplots$DateTimeFormat,(dataforplots$Sub_metering_1-2), 
     type = "l", ylab = "Energy sub metering", xlab ="", yaxt ="n")
lines(dataforplots$DateTimeFormat,(dataforplots$Sub_metering_2-2)/4, col = "red")
lines(dataforplots$DateTimeFormat,dataforplots$Sub_metering_3, col = "blue")
axis(2, at = seq(0, 30, 10), labels = seq(0, 30, 10), las = 2)
legend("topright", lty = 1, lwd = 1, col= c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Create plot 4 - bottom right
plot(dataforplots$DateTimeFormat,as.numeric(dataforplots$Global_reactive_power)/500, 
     type = "l", ylab = "Global_reactive_power", xlab = "datetime", yaxt = "n")
axis(2, at = seq(0.0, 0.5, 0.1), labels = seq(0.0, 0.5, 0.1), las = 2)