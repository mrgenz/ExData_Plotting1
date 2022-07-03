
library(data.table)
library(tidyverse)
library(lubridate)
library(dplyr)
library(readr)
library(magrittr)



data <- read.csv("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "?") %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007")) %>% 
  mutate(DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))




png(filename = "plot3.png", width = 480, height = 480 )

plot(data$DateTime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, type = "l", col = "red")
lines(data$DateTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1))

dev.off()




