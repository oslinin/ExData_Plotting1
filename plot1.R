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
par(mfrow=c(1,1))
hist(x$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.copy(png, "plot1.png")

dev.off()