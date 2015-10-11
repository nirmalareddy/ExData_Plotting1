#Reading the entire file. 
power_data <- read.table("household_power_consumption.txt",header = TRUE, sep=";" , na.strings = "?")
#Converting the Date column from factor to Date.
power_data$Date <- as.Date(power_data$Date,"%d/%m/%Y")
#Filtering the data of only the rows which have date as '01-Feb-2007' and  '02-Feb-2007'
new_data <- filter(power_data, Date == "2007-02-01"|Date == "2007-02-02" )

# Plotting the Histogram and writing it to a png file.
png("plot1.png",width=480,height=480,units = "px")
hist(new_data$Global_active_power,xlab = "Global Active Power(kilowatts)", main="Global Active Power", col="red")
dev.off()