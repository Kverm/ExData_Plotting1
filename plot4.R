# read dataset
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",
                   col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                   skip = 66637, nrows = 2880)

# create datetime column
data["datetime"] <- paste(data$Date, data$Time)
data["datetime"] <- as.POSIXct(strptime(data[,"datetime"], "%d/%m/%Y %H:%M:%S"))
data <- data[,-(1:2)]

# open png device
png(file = "plot4.png")

# create 2x2 grid
par(mfcol = c(2, 2))

# plot 1
with(data, plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)"))
with(data, lines(datetime, Global_active_power))

# plot 2
with(data, plot(datetime, Sub_metering_1, type = "n", ylab = "Energy sub metering"))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 2, col = c("black", "red", "blue"), legend = names(data)[5:7], bty = "n", cex = 0.75)

# plot 3
with(data, plot(datetime, Voltage, type = "n", ylab = "Voltage"))
with(data, lines(datetime, Voltage))

# plot 4
with(data, plot(datetime, Global_reactive_power, type = "n"))
with(data, lines(datetime, Global_reactive_power))

# close device
dev.off()