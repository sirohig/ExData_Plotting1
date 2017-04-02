#Project 1
#plot 2
# read data
# I am using sqldf to read data for just two dates.  Could not find any way to do this in read.table()
wp<-file("household_power_consumption.txt")
attr(wp,"file.format")<-list(sep=";",na.strings="?")
library(sqldf)
wp.df1<-sqldf("select * from wp where date ='1/2/2007' or date ='2/2/2007'")

# add a date_time field
wp.df1$date_time<-strptime(paste(wp.df1$Date,wp.df1$Time),format="%d/%m/%Y %H:%M:%S")
#now plot
# In example there is no lable for x axis that is why I am using xlab=""
plot(wp.df1$date_time,wp.df1$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

#now copy to file
dev.copy(png,filename="plot2.png",width=480,height=480)

#close file
dev.off()
