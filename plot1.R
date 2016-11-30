############################################
## Course: Exploratory Data Analytics
## Week 1
## Peer Graded Assignment
## Plot 1:
############################################

# Read in file (be sure to set working directory before call)
rawdata <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
# Convert to date for analysis
rawdata$DateFormat <- as.Date(rawdata$Date, "%d/%m/%Y")
# Extract the relevant dates Feb 1, 2007 and Feb 2, 2007
datesInScope <- c(as.Date("2007-02-01", "%Y-%m-%d"), as.Date("2007-02-02", "%Y-%m-%d"))
dataforplots <- rawdata[which(rawdata$DateFormat %in% datesInScope),]

par(mfrow = c(1,1))

hist(as.numeric(dataforplots$Global_active_power)/500, # Needed to be scaled to fit desired output
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

