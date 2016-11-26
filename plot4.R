setwd("C:/Users/Christian/datasciencecoursera/data_exploration")
library('dplyr')
library('datasets')
household_power_consumption <- read.csv("C:/Users/Christian/datasciencecoursera/data_exploration/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
Global_active_power_all <- transmute(household_power_consumption,Date1 = as.Date(Date, "%d/%m/%Y" ), Date = Date, Time = Time, Global_active_power = as.numeric(Global_active_power), Global_reactive_power = as.numeric(Global_reactive_power), Voltage = as.numeric(Voltage), Sub_metering_1 = as.numeric(Sub_metering_1), Sub_metering_2 = as.numeric(Sub_metering_2), Sub_metering_3 = as.numeric(Sub_metering_3))
Global_active_power_all <- filter(Global_active_power_all, Date1 >= "2007-02-01" & Date1 <= "2007-02-02")

par(mfrow = c(2,2))
with(Global_active_power_all, plot(type = "l", as.POSIXct(strptime(paste(Global_active_power_all$Date, Global_active_power_all$Time),"%d/%m/%Y %H:%M:%S")), Global_active_power, ylab = 'Global Active Power', xlab = '', col = 'black'))
with(Global_active_power_all, plot(type = "l", as.POSIXct(strptime(paste(Global_active_power_all$Date, Global_active_power_all$Time),"%d/%m/%Y %H:%M:%S")), Voltage, ylab = 'Voltage', xlab = 'datetime', col = 'black'))

with(Global_active_power_all, plot(type = "l", as.POSIXct(strptime(paste(Global_active_power_all$Date, Global_active_power_all$Time),"%d/%m/%Y %H:%M:%S")), Sub_metering_1, ylab = 'Energy sub metering', xlab = '', col = 'black'))
lines(as.POSIXct(strptime(paste(Global_active_power_all$Date, Global_active_power_all$Time),"%d/%m/%Y %H:%M:%S")), Global_active_power_all$Sub_metering_2, col ='red')
lines(as.POSIXct(strptime(paste(Global_active_power_all$Date, Global_active_power_all$Time),"%d/%m/%Y %H:%M:%S")), Global_active_power_all$Sub_metering_3, col ='blue')
legend("topright", pch = '-', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))

with(Global_active_power_all, plot(type = "l", as.POSIXct(strptime(paste(Global_active_power_all$Date, Global_active_power_all$Time),"%d/%m/%Y %H:%M:%S")), Global_reactive_power, ylab = 'Global_reactive_power', xlab = 'datetime', col = 'black'))
 
dev.copy(png, file = 'plot4.png')
dev.off()