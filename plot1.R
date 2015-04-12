##import data
dataAll <- read.csv("./household_power_consumption.txt", header=T, sep=';', na.strings="?",stringsAsFactors=F, comment.char="", quote='\"')
##subsetting data
Data <- dataAll[data$Date %in% c("1/2/2007","2/2/2007") ,]

Data$Global_active_power<-as.numeric(Data$Global_active_power)

hist(Data$ Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency",col="red",main="Global Active Power")
dev.copy(png,file="plot1.png", width=480, height=480)
dev.off()
