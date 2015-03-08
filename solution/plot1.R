library(dplyr)

data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?")
data <- filter(data, as.Date(Date, format = "%d/%m/%Y") == as.Date('2007-02-02') 
               | as.Date(Date, format = "%d/%m/%Y") == as.Date('2007-02-01'))

data$Global_active_power <- as.numeric(data$Global_active_power)

png("plot1.png")
plot(hist(data$Global_active_power), 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

dev.off()