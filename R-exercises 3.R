setwd("C:/Dữ liệu/RBook")
## Bài 1:
#Xử dụng tập dữ liệu BirdFlu.xls:
# Sử dụng các phương pháp từ Chương 2, hãy cho biết tổng số ca bệnh cúm gia cầm trên mỗi quốc gia? 
#Tổng số vụ mỗi năm là bao nhiêu?
birdflu<-read.table(file='BirdFlu.txt',header=TRUE)
attach(birdflu)
str(birdflu)
birdflu
namecases=c('cases2003','cases2004','cases2005','cases2006','cases2007','cases2008')
# Tổng số ca bệnh cúm trên mỗi quốc gia
print("Tổng số ca bệnh cúm của mỗi quốc gia: ")
for (i in Country){
  sumcases_country=0
  for(j in namecases ){
    sumcases=sumcases+birdflu[birdflu$Country==i,j]
    }
  print(paste(i,':',sumcases_country))
  }
# Tổng số ca cúm mỗi năm:
print('Tổng số ca bệnh mỗi năm: ')
for (i in namecases){
  sumcases_year=sum(birdflu[,i])
  print(paste('2003: ',sumcases_year))
}

## Bài 2:
#Tệp ISIT.xls. Trong R, trích xuất dữ liệu từ trạm 1. Có bao nhiêu quan sát được tại trạm này? 
#Độ sâu lấy mẫu tối thiểu, trung vị, trung bình và tối đa tại trạm 1 là bao nhiêu?
#Độ sâu lấy mẫu tối thiểu, trung vị, trung bình và tối đa tại trạm 2 là bao nhiêu? Ở trạm 3? 
#Xác định bất kỳ trạm nào có ít quan sát hơn đáng kể. Tạo một khung dữ liệu mới bỏ qua các trạm này. 
#Trích xuất dữ liệu từ năm 2002. Trích xuất dữ liệu từ tháng 4 (của tất cả các năm).
#Trích xuất dữ liệu được đo ở độ sâu hơn 2000 mét (từ tất cả các năm và tháng). 
#Hiển thị dữ liệu theo giá trị độ sâu tăng dần.
#Hiển thị dữ liệu được đo ở độ sâu hơn 2000 mét vào tháng Tư.

ISIT <- read.table(file = "ISIT.txt", header= TRUE, dec = ".")
names(ISIT)
str(ISIT)
#Dữ liệu station1
ISIT.Station1 <- ISIT[ISIT$Station ==1,]
ISIT.Station1
names(ISIT.Station1)
str(ISIT.Station1)
# Số quan sát được thực hiện
nrow(ISIT.Station1)
# minimum, median, mean, maximum độ sâu lấy mẫu
# Station 1
min(ISIT.Station1$SampleDepth)
median(ISIT.Station1$SampleDepth)
mean(ISIT.Station1$SampleDepth)
max(ISIT.Station1$SampleDepth)
# Station 2
ISIT.Station2 <- ISIT[ISIT$Station ==2,]
nrow(ISIT.Station2)
min(ISIT.Station2$SampleDepth)
median(ISIT.Station2$SampleDepth)
mean(ISIT.Station2$SampleDepth)
max(ISIT.Station2$SampleDepth)
# Station 3
ISIT.Station3 <- ISIT[ISIT$Station ==3,]
nrow(ISIT.Station3)
min(ISIT.Station3$SampleDepth)
median(ISIT.Station3$SampleDepth)
mean(ISIT.Station3$SampleDepth)
max(ISIT.Station3$SampleDepth)
#Kiểm tra station nào ít hon
tapply(ISIT$Station, INDEX = ISIT$Station,length)
#Tạo dataframe mà loại bỏ station ít hơn
ISIT2 <- ISIT[ISIT$Station!=4 & ISIT$Station!=5 ,]
ISIT2
#Lấy dữ liệu năm 2002
Year2002 <- ISIT2[ISIT2$Year ==2002,]
#Lấy dữ liệu tháng 4 
AllYear <- ISIT2[ISIT2$Month ==4,]
# Trích xuất dữ liệu được đo ở độ sâu lớn hơn 2000 mét
ISIT2Depth2000 <- ISIT2[ISIT2$SampleDepth >2000,]
# Hiển thị dữ liệu theo giá trị độ sâu tăng dần
I1 <- order(ISIT2Depth2000$SampleDepth)
showdata <-ISIT2Depth2000[I1,]
# Trích xuất dữ liệu được đo ở độ sâu lớn hơn 2000 mét trong tháng 4
E3 <- ISIT2[ISIT2$Month ==4 & ISIT2$SampleDepth >2000,]

##Bài 3.
#Trong bước cuối cùng của bài tập trước,dữ liệu được đo ở độ sâu 
#lớn hơn 2000 mét vào tháng 4 đã được khai thác.
#Xuất những dữ liệu này sang một tệp ascii mới

#Using the write.table function 
write.table(E3, file="ISITDepth2000April.txt")

#Bài 4.
#Sử dụng hàm nhân tố và truy cập các tập con của khung dữ liệu với dữ liệu 
#nghiên cứu biển sâu. Các trạm từ 1 đến 5 được lấy mẫu vào tháng 4 năm 2001,
#các trạm từ 6 đến 11 ở Tháng 8 năm 2001,các trạm từ 12 đến 15 vào tháng 3 năm 
#2002 và các trạm từ 16 đến 19 vào tháng 10 năm 2002.
#Tạo hai biến mới trong R để xác định tháng và năm. 
#Lưu ý rằng đây là những yếu tố. 
#Thực hiện việc này bằng cách thêm các biến mới bên trong khung dữ liệu.

# Biến tháng mới
ISIT$NewMoth <- NA
ISIT$NewMoth[ISIT$Station <=5] <- "April"
ISIT$NewMoth[ISIT$Station > 5 & ISIT$Station<=11] <- "August"
ISIT$NewMoth[ISIT$Station > 11 & ISIT$Station<=15] <- "March"
ISIT$NewMoth[ISIT$Station >= 16 & ISIT$Station<=19] <- "October"
ISIT$NewMoth
ISIT$NewMoth <- factor(ISIT$NewMoth)
# Biến tháng mới
ISIT$NewYear <- NA
ISIT$NewYear[ISIT$Station <=11] <- 2001
ISIT$NewYear[ISIT$Station  >=12 & ISIT$Station<=19] <- 2002
ISIT$NewYear
ISIT$NewYear <- factor(ISIT$NewYear)

