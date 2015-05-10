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
par(mfcol=c(2,2))

plot(x$Time, x$Global_active_power, type='l', xlab="",ylab="Global Active Power (kilowatts)")

plot(x$Time, x$Sub_metering_1, ylab="Energy sub metering", type='l',xlab="")
lines(x$Time, x$Sub_metering_2, col="red")
lines(x$Time, x$Sub_metering_3, col="blue")
legend("topright", names(x)[7:9],lty=1, col=c("black","red","blue"),bty='n')

plot(x$Time, x$Voltage, type='l', xlab="datetime",
     ylab="Voltage")

with(x, plot(Time, Global_reactive_power, type='l',xlab="datetime"))

dev.copy(png, "plot4.png", width=800, height=500)

dev.off()