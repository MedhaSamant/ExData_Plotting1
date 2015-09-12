## Read csv file
envData <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";")

## Get subset of data
newEnvData<-subset(envData, envData$Date == "1/2/2007" | envData$Date == "2/2/2007")

## Create graph
hist(as.numeric(newEnvData$Global_active_power), 
     xlab="Global Active Power(kilowatts)" , 
     ylab="Frequency" , 
     main = "Global Active Power",
     col = "red",
     ylim = c(0,1200),
     )

## save to png file
dev.copy(device = png, filename = 'Plot1.png', width = 480, height = 480) 
dev.off()