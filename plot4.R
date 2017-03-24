# Load and filter household power consumption dataset
x <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
x$datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
final <- x[as.Date(x$datetime) %in% dates,]

png("plot4.png", width=480, height=480, bg="white")
par(mfrow=c(2, 2))

### Subplot 1 
plot(final$datetime, final$Global_active_power, type="l", xlab="", ylab="Global Active Power")

### Subplot 2
plot(final$datetime, final$Voltage, type="l", xlab="datetime", ylab="Voltage")

### Subplot 3 
plot(final$datetime, final$Sub_metering_1, type = "l", ylim = range(final$Sub_metering_1, final$Sub_metering_2, final$Sub_metering_3), xlab = "", ylab = "Energy sub metering", col = "black")
par(new=T)
plot(final$datetime, final$Sub_metering_2, type = "l", ylim = range(final$Sub_metering_1, final$Sub_metering_2, final$Sub_metering_3), xlab = "", ylab = "" , col = "red", axes = F)
par(new=T)
plot(final$datetime, final$Sub_metering_3, type = "l", ylim = range(final$Sub_metering_1, final$Sub_metering_2, final$Sub_metering_3), xlab = "", ylab = "" , col ="blue" , axes = F)
par(new=F)
legend("topright", legend = c("Sub metering 1","Sub metering 2","Sub metering 3"), col = c("black", "red", "blue"), lty = "solid")

### Subplot 4 
plot(final$datetime, final$Global_reactive_power, type="l", xlab = "datetime")

dev.off()