# R Code for plot1.png

dataset <- read.table(file = "./household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE, stringsAsFactors = FALSE)
dataset_df <- tbl_df(dataset)
library(dplyr)
dataset <- filter(dataset_df, Date == "1/2/2007" | Date ==  "2/2/2007")
hist(dataset$Global_active_power, xlab = "Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")
dev.copy(png, file = "./plot1.png")
dev.off()
