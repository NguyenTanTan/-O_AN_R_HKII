setwd("C:/Dữ liệu/RBook/")
data<-read.table("Temperature.txt", header=TRUE)
data
setwd("C:/Save_image/")
allstation <- unique(data$Station)
allstation
allyear<-unique(data$Year)
allyear
for (i in 1:30){ 
  station.i<-allstation[i]
  for (j in 1:16){
  year.j<-allyear[j]
  data.i <- data[data$Station == station.i & data$Year==year.j, ]
  YourFileName <- paste(station.i,year.j, ".jpg", sep = "")
  jpeg(file = YourFileName)
  plot(x = data.i$Month, 
       y = data.i$Temperature,
       xlab = "Month",
       ylab = "Temperature", main = paste(station.i,year.j))
  dev.off()
  }
}


