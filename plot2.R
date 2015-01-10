plot2<-function(){
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
    plot(data_2007_02_01_02_02$datetime,data_2007_02_01_02_02$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)');
    
    dev.copy(png,'./plot2.png',bg='white');
    dev.off();
}
