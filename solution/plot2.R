library(dplyr)

data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

data <- filter(data, Date == as.Date('2007-02-02') 
               |     Date == as.Date('2007-02-01'))

data$Global_active_power <- as.numeric(data$Global_active_power)

data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

png("plot2.png")

plot(x = data$datetime,
     y = data$Global_active_power,
     type = "l",
     xlab = NA,
     ylab = "Global Active Power (kilowatts)",
     )

dev.off()