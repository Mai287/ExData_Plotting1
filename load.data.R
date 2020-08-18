library(data.table)
library(dplyr)
library(lubridate)
data <- fread("household_power_consumption.txt",sep = ";",header = TRUE)
data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data$Time <- paste(data$Date,data$Time)
data$Date <- as.Date(data$Date,"%d/%m/%Y")
x<- data$Time
x<- strptime(x, format="%d/%m/%Y %H:%M:%S")
data$Time <-data.frame(x)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
head(data)


