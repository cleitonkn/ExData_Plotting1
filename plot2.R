# R Code for plot2.png

dataset <- read.table("./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
library(dplyr)
library(lubridate)
dataset <- tbl_df(dataset)
dataset <- dataset %>% 
  filter(Date == "1/2/2007" | Date == "2/2/2007")
time <- strptime(dataset$Time, format = "%H:%M:%S")
m_date <- strptime(dataset$Date, format = "%d/%m/%Y")
top_time <- with(dataset, dmy(Date) + hms(Time))
plot(top_time, dataset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.copy(png, "./plot2.png")
dev.off()
