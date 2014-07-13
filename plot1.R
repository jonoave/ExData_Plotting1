# read file
dataFile <- "household_power_consumption.txt"
# handle missing values as "?" after checking data
data <- read.csv("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Plot 1
png("plot1.png")
hist(subData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
