power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
power_subset <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

power_numeric_val <- as.numeric(power_subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(power_numeric_val,col="red",main = "Global Active Power", xlab = "Global Active Power(Killowatts)")
