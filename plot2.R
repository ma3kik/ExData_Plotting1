# The data file is assumed to be stored in the current directory.
consumption = read.table("household_power_consumption.txt", sep=";", header=TRUE)
consumption = consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007", ]

# convert the date and time columns into a POSIX format.
strDateTime = paste(consumption$Date, consumption$Time)
dateTimePosix = strptime(strDateTime, "%d/%m/%Y %H:%M:%S")

# y-values and the label.
global_active_power = as.numeric(as.character(consumption$Global_active_power))
ylabel = "Global Active Power (kilowatts)"

# open a PNG device at the current directory.
png(file="plot2.png", width=480, height=480)

# create a plot and draw it onto the device.
plot(dateTimePosix, global_active_power, type="l", xlab=NA, ylab=ylabel)

# close the PNG device.
dev.off()
