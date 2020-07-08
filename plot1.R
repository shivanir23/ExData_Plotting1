library(dplyr)
library(date)
t<-strptime(f$Time)
t <- read.table("./h1.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))

## Format date to Type Date
t$Date <- as.Date(t$Date, "%d/%m/%Y")
t <- subset(t,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

x<-(t$Global_active_power)
hist(x,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency")
par(mar=c(4,4,2,1))