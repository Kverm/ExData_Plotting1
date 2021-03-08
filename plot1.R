# read dataset
data <- read.table("household_power_consumption.txt", sep = ";", na.strings = "?",
                  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power",
                                "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                  skip = 66637, nrows = 2880)

# open png device
png(file = "plot1.png")

# create histogram
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

# close device
dev.off()