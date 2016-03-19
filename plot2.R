
# read data (file and working directory should be this project root directory)
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", comment.char = "", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), stringsAsFactors=FALSE)

# subset lines with dates 1/2/2007 and 2/2/2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#adding column with date and time field
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#open png device
png(filename = "plot2.png", width=480, height=480)

#plot
par(mfrow=c(1,1))
plot(data$datetime, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")

# close file
dev.off()
