pwr <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
pwr <-pwr[pwr$Date == "1/2/2007" | pwr$Date == "2/2/2007",]
pwr$Time <- paste(pwr$Date , pwr$Time)
pwr$Time <- strptime(pwr$Time, format = "%d/%m/%Y %H:%M:%S")
pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")
png("plot1.png")
hist(pwr$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

