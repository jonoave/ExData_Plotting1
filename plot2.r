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
gap2 <- subData$Global_active_power
# create new data frame for plot 2
plot2Data <- data.frame(convertDateTime, gap2, days)
# sub only data for Thursday, Friday, Saturday
subPlot2Data <- plot2Data[plot2Data$days %in% c("Thursday","Friday", "Saturday"),]
# plot 2
png("plot2.png")
plot(subPlot2Data$convertDateTime, subPlot2Data$gap2, type ="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()