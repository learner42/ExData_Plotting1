# Load the data, convert the dates
pwr <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
pwr <-pwr[pwr$Date == "1/2/2007" | pwr$Date == "2/2/2007",]
pwr$Time <- paste(pwr$Date , pwr$Time)
pwr$Time <- strptime(pwr$Time, format = "%d/%m/%Y %H:%M:%S")
pwr$Date <- as.Date(pwr$Date, format = "%d/%m/%Y")
pwr$Global_active_power <- as.numeric(as.character(pwr$Global_active_power))

Sys.setlocale("LC_TIME", "C") # Make sure the correct local is used (for days)
with(pwr, plot(Time, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(png, "plot2.png")
dev.off()

