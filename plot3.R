power <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
power_subset <- power[power$Date %in% c("1/2/2007","2/2/2007"),]

date <- strptime(paste(power_subset$Date, power_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
esm1 <- as.numeric(power_subset$Sub_metering_1)
esm2 <- as.numeric(power_subset$Sub_metering_2)
esm3 <- as.numeric(power_subset$Sub_metering_3)

png("plot3.png", width=480, height=480)

with(power_subset, {
      plot(date,esm1, type="S",
           ylab="Energy Sub Metering", xlab="")
      lines(date,esm2,col='Red')
      lines(date,esm3,col='Blue')
})

#plot(date,esm1, col = "black", type= "1", ylab ="Energy Sub Meeting", xlab= "") 
#plot(date,esm2, col = "red", type= "S")     
#plot(date,esm3, col = "blue", type= "S")
legend ("topright", col=c("black","red","blue")  , lty=1, lwd=2,c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )
