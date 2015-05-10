setwd("C:\\Users\\Oleg\\Documents\\coursera\\DataScience\\Exploratory data analysis\\project1")

x=read.table("household_power_consumption.txt", sep=";", 
             header=T, na.strings="?", 
             col.names=c("Date", "Time", "Global_active_power", 
                         "Global_reactive_power", 
                         "Voltage", "Global_intensity", 
                         "Sub_metering_1", "Sub_metering_2", 
                         "Sub_metering_3"), 
             skip=66636, nrows=2880)
x$Date=as.Date(x$Date, "%d/%m/%Y")
x$Time=strptime(paste(x$Date, x$Time), "%F %X")

plot(x$Time, x$Global_active_power, type='l', xlab="",ylab="Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")

dev.off()