# Load and filter household power consumption dataset
x <- read.table("./household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
x$datetime <- strptime(paste(x$Date, x$Time), "%d/%m/%Y %H:%M:%S")
dates <- c(as.Date("2007-02-01"), as.Date("2007-02-02"))
final <- x[as.Date(x$datetime) %in% dates,]
  
png("plot1.png", width=480, height=480, bg= "white")
# Red histogram of global active power with x-label and title,
hist(final$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()