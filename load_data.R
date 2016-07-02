

load_data <- function() {
  temp_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), na="?")
  temp_data$Date <- as.Date(temp_data$Date, "%d/%m/%Y")
  datetime<-paste(temp_data$Date, temp_data$Time)
  datetime_conv<-as.POSIXlt (datetime)

  temp_data$Time<-datetime_conv
  names(temp_data[2])<-"datetime"
  
  subset1<-temp_data [which (temp_data$Date==as.Date("2007-02-01")),]
  subset2<-temp_data [which (temp_data$Date==as.Date("2007-02-02")),]
  
  data<-rbind(subset1, subset2)
  
  return(data)
  
}

source ("plot1.R")
source ("plot2.R")
source ("plot3.R")
source ("plot4.R")
