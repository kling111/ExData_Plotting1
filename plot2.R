data <- read.table("household_power_consumption.txt", header = T, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
consumption <- data[(data$Date == "2007-02-01")|(data$Date == "2007-02-02"),]
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
consumption <- transform(consumption, fulltime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


png("plot2.png", width = 480, height=480)
plot(consumption$fulltime, consumption$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()