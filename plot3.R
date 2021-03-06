data <- read.table("household_power_consumption.txt", header = T, sep = ";")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
consumption <- data[(data$Date == "2007-02-01")|(data$Date == "2007-02-02"),]
consumption$Global_active_power <- as.numeric(as.character(consumption$Global_active_power))
consumption <- transform(consumption, fulltime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
consumption$Sub_metering_1 <- as.numeric(as.character(consumption$Sub_metering_1))
consumption$Sub_metering_2 <- as.numeric(as.character(consumption$Sub_metering_2))
consumption$Sub_metering_3 <- as.numeric(as.character(consumption$Sub_metering_3))

png("plot3.png", width=480, height=480)
plot(consumption$fulltime, consumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(consumption$fulltime, consumption$Sub_metering_2, col ="red")
lines(consumption$fulltime, consumption$Sub_metering_3, col ="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1, 1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"))
dev.off()