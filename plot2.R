electric_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_subset <- subset(electric_data, Date %in% c("1/2/2007","2/2/2007"))
data_subset$Date <- as.Date(data_subset$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_subset$Date), data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)
with(data_subset, {
  plot(Global_active_power~Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
  })
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
