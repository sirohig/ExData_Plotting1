#Project 1
# Code for Plot 1
# read data
# I am using sqldf to read data for just two dates.  Could not find any way to do this in read.table()
wp<-file("household_power_consumption.txt")
attr(wp,"file.format")<-list(sep=";",na.strings="?")
library(sqldf)
wp.df<-sqldf("select * from wp where date ='1/2/2007' or date ='2/2/2007'")

# now plot histogram
hist(wp.df$Global_active_power,col="red",main="Global Active Power",xlab="Global Acrive Power(kilowatts)")

#copy to png file
dev.copy(png,filename="plot1.png",width=480,height=480)
#close file
dev.off()
