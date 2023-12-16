x <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

x$DateTime <- as.POSIXct(paste(x$Date, x$Time), format = "%d/%m/%Y %H:%M:%S")

x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

subset_dates <- subset(x, x$Date == c("2007-02-01", "2007-02-02"))

par(mfrow=c(2,2))

png("plot4.png", width = 480, height = 480, units = "px")

# Top left plot:
plot(subset_dates$DateTime, subset_dates$Global_active_power, type = "l", xlab = "",xaxt = "n", 
     ylab = "Global Active Power")

new_ticks <- seq(as.POSIXct("2007-02-01 00:00:00"), by = "24 hours", length.out = 3)
new_labels <- c("Thu", "Fri", "Sat")
axis(1, at = new_ticks, labels = new_labels, cex.axis = 0.8, col.axis = "black", las = 1)

# Top right plot:

plot(subset_dates$DateTime, subset_dates$Voltage, type = "l", xlab = "datetime",xaxt = "n", 
     ylab = "Voltage", col = "black")
axis(1, at = new_ticks, labels = new_labels, cex.axis = 0.8, col.axis = "black", las = 1)

# Bottom left plot: 

plot(subset_dates$DateTime, subset_dates$Sub_metering_1, type = "l", xlab = "",xaxt = "n", 
     ylab = "Energy sub metering", col = "black")

axis(1, at = new_ticks, labels = new_labels, cex.axis = 0.8, col.axis = "black", las = 1)
lines(subset_dates$DateTime, subset_dates$Sub_metering_2, col = "blue")
lines(subset_dates$DateTime, subset_dates$Sub_metering_3, col = "red")
legend("topright", legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"),
       col = c("black", "blue", "red"), lty = 1, lwd = 2)


# Bottom right plot: 

plot(subset_dates$DateTime, subset_dates$Global_reactive_power, type = "l", xlab = "datetime", xaxt = "n", 
     ylab = "Global_reactive_power", col = "black")
axis(1, at = new_ticks, labels = new_labels, cex.axis = 0.8, col.axis = "black", las = 1)
dev.off()
