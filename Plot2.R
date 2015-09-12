## Read csv file
envData <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";")

## Get subset of data
newEnvData<-subset(envData, envData$Date == "1/2/2007" | envData$Date == "2/2/2007")

## Create correct dateTime format
newEnvData$newCol <- paste(newEnvData$Date, newEnvData$Time, sep=" ")
newEnvData$newField <-as.POSIXct(strptime(newEnvData$newCol , "%d/%m/%Y %H:%M:%S"))

## Create plot
plot( newEnvData$newField , as.numeric(newEnvData$Global_active_power), 
      ylab ="Global Active Power (kilowatts)",
      type = "s",
      ylim = c(0,8),
      xlab=""
)

## save to png file
dev.copy(device = png, filename = 'Plot2.png', width = 480, height = 480) 
dev.off()