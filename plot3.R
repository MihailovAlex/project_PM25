library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore_NEI <- NEI[NEI$fips=="24510",]

agg_totals_Baltimore <- aggregate(Emissions ~ year, baltimore_NEI,sum)

png("plot3.png",width=960,height=480,units="px")

ggp <- ggplot(baltimore_NEI,aes(factor(year),Emissions,fill=type)) +
    geom_bar(stat="identity") +
    facet_grid(.~type,scales = "free", space="free") + 
    labs(x="year", y=expression("Total2.5 Emission (Tons)")) + 
    labs(title=expression("PM2.5 Emissions Baltimore City for Year by types")) + 
    scale_fill_manual(values=c("blue", "red", "green", "pink")) 

print(ggp)

dev.off()
