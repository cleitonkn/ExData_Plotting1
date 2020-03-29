# R Code for plot4.png

dataset <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
library(lubridate)
dataset <- tbl_df(dataset)
dataset <- dataset %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007")
time <- strptime(dataset$Time, format = "%H:%M:%S")
m_date <- strptime(dataset$Date, format = "%d/%m/%Y")
top_time <- with(dataset, dmy(Date) + hms(Time))

par(mfrow = c(2,2))

plot(top_time, dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(top_time, dataset$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(top_time, dataset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(top_time, dataset$Sub_metering_3, col = "blue", type = "l")
points(top_time, dataset$Sub_metering_2, col = "red", type = "l")
points(top_time, dataset$Sub_metering_1, type = "l")
legend("top", pch = c("_","_","_"), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(top_time, dataset$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, "./plot4.png")
dev.off()
