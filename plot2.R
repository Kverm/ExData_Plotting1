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
png(file = "plot2.png")

# create line plot
with(data, plot(datetime, Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)"))
with(data, lines(datetime, Global_active_power))

# close device
dev.off()