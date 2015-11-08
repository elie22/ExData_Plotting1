##the following code works with data available here: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
##download it, unzip and set the file as your working direcory in R

data <- read.csv("household_power_consumption.txt",header=FALSE, sep=";",skip=66637, nrow=2880,stringsAsFactors=FALSE)
header <- read.csv("household_power_consumption.txt",header=FALSE, sep=";", nrow=1,stringsAsFactors=FALSE)
names(data) <- header[1,]

hist(data$Global_active_power,col="red",main="Global active power",xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()







