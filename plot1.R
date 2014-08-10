#--Assignment 1, Plot 1

# To download zip file and unzip.
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile = "./ Electric power consumption.zip")
temp <- "./Electric power consumption.zip"


# To draw histogram of data with dates 01/02/2007 & 02/02/2007
data <- read.csv.sql("./household_power_consumption.txt", sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

hist <- hist(data$Global_active_power, breaks = 12, xlim = range(0:6), ylim = range(0:1200))
plot1 <- plot(hist, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()