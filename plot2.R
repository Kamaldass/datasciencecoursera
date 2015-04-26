NEI <- readRDS("./exdata-data-NEI_data/summarySCC_PM25.rds")

#  Filter Data based on fips = 24510
filterdata <- NEI[NEI$fips == "24510",]

agg1 <- aggregate(filterdata[c("Emissions")], list(year = filterdata$year), sum)

# save the plot to plot2.png

png('plot2.png')

# Base plot the data based on year and Emissions.

plot(agg1$year, agg1$Emissions, type = "l", 
     main = "Total Emissions from PM2.5 in the Baltimore City",
     xlab = "Year", ylab = "Emissions", col= "blue")

dev.off()