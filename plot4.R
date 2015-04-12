##import data
dataAll <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')

##subsetting data
Data <- dataAll[data$Date %in% c("1/2/2007","2/2/2007") ,]

##convert date and time character to time
x<-paste(Data$Date, Data$Time, sep=" ")
time<-strptime(x,"%d/%m/%Y %H:%M:%S")

Data$Global_active_power<-as.numeric(Data$Global_active_power)
Data$Global_reactive_power<-as.numeric(Data$Global_reactive_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

par(mfcol=c(2,2))
##plot1
plot (time,Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##plot2
plot(time,subMetering1, type="l",ylab="Energy sub metering", xlab="", col="black")
lines(time,subMetering2,type="l",col="red")
lines(time,subMetering3,type="l",col="blue")
##plot3
plot (time,Data$Voltage, type="l", xlab="datetime", ylab="Voltage")
##plot4
plot(time,Data$Global_reactive_power,type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png,file="plot4.png", width=480, height=480)
dev.off()

