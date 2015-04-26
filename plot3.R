

NEI <- readRDS("summarySCC_PM25.rds")

#  Filter Data based on fips = 24510
filterdata <- NEI[NEI$fips == "24510",]

agg2 <- aggregate(filterdata[c("Emissions")], list(type = filterdata$type, year = filterdata$year), sum)

# save the plot to plot2.png

png('plot3.png')

# Base plot the data based on year and Emissions.
plot <- ggplot(agg2, aes(x=year, y=Emissions, colour=type)) +
      geom_point(alpha=.3) +
      geom_smooth(alpha=.2, size=1, method="loess") +
      ggtitle("Total Emissions by Type in Baltimore City")

print(plot)

dev.off()