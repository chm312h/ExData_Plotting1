plot1<-function(){
    #read data
    data<-read.table('./household_power_consumption.txt',sep=';',header=TRUE,na.strings=c('?'),colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'));
    #print(head(data));
    
    #subset
    data_2007_02_01_02_02<-subset(data,Date=='1/2/2007' | Date=='2/2/2007');
    #print(head(data_2007_02_01_02_02));
    
    #draw
    hist(data_2007_02_01_02_02$Global_active_power,main='Global Active Power',xlab='Global Active Power (kilowatts)',col='red');
    dev.copy(png,'./plot1.png',bg='white');
    dev.off();
}
