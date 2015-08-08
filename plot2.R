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
png(file="plot2.png")
with(a, plot(Date_time,Global_active_power,type="l",ylab= "Global Active Power (kilowatts)", xlab=""))
dev.off()
## my RStudio is in a Chinese version, so the x label is "周四 周五 周六", instead of "Thursday Friday Saturday"
## If you reproduce a graph with the code above, you may get a similar English version