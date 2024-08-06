NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalEmissions <- aggregate(Emissions ~ year, NEI, sum)

png("plot1.png",width=480,height=480,units="px")

barplot(
    (totalEmissions$Emissions),
    names.arg=totalEmissions$year,
    xlab="Year",
    ylab="PM2.5 Emissions (Tons)",
    main="Total Emissions by Year"
)

dev.off()
