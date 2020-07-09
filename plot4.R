#Reading Data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=';',quote="")
#Subsetting the required rows
need_data<-subset(data,Date=="1/2/2007"| Date=="2/2/2007")
#Converting to POSIX format
date_time<-strptime(paste(need_data$Date,need_data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
#Adding POSIX data and dataset
need_data<-cbind(need_data,date_time)
#Creating a png file
png(filename="plot4.png",width=500,height=500,units="px",bg="white")
#Making plot design and margins
par(mfrow=c(2,2),mar=c(4,4,2,1),oma=(2,1,1,1))
#PLotting graphs
with(need_data,plot(date_time,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type="l"))

with(need_data,plot(date_time,Voltage,ylab = "Voltage",xlab = "datetime",type="l"))

with(need_data,plot(date_time,Sub_metering_1,ylab = "Energy sub metering",xlab = "",type="n"),)
with(need_data,lines(date_time,Sub_metering_1,type="l",col="black"))
with(need_data,lines(date_time,Sub_metering_2,type="l",col="red"))
with(need_data,lines(date_time,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col = c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

with(need_data,plot(date_time,Global_reactive_power,ylab = "Global_reactive_power",xlab = "datetime",type="l"))
#Closing devices
dev.off()
