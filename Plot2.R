#download and unzip file to working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, './household_power_consumption.zip')
unzip('./household_power_consumption.zip')

#read data file
data <- read.table('./household_power_consumption.txt', sep=";", header=TRUE, na.strings = "?")

#subset data
filtered <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#plot
png("plot2.png", width=480, height=480)
datetime<-as.POSIXct(paste(filtered$Date, filtered$Time), format="%d/%m/%Y %H:%M:%S")
plot(datetime, filtered$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()