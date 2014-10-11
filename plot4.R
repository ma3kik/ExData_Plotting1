# The data file is assumed to be stored in the current directory.
consumption = read.table("household_power_consumption.txt", sep=";", header=TRUE)
consumption = consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007", ]

# convert the date and time columns into a POSIX format.
strDateTime = paste(consumption$Date, consumption$Time)
dateTimePosix = strptime(strDateTime, "%d/%m/%Y %H:%M:%S")

# open a PNG device at the current directory.
png(file="plot4.png", width=480, height=480)

# create 2 by 2 panes
par(mfrow = c(2, 2))

# (1) Global Active Power
global_active_power = as.numeric(as.character(consumption$Global_active_power))
ylabel = "Global Active Power"
plot(dateTimePosix, global_active_power, type="l", xlab=NA, ylab=ylabel)

# (2) Voltage
voltage = as.numeric(as.character(consumption$Voltage))
plot(dateTimePosix, voltage, type="l", xlab="datetime", ylab="Voltage")

# (3) Energy sub metering
sub_metering_1 = as.numeric(as.character(consumption$Sub_metering_1))
sub_metering_2 = as.numeric(as.character(consumption$Sub_metering_2))
sub_metering_3 = as.numeric(as.character(consumption$Sub_metering_3))
ylabel = "Energy sub metering"
legends =c("sub_metering_1", "sub_metering_2", "sub_metering_3")
plot(dateTimePosix, sub_metering_1, col="black", type="l", xlab=NA, ylab=ylabel)
lines(dateTimePosix, sub_metering_2, col="red")
lines(dateTimePosix, sub_metering_3, col="blue")
legend("topright", legend=legends, col=c("black", "red", "blue"), lty=1, bty="n")

# Global_reactive_power
global_reactive_power = as.numeric(as.character(consumption$Global_reactive_power))
plot(dateTimePosix, global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")


dev.off()
