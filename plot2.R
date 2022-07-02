
library(data.table)
library(tidyverse)
library(lubridate)
library(dplyr)
library(readr)
library(magrittr)






data <- read.csv("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "?") %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007")) 

plotdata <- data %>% 
  select(Date, Time, Global_active_power) %>% 
  mutate(DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))


png(filename = "plot2.png", width = 480, height = 480 )
plot(plotdata$DateTime, plotdata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()


