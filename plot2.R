# Load and filter household power consumption dataset
x <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
x$datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
final <- x[as.Date(x$datetime) %in% dates,]

#png and plot of global active power per day with ylab
png("plot2.png", width=480, height=480, bg="white")
plot(final$datetime, final$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()