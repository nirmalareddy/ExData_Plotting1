#Reading the entire file. 
power_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";" , na.strings = "?")
#Converting the Date column from factor to Date.
power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")
#Filtering the data of only the rows which have date as '01-Feb-2007' and  '02-Feb-2007'
new_data <- filter(power_data, Date == "2007-02-01"|Date == "2007-02-02" )


#plot and save graph
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

#1st 
plot(new_data$Global_active_power, type="l",xaxt="n",xlab="", ylab="Global Active Power")
axis(1, at=c(1, as.integer(nrow(new_data)/2), nrow(new_data)), labels=c("Thu", "Fri", "Sat"))

#2nd
plot(new_data$Voltage, type="l",xaxt="n",xlab="datetime", ylab="Voltage")
axis(1, at=c(1, as.integer(nrow(new_data)/2), nrow(new_data)), labels=c("Thu", "Fri", "Sat"))


#3rd
with(new_data, {
  plot(Sub_metering_1,type="l", xaxt="n", xlab="", ylab="Energy sub metering")
  lines(x=Sub_metering_2, col="red")
  lines(x=Sub_metering_3, col="blue")
})
axis(1, at=c(1, as.integer(nrow(new_data)/2), nrow(new_data)), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), box.lwd = 0,box.col = "transparent", bg="transparent")

#4th
plot(new_data$Global_reactive_power, type="l",xaxt="n",xlab="datetime", ylab="Global_reactive_power")
axis(1, at=c(1, as.integer(nrow(new_data)/2), nrow(new_data)), labels=c("Thu", "Fri", "Sat"))

dev.off()

