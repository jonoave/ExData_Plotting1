# read file
dataFile <- "household_power_consumption.txt"
# handle missing values as "?" after checking data
data <- read.csv("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
# subset only the data between 1/2/2007 to 2/2/2007
subData <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
# combine data and time columns with paste
rawDateTime <- paste(subData$Date, subData$Time)
# convert date, time into as date values 
dateTime <- strptime(rawDateTime, "%d/%m/%Y %H:%M:%S")
days <- weekdays(dateTime) # create new column of days
# add column convertDateTime to data
data4 <- cbind(subData, dateTime,days)
subData4 <- data4[data4$days %in% c("Thursday","Friday", "Saturday"),]
head(subData4)
class(subData4)

# prepare for multi plots in counter clockwise
png("plot4.png")
par(mfcol= c(2,2)) # initiate multi plot 
# graph1 (top left)
plot(subData4$dateTime, subData4$Global_active_power, type ="l", xlab = "", ylab = "Global Active Power")
head(subData4$dateTime)
head(subData4$Global_active_power)
# graph2 (bottom left)
plot(subData4$dateTime, subData4$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subData4$dateTime, subData4$Sub_metering_2, col = "red") # lines() will plot in the same graph
lines(subData4$dateTime, subData4$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))# graph3 (top right)
# graph3 (top right)
plot(subData4$dateTime, subData4$Voltage, type = "l",xlab = "datetime", ylab = "voltage")
# graph4 (bottom right)
plot(subData4$dateTime, subData4$Global_reactive_power, type = "l",xlab = "datetime", ylab = "Global_reactive_power")
dev.off()

