plotData <- read.table("./h1.txt", header=T, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
par(mfrow=c(1,1))
with(finalData,plot(SetTime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
lines(finalData$SetTime, finalData$Sub_metering_2,col="red")
lines(finalData$SetTime, finalData$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),lty="solid",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))