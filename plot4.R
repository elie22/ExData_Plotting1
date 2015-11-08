##the following code works with data available here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##download it, unzip and set the file as your working direcory in R

data <- read.csv("household_power_consumption.txt",header=FALSE, sep=";",skip=66637, nrow=2880,stringsAsFactors=FALSE)
header <- read.csv("household_power_consumption.txt",header=FALSE, sep=";", nrow=1,stringsAsFactors=FALSE)
names(data) <- header[1,]


##add formated DateTime column to df
datatime <- data.frame(data,DateTime=paste(data$Date,data$Time))
datatime$DateTime <- strptime(datatime$DateTime,"%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))

plot(datatime$DateTime, datatime$Global_active_power,type="l", ylab="Global Active Power",xlab="")

plot(datatime$DateTime,datatime$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(datatime$DateTime,datatime$Sub_metering_2,col="red")
lines(datatime$DateTime,datatime$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1, box.lty=0)

plot(datatime$DateTime, datatime$Voltage,type="l", ylab="Voltage",xlab="datetime")

plot(datatime$DateTime, datatime$Global_reactive_power,type="l", ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,file="plot4.png")
dev.off()