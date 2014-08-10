#--Assignment 1, Plot 2

data <- read.csv.sql("./household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

Sys.setlocale("LC_TIME", "English")
plot2 <- plot(data$Date, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()