library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))

MD_onroad <- subset(NEI, fips == '24510' & type == 'ON-ROAD')
CA_onroad <- subset(NEI, fips == '06037' & type == 'ON-ROAD')

MD_df <- aggregate(MD_onroad[, 'Emissions'], by = list(MD_onroad$year), sum)
colnames(MD_df) <- c('year', 'Emissions')
MD_df$City <- paste(rep('MD', 4))

CA_df <- aggregate(CA_onroad[, 'Emissions'], by = list(CA_onroad$year), sum)
colnames(CA_df) <- c('year', 'Emissions')
CA_df$City <- paste(rep('CA', 4))
df <- as.data.frame(rbind(MD_df, CA_df))

png('plot6.png')

ggplot(data = df, aes(x = year, y = Emissions)) + 
    geom_bar(aes(fill = year),stat = "identity") + 
    guides(fill = F) + 
    ggtitle('Total Emissions of Motor Vehicle California vs. Baltimore City Maryland') + 
    ylab('PM 2.5') + 
    xlab('Year') + 
    facet_grid(. ~ City)

dev.off()