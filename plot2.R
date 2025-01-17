
library(data.table)
library(tidyverse)
library(lubridate)
library(dplyr)
library(readr)
library(magrittr)



########################################################################################################################################
###############################################          READ DATA          ############################################################
########################################################################################################################################


data <- read.csv("household_power_consumption.txt", header = TRUE,  sep = ";", na.strings = "?") %>% 
           filter(Date %in% c("1/2/2007", "2/2/2007")) %>% 
           mutate(DateTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S") )


########################################################################################################################################
###############################################    CREATE PNG & PLOT DATA   ############################################################
########################################################################################################################################


png(filename = "plot2.png", width = 480, height = 480 )
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
dev.off()


