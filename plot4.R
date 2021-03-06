# Load the data, convert the dates
pwr <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
pwr <-pwr[pwr$Date == "1/2/2007" | pwr$Date == "2/2/2007",]
pwr$Time <- paste(pwr$Date , pwr$Time)
pwr$Time <- strptime(pwr$Time, format = "%d/%m/%Y %H:%M:%S")
pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")

Sys.setlocale("LC_TIME", "C") # Make sure the correct local is used (for days)
par(mfrow = c(2,2))
png("plot4.png")
with(pwr, {
  plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(Time, Voltage, xlab = "datetime", type = "l")
  plot(Time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(Time, Sub_metering_2, type = "l", col = "red")
  lines(Time, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8, box.lty = 0)  
  plot(Time, Global_reactive_power, type = "l", xlab = "dateime")
})
dev.off()

