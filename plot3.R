# R Code for plot3.png

dataset <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
library(lubridate)
dataset <- tbl_df(dataset)
dataset <- dataset %>% 
filter(Date == "1/2/2007" | Date == "2/2/2007")
time <- strptime(dataset$Time, format = "%H:%M:%S")
m_date <- strptime(dataset$Date, format = "%d/%m/%Y")
top_time <- with(dataset, dmy(Date) + hms(Time))
plot(top_time, dataset$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(top_time, dataset$Sub_metering_3, col = "blue", type = "l")
points(top_time, dataset$Sub_metering_2, col = "red", type = "l")
points(top_time, dataset$Sub_metering_1, type = "l")
legend("topright", pch = c("_","_","_"), col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, "./plot3.png")
dev.off()
