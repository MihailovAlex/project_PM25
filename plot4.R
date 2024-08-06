library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

combustion_related <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal_related <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coal_combustion <- (combustion_related & coal_related)
combustion_SCC <- SCC[coal_combustion,]$SCC
combustion_NEI <- NEI[NEI$SCC %in% combustion_SCC,]

png("plot4.png",width=480,height=480,units="px")

ggp <- ggplot(combustion_NEI,aes(factor(year),Emissions)) +
    geom_bar(stat="identity",fill="blue",width=0.5) +
    labs(x="year", y=expression("Total PM 2.5 Emission (10^5 Tons)")) + 
    labs(title=expression("PM 2.5 Coal Combustion Source Emissions"))

print(ggp)

dev.off()