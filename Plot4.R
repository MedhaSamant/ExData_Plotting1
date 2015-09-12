## Read csv file
envData <- read.csv("household_power_consumption.txt", colClasses = "character", sep = ";")

## Get subset of data
newEnvData<-subset(envData, envData$Date == "1/2/2007" | envData$Date == "2/2/2007")

newEnvData$newCol <- paste(newEnvData$Date, newEnvData$Time, sep=" ")
newEnvData$newField <-as.POSIXct(strptime(newEnvData$newCol , "%d/%m/%Y %H:%M:%S"))

par(mfrow=c(2,2))

## Create Plot1
plot( newEnvData$newField , as.numeric(newEnvData$Global_active_power), 
      ylab ="Global Active Power",
      type = "s",
      ylim = c(0,8),
      xlab=""
)

## Create Plot2
plot( newEnvData$newField , as.numeric(newEnvData$Voltage), 
      ylab ="Voltage",
      type = "s",
      ylim = c(234,246),
      xlab="datetime"
)

## Create Plot3
plot( newEnvData$newField , as.numeric(newEnvData$Sub_metering_1),  type = "n", col="black",  
     ylim = c(0,40), ylab = "Energy sub meteing",xlab="")


lines( newEnvData$newField, newEnvData$Sub_metering_1,  type = "l" ,col="black")
lines( newEnvData$newField, newEnvData$Sub_metering_2,  type = "l", col="red")
lines( newEnvData$newField, newEnvData$Sub_metering_3,  type = "l", col="blue")

legend("topright",col = c("black", "red", "blue"),lty=1,
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       y.intersp=0.5,
       ##text.width = strwidth("Sub_metering_1"), 
       cex=0.5,
       adj=0,
       xjust=0,
       bty="n")


## Create Plot4
plot( newEnvData$newField , as.numeric(newEnvData$Global_reactive_power), 
      ylab ="Global_reactive_power",
      type = "l",
      ylim = c(0.0,0.5),
      xlab="datetime"
)

## save to png file
dev.copy(device = png, filename = 'Plot4.png', width = 480, height = 480) 
dev.off()