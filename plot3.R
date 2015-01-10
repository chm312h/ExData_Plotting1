plot3<-function(){
    #read data
    data<-read.table('./household_power_consumption.txt',sep=';',header=TRUE,na.strings=c('?'),colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'));
    #print(head(data));
    
    #subset
    data_2007_02_01_02_02<-subset(data,Date=='1/2/2007' | Date=='2/2/2007');
    #print(head(data_2007_02_01_02_02));
    
    #datetime
    data_2007_02_01_02_02$datetime<-strptime(paste(data_2007_02_01_02_02$Date, data_2007_02_01_02_02$Time), "%d/%m/%Y %H:%M:%S");
    #print(head(data_2007_02_01_02_02));
    
    #draw
    plot(data_2007_02_01_02_02$datetime,data_2007_02_01_02_02$Sub_metering_1,type='n',xlab='',ylab='Energy sub metering');
    points(data_2007_02_01_02_02$datetime,data_2007_02_01_02_02$Sub_metering_1,type='l',col='black');
    points(data_2007_02_01_02_02$datetime,data_2007_02_01_02_02$Sub_metering_2,type='l',col='red');
    points(data_2007_02_01_02_02$datetime,data_2007_02_01_02_02$Sub_metering_3,type='l',col='blue');
    legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=1);
    
    dev.copy(png,'./plot3.png',bg='white');
    dev.off();
}
