# The data file is assumed to be stored in the current directory.
consumption = read.table("household_power_consumption.txt", sep=";", header=TRUE)
consumption = consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007", ]

# convert the date and time columns into a POSIX format.
strDateTime = paste(consumption$Date, consumption$Time)
dateTimePosix = strptime(strDateTime, "%d/%m/%Y %H:%M:%S")

# the y-values, the label and the legends
sub_metering_1 = as.numeric(as.character(consumption$Sub_metering_1))
sub_metering_2 = as.numeric(as.character(consumption$Sub_metering_2))
sub_metering_3 = as.numeric(as.character(consumption$Sub_metering_3))
ylabel = "Energy sub metering"
legends =c("sub_metering_1", "sub_metering_2", "sub_metering_3")

# open a PNG device at the current directory.
png(file="plot3.png", width=480, height=480)

# draw a line graph onto the PNG file.
plot(dateTimePosix, sub_metering_1, col="black", type="l", xlab=NA, ylab=ylabel)
lines(dateTimePosix, sub_metering_2, col="red")
lines(dateTimePosix, sub_metering_3, col="blue")
legend("topright", legend=legends, col=c("black", "red", "blue"), lty=1)

# close the device.
dev.off()
