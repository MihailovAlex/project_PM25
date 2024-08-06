library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))

MD_onroad <- subset(NEI, fips == 24510 & type == 'ON-ROAD')

MD_df <- aggregate(MD_onroad[, 'Emissions'], by = list(MD_onroad$year), sum)
colnames(MD_df) <- c('year', 'Emissions')

png("plot5.png",width=480,height=480,units="px")

ggplot(data = MD_df, aes(x = year, y = Emissions)) + 
    geom_bar(aes(fill = year), stat = "identity") + 
    guides(fill = F) + 
    ggtitle('Total Emissions of Motor Vehicle in Baltimore City Maryland') + 
    ylab('PM2.5') + 
    xlab('Year') 

dev.off()