library(dplyr)

data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- filter(data, Date == as.Date('2007-02-02') 
               |     Date == as.Date('2007-02-01'))

data$Global_active_power <- as.numeric(data$Global_active_power)

data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png")

plot(y = data$Sub_metering_1,
     x = data$datetime,
     type = "l",
     xlab = NA,
     ylab = "Energy sub metering",
     col = "black"
)
lines(x = data$datetime, y = data$Sub_metering_2, col = "red")
lines(x = data$datetime, y = data$Sub_metering_3, col = "blue")
legend("topright", legend = colnames(data)[7:9], col = c("black", "red", "blue"), lty = 1)

dev.off()