x <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

x$DateTime <- as.POSIXct(paste(x$Date, x$Time), format = "%d/%m/%Y %H:%M:%S")

x$Date <- as.Date(x$Date, format = "%d/%m/%Y")

subset_dates <- subset(x, x$Date == c("2007-02-01", "2007-02-02"))

png("plot2.png", width = 480, height = 480, units = "px")

plot(subset_dates$DateTime, subset_dates$Global_active_power, type = "l", xlab = "",xaxt = "n", 
     ylab = "Global Active Power")

# Add new custom ticks and labels to the x-axis
new_ticks <- seq(as.POSIXct("2007-02-01 00:00:00"), by = "24 hours", length.out = 3)
new_labels <- c("Thu", "Fri", "Sat")

# Add the new ticks and labels to the existing plot
axis(1, at = new_ticks, labels = new_labels, cex.axis = 0.8, col.axis = "black", las = 1)
dev.off()
