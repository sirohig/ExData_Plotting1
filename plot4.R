#Project 1
#plot 4
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
# First set for 4 graphs and margins
par(mfrow = c(2, 2),mar=c(4, 4, 2, 1),oma = c(0, 0, 2, 0))
# First Graph
plot(wp.df1$date_time,wp.df1$Global_active_power,type="l",main="",xlab="",ylab="Global Active Power")
# Second Graph
plot(wp.df1$date_time,wp.df1$Voltage,type="l",main="",xlab="datetime",ylab="Voltage")
#
# Third Graph. I am using code from plot3.R
# First we create an empty plot and than use lines() to add 3 graphs.
plot(wp.df1$date_time, wp.df1$Sub_metering_1,type="n",ylab="Energy sub metering",xlab="") #emplty plot
lines(wp.df1$date_time,wp.df1$Sub_metering_1,col="black")
lines(wp.df1$date_time,wp.df1$Sub_metering_2,col="red")
lines(wp.df1$date_time,wp.df1$Sub_metering_3,col="blue")
#add a legend
legend("topright",lwd=c(2,2,2),col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# ----- End of third graph  ------------

# Fourth Graph
# I have added a ylable also to keep it clean. This is extra clean up.
plot(wp.df1$date_time,wp.df1$Global_reactive_power,type="l",main="",xlab="datetime",ylab="Global Reactive Power")

#now copy to file
# width has to be increased otherwise legend was cutting.
dev.copy(png,filename="plot4.png",width=600,height=600)

#close file
dev.off()
