#--Assignment 1, Plot 3

data <- read.csv.sql("./household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")

#par(mfcol = c(1,1), mar = c(4,4,2,2), oma = c(1,1,1,1))

plot3 <-  plot(data$Date, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2, col="red")
lines(data$Date, data$Sub_metering_3, col="blue")
legend("topright",col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, cex = 0.7)

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
