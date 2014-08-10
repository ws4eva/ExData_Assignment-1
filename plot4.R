#--Assignment 1, Plot 4

data <- read.csv.sql("./household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2), mar = c(4,4,2,2), oma = c(1,1,1,1))

Sys.setlocale("LC_TIME", "English")

plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

plot(data$Date, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.7, bty = "n", y.intersp = 0.5)

plot(data$Date, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$Date, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()



