##import data
dataAll <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')

##subsetting data
Data <- dataAll[data$Date %in% c("1/2/2007","2/2/2007") ,]

##convert date and time character to time
x<-paste(Data$Date, Data$Time, sep=" ")
time<-strptime(x,"%d/%m/%Y %H:%M:%S")
 
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

plot(time,subMetering1, type="l",ylab="Energy sub metering", xlab="", col="black")
lines(time,subMetering2,type="l",col="red")
lines(time,subMetering3,type="l",col="blue")
legend ("topright",legend=c("subMetering1","subMetering2","subMetering3"), col=c("black","red","blue"),lty=1,lwd=2)
dev.copy(png,file="plot3.png", width=480, height=480)
dev.off()