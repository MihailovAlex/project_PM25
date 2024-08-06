NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore_NEI <- NEI[NEI$fips=="24510",]

agg_totals_Baltimore <- aggregate(Emissions ~ year, baltimore_NEI,sum)

png("plot2.png",width=480,height=480,units="px")

barplot(
    agg_totals_Baltimore$Emissions,
    names.arg=agg_totals_Baltimore$year,
    xlab="Year",
    ylab="PM2.5 Emissions (Tons)",
    main="Total Emissions From all Baltimore City"
)

dev.off()
