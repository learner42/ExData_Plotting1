pwr <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
pwr <-pwr[pwr$Date == "1/2/2007" | pwr$Date == "2/2/2007",]
pwr$Time <- paste(pwr$Date , pwr$Time)
pwr$Time <- strptime(pwr$Time, format = "%d/%m/%Y %H:%M:%S")
pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")

pwr$Global_active_power <- as.numeric(as.character(pwr$Global_active_power))

hist(pwr$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()

