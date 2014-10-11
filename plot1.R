# The data file is assumed to be stored in the current directory.
consumption = read.table("household_power_consumption.txt", sep=";", header=TRUE)
consumption = consumption[consumption$Date == "1/2/2007" | consumption$Date == "2/2/2007", ]

# open a PNG device at the current directory.
png(file="plot1.png", width=480, height=480)

# x-values and the label.
global_active_power = as.numeric(as.character(consumption$Global_active_power))
xlabel = "Global Active Power (kilowatts)"

# create a histogram and draw it onto the device.
hist(global_active_power, xlab=xlabel, col="red", main="Global Active Power")

# close the PNG device.
dev.off()
