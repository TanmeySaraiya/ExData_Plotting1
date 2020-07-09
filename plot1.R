#Reading Data
data<-read.table("./household_power_consumption.txt",header=TRUE,sep=';',quote="")
#Subsetting the required rows
need_data<-subset(data,Date=="1/2/2007"| Date=="2/2/2007")
#Creating a png file
png(filename="plot1.png",width=500,height=500,units="px",bg="white")
#Creating a histogram
with(need_data,hist(as.numeric(Global_active_power),col = 'red',xlab = "Global Active Power(kilowatts)",main=""))
#Closing devices
dev.off()