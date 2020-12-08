#download and unzip file to working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, './household_power_consumption.zip')
unzip('./household_power_consumption.zip')

#read data file
data <- read.table('./household_power_consumption.txt', sep=";", header=TRUE, na.strings = "?")

#subset data
filtered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot
png("plot3.png", width=480, height=480)
datetime<-as.POSIXct(paste(filtered$Date, filtered$Time), format="%d/%m/%Y %H:%M:%S")
plot(datetime, filtered$Sub_metering_1, type = "l", col="black", xlab = "",
     ylab = "Energy sub metering" )
lines(datetime, filtered$Sub_metering_2, type = "l", col="red")
lines(datetime, filtered$Sub_metering_3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()