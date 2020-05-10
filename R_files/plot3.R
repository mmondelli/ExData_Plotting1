# Read data
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=';', na.strings="?")
# Adjusting date field
data$Date <- as.Date(data$Date, '%d/%m/%Y')
# Filtering dates
data_filtered <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]
dateTime <- strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%Y-%m-%d %X")
data_filtered <- cbind(data_filtered, dateTime)
# Plotting
png(filename="plot3.png",width=480,height=480)
with(data_filtered, plot(dateTime, data_filtered$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(data_filtered, lines(dateTime, Sub_metering_1))
with(data_filtered, lines(dateTime, Sub_metering_2, col="red"))
with(data_filtered, lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), 
       lty=c(1,1,1))
dev.off()
