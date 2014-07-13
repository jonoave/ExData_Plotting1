# read file
dataFile <- "household_power_consumption.txt"
# handle missing values as "?" after checking data
data <- read.csv("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
# subset only the data between 1/2/2007 to 2/2/2007
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# combine data and time columns with paste
dateTime <- paste(subData$Date, subData$Time)
# convert date, time into as date values 
convertDateTime <- strptime(dateTime, "%d/%m/%Y %H:%M:%S")
days <- weekdays(convertDateTime) # create new column of days
# get data from columns
sub1 <- subData$Sub_metering_1
sub2 <- subData$Sub_metering_2
sub3 <- subData$Sub_metering_3
# create new data frame for plot 3
plot3Data <- data.frame(convertDateTime, sub1, sub2, sub3, days)
subPlot3Data <- plot3Data[plot3Data$days %in% c("Thursday","Friday", "Saturday"),]
# create plot 3
png("plot3.png")
plot(subPlot3Data$convertDateTime, subPlot3Data$sub1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subPlot3Data$convertDateTime, subPlot3Data$sub2, col = "red") # lines() will plot in the same graph
lines(subPlot3Data$convertDateTime, subPlot3Data$sub3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()