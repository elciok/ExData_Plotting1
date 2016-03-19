
# read data (file and working directory should be this project root directory)
data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", comment.char = "", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), stringsAsFactors=FALSE)

# subset lines with dates 1/2/2007 and 2/2/2007
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#open png device
png(filename = "plot1.png", width=480, height=480)

# generate histogram
par(mfrow=c(1,1))
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close file
dev.off()
