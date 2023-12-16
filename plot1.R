# Calculating a rough estimate of how much data the data will use:   
2075259 * 9 * 8

x <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")
                 

x$Date <- strptime(x$Date, format = "%d/%m/%Y")

subset_dates <- subset(x, x$Date == c("2007-02-01", "2007-02-02"))
str(subset_dates)

png("plot1.png", width = 480, height = 480, units = "px")
hist(subset_dates$Global_active_power, xlab = "Global Active Power (kilowatts)",
     col = "red", main = "Global Active Power")
dev.off()

