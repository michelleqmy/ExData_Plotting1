##import data
dataAll <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')
##subsetting data
Data <- dataAll[data$Date %in% c("1/2/2007","2/2/2007") ,]

##convert date and time character to time
x<-paste(Data$Date, Data$Time, sep=" ")
time<-strptime(x,"%d/%m/%Y %H:%M:%S")

Data$Global_active_power<-as.numeric(Data$Global_active_power)
plot (time,Data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png", width=480, height=480)
dev.off()

