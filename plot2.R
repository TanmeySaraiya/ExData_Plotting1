#Reading Data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=';',quote="")
#Subsetting the required rows
need_data<-subset(data,Date=="1/2/2007"| Date=="2/2/2007")
#Converting to POSIX format
date_time<-strptime(paste(need_data$Date,need_data$Time,sep=" "),format="%d/%m/%Y %H:%M:%S")
#Adding POSIX data and dataset
need_data<-cbind(need_data,date_time)
#Creating a png file
png(filename="plot2.png",width=500,height=500,units="px",bg="white")
#Plotting the graph
with(need_data,plot(date_time,Global_active_power,ylab = "Global Active Power (kilowatts)",xlab = "",type="l"))
#Closing devices
dev.off()
