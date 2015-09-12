## Read csv file
envData <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";")

## Get subset of data
newEnvData<-subset(envData, envData$Date == "1/2/2007" | envData$Date == "2/2/2007")

## Create correct datTime format
newEnvData$newCol <- paste(newEnvData$Date, newEnvData$Time, sep=" ")
newEnvData$newField <-as.POSIXct(strptime(newEnvData$newCol , "%d/%m/%Y %H:%M:%S"))

## Create plots
plot( newEnvData$newField , as.numeric(newEnvData$Sub_metering_3),  type = "n", col="blue")
plot( newEnvData$newField , as.numeric(newEnvData$Sub_metering_2),  type = "n", col="red")
plot( newEnvData$newField , as.numeric(newEnvData$Sub_metering_1),  type = "n", col="black",  
      ylim = c(0,40), ylab = "Energy sub metering",xlab="")


## Create correct dateTime format
lines( newEnvData$newField, newEnvData$Sub_metering_1,  type = "l" ,col="black")
lines( newEnvData$newField, newEnvData$Sub_metering_2,  type = "l", col="red")
lines( newEnvData$newField, newEnvData$Sub_metering_3,  type = "l", col="blue")

## Add legend
legend("topright",col = c("black", "red", "blue"),lty=1,
     legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.6,
     ##text.width = strwidth("Sub_metering_1   "),
       adj=0,
      xjust=0,cex=0.5)


## save to png file
dev.copy(device = png, filename = 'Plot3.png', width = 480, height = 480) 
dev.off()