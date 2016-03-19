
# read data (file and working directory should be this project root directory)
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", comment.char = "", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), stringsAsFactors=FALSE)

# subset lines with dates 1/2/2007 and 2/2/2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#adding column with date and time field
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#open png device
png(filename = "plot3.png", width=480, height=480)

#plot
par(mfrow=c(1,1))
max_sub_metering = max(c(max(data$Sub_metering_1), max(data$Sub_metering_2), max(data$Sub_metering_3)))
min_sub_metering = min(c(min(data$Sub_metering_1), min(data$Sub_metering_2), min(data$Sub_metering_3)))
with(data, plot(c(min(datetime), max(datetime)), c(min_sub_metering, max_sub_metering), type="n", ylab="Energy sub metering", xlab=""))
with(data, lines(datetime, Sub_metering_1, col="black"))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))

legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1, 1, 1))

# close file
dev.off()
