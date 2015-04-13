power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
power_subset <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

date <- strptime(paste(power_subset$Date, power_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
power_numeric_val <- as.numeric(power_subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date, power_numeric_val, type = "S", main = "Global Active Power", xlab = "", ylab ="Global Active Power (kilowatts)")