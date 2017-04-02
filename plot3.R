#Project 1
#plot 3
# swirl tutorial was really helpful
# read data
# I am using sqldf to read data for just two dates.  Could not find any way to do this in read.table()
wp<-file("household_power_consumption.txt")
attr(wp,"file.format")<-list(sep=";",na.strings="?")
library(sqldf)
wp.df1<-sqldf("select * from wp where date ='1/2/2007' or date ='2/2/2007'")

# add a date_time field
wp.df1$date_time<-strptime(paste(wp.df1$Date,wp.df1$Time),format="%d/%m/%Y %H:%M:%S")
#now plot
# First we create an empty plot and than use lines() to add 3 graphs.
plot(wp.df1$date_time, wp.df1$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="") #emplty plot
lines(wp.df1$date_time,wp.df1$Sub_metering_1,col="black")
lines(wp.df1$date_time,wp.df1$Sub_metering_2,col="red")
lines(wp.df1$date_time,wp.df1$Sub_metering_3,col="blue")
#add a legend
legend("topright",lwd=c(2,2,2),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#now copy to file
# width has to be increased otherwise legend was cutting.
dev.copy(png,filename="plot3.png",width=600,height=480)

#close file
dev.off()
