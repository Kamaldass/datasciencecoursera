power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
power_subset <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

date <- strptime(paste(power_subset$Date, power_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

active_power <- as.numeric(power_subset$Global_active_power)

reactive_power <- as.numeric(power_subset$Global_reactive_power)
volt <- as.numeric(power_subset$Voltage)

esm1 <- as.numeric(power_subset$Sub_metering_1)
esm2 <- as.numeric(power_subset$Sub_metering_2)
esm3 <- as.numeric(power_subset$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(power_subset, { plot( date, active_power, type = "S",  xlab = "", ylab ="Global Active Power")
                     plot( date, volt, type = "S", xlab = "datetime", ylab ="Voltage")
                     
                     plot(date,esm1, type="S",
                          ylab="Energy Sub Metering", xlab="")
                     lines(date,esm2,col='Red')
                     lines(date,esm3,col='Blue')
                     legend ("topright", col=c("black","red","blue")  , lty=1, lwd=2, bty="n", c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
                     plot( date, reactive_power, type = "S", xlab = "datetime", ylab ="Global_reactive_power")
})