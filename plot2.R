#Reading the entire file. 
power_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";" , na.strings = "?")
#Converting the Date column from factor to Date.
power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")
#Filtering the data of only the rows which have date as '01-Feb-2007' and  '02-Feb-2007'
new_data <- filter(power_data, Date == "2007-02-01"|Date == "2007-02-02" )

#plot and save graph
png(filename="plot2.png", width=480, height=480, units="px")
plot(new_data$Global_active_power, type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), labels=c("Thu", "Fri", "Sat"))
dev.off()