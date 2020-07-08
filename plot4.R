plotData <- read.table("./h1.txt", header=T, sep=";", na.strings="?")
## set time variable
finalData <- plotData[plotData$Date %in% c("1/2/2007","2/2/2007"),]
SetTime <-strptime(paste(finalData$Date, finalData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
finalData <- cbind(SetTime, finalData)
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0))

with(finalData,plot(SetTime,Global_active_power,type="l",col="black",xlab="datetime"))
with(finalData,plot(SetTime,Voltage,type="l",col="black",xlab="datetime",ylab="Voltage"))

with(finalData,plot(SetTime,Sub_metering_1,type="l",col="black",xlab="",ylab="Energy sub metering"))
lines(finalData$SetTime, finalData$Sub_metering_2,col="red")
lines(finalData$SetTime, finalData$Sub_metering_3,col="blue")
legend("topright" ,col=c("black","red","blue"),bty="n",lty=1,lwd=2.5,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(finalData,plot(SetTime,Global_reactive_power,type="l",col="black",xlab="datetime"))
