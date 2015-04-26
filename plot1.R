NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

agg <- aggregate(NEI[c("Emissions")], list(year = NEI$year), sum)

png('plot1.png')
plot(agg$year, agg$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in the US",
     xlab = "Year", ylab = "Emissions", col= "red")

dev.off()