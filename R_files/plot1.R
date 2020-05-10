setwd('~/Dropbox/repositories/ExData_Plotting1/')

# Read data
data <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", sep=';', na.strings="?")
# Adjusting date field
data$Date <- as.Date(data$Date, '%d/%m/%Y')
# Filtering dates
data_filtered <- data[data$Date>=as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"), ]
# Plotting
png(filename="plot1.png",width=480,height=480)
hist(data_filtered$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()

