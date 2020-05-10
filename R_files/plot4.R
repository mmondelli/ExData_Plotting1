# Read data
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=';', na.strings="?")
# Adjusting date field
data$Date <- as.Date(data$Date, '%d/%m/%Y')
# Filtering dates
data_filtered <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]
dateTime <- strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%Y-%m-%d %X")
data_filtered <- cbind(data_filtered, dateTime)
# Plotting
png(filename="plot4.png")
# Set par (2 rows, 2 columns)
par(mfcol=c(2,2))

# 1
with(data_filtered, plot(dateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power"))
with(data_filtered, lines(dateTime, Global_active_power))

# 2
with(data_filtered, plot(dateTime, data_filtered$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(data_filtered, lines(dateTime, Sub_metering_1))
with(data_filtered, lines(dateTime, Sub_metering_2, col="red"))
with(data_filtered, lines(dateTime, Sub_metering_3, col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), 
       lty=c(1,1,1))

# 3
with(data_filtered, plot(dateTime, Voltage, type="n", xlab="datetime"))
with(data_filtered, lines(dateTime, Voltage))

# 4
with(data_filtered, plot(dateTime, Global_reactive_power, type="n", xlab="datetime"))
with(data_filtered, lines(dateTime, Global_reactive_power))

dev.off()
