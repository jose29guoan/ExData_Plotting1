## First download the file and unzip into current working directory

a=read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")
a$Date=as.Date(a$Date,format="%d/%m/%Y")
a=subset(a,Date>=as.Date("2007-02-01"))
a=subset(a,Date<as.Date("2007-02-03"))
##Reading and subsetting

a$Global_active_power=as.numeric(a$Global_active_power)
a$Global_reactive_power=as.numeric(a$Global_reactive_power)
a$Voltage=as.numeric(a$Voltage)
a$Global_intensity=as.numeric(a$Global_intensity)
a$Sub_metering_1=as.numeric(a$Sub_metering_1)
a$Sub_metering_2=as.numeric(a$Sub_metering_2)
a$Sub_metering_3=as.numeric(a$Sub_metering_3)
a$Date_time=as.POSIXlt(paste(a$Date,a$Time),format="%Y-%m-%d %H:%M:%S")

library(datasets)
png(file="plot1.png")
hist(a$Global_active_power,main="Global Active Power",xlab= "Global Active Power (kilowatts)", ylab="Frequency",col="Red")
dev.off()
## The first PNG
