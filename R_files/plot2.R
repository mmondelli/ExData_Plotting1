# Read data
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=';', na.strings="?")
# Adjusting date field
data$Date <- as.Date(data$Date, '%d/%m/%Y')
# Filtering dates
data_filtered <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]
dateTime <- strptime(paste(data_filtered$Date, data_filtered$Time, sep=" "), "%Y-%m-%d %X")
data_filtered <- cbind(data_filtered, dateTime)
# Plotting
png(filename="plot2.png")
with(data_filtered, plot(dateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(data_filtered, lines(dateTime, Global_active_power))
dev.off()
