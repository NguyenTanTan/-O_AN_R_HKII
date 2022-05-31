## Bài 1: Sử dụng hàm c, tạo một biến chứa các giá trị độ dài của bảy con vật.
#Đồng thời tạo một biến chứa các giá trị Tb. Bao gồm các NA.
#Chiều dài trung bình của bảy con vật là bao nhiêu?

# Tạo biến
LengthCT <- c(75,85,91.6,95,NA,105.5,106)
Tb <- c(0,0,1,NA,0,0,0)
# Tính giá trị trung bình bỏ qua NA
mean (LengthCT, na.rm=TRUE)

##Bài 2: Sử dụng hàm cbind sử dụng dữ liệu dịch tễ học:
#Việc sử dụng hàm cbind sử dụng dữ liệu dịch tễ học. Chúng ta tiếp tục với con hươu từ Bài tập 1. 
#Đầu tiên hãy tạo các biến Farm  và Month có chứa thông tin liên quan. Lưu ý rằng Farm là một chuỗi ký tự. 
#Sử dụng lệnh cbind để kết hợp dữ liệu month, length và Tb  data kết quả trong biến Boar. 
#Đảm bảo rằng bạn có thể trích xuất các hàng, cột và các phần tử của Boar. 
#Sử dụng các hàm dim, nrow và ncol để xác định số lượng động vật và các biến trong Boar.


# Tạo 2 biến Farm và Month
Farm <-c("MO","MO","MO","MO","LN","SE","QM")
Month <- c(11,07,07,NA,09,09,11)

# Kết hợp 2 biến Farm và Month 
Boar<-cbind(Farm,Month,LengthCT,Tb)
Boar
# Số lượngng động vật:
nrow(Boar)
# Số biến:
ncol(Boar)

##Bài 3: Sử dụng hàm vector sử dụng dữ liệu dịch tễ học:
#Việc sử dụng hàm vectơ sử dụng dữ liệu dịch tễ học. 
#Chúng ta tiếp tục với hươu từ Bài tập 1. Thay vì hàm  c để tạo vector  Tb,  
#hãy tạo vector TB với hàm vector ,đặt tên khác cho vectơ, chẳng hạn như Tb2.

tb2 <- vector(mode="numeric",length=7)
tb2[3]<-1
tb2[4]<-NA
tb2

##Bài 4: Làm việc với ma trận:
#Tạo ma trận sau trong R và xác định chuyển vị,nghịch đảo của nó và bội D với nghịch đảo của nó 
#(kết quả phải là ma trận đơn vị).

# Tạo vector chứa các giá trị của phần tử trong ma trận
vec<-c(1,2,3,4,2,1,2,3,0)
#  Tạo ma trận
D<-matrix(vec,nrow=3,byrow=TRUE)
D
# Ma trận chuyển vị
Dt<-t(D)
Dt
# Ma trận nghịch đảo
Ds<-solve(D)
Ds
# Nhân D với ma trận nghịch đảo
I<-D%*%Ds
I

##Bài 5: Sử dụng hàm  data.frame  và list sử dụng dữ liệu dịch tễ học:
#Chúng ta tiếp tục với hươu từ Bài tập 1 đến Bài 3. 
#Tạo khung dữ liệu chứa tất cả dữ liệu được trình bày trong bảng trong Bài tập 1. 
#Giả sử rằng bạn quyết định biến đổi căn bậc hai dữ liệu độ dài. 
#Thêm dữ liệu đã chuyển dạng căn bậc hai vào khung dữ liệu. Làm tương tự với list thay vì data.frame.
#Điểm khác biệt là gì?
  


Year <- c(0,0,1,NA,3,3,2)
Sex<- c(1,2,2,2,1,2,2)
LengthClass<- c(1,1,1,1,1,1,1)
Ecervi<- c(0,0,0,NA,0,0,0)

# Tạoo cộtt dữ  liệu căn bậc hai độ dài
sqrtlengh<-sqrt(LengthCT)
sqrtlengh
# Tạo khung chứa dữ liệu    
dframe<-data.frame(Farm,Month,Year,Sex,LengthClass,LengthCT,Ecervi,Tb,sqrtlengh)
dframe
#Sử dụng list thay data.frame
lframe<-list(Farm,Month,Year,Sex,LengthClass,LengthCT,Ecervi,Tb,sqrtlengh)
lframe
### Sự khác biệt:
#Dùng data.frame sẽ tạo ra bảng dữ liệu rõ ràng và đẹp hơn list. 
#Dùng data.frame có chỉ ra tên các biến nhưng list thì không, và dữ liệu của list sẽ sắp xếp theo hàng còn data.frame 
#là sắp xếp theo cột.

##Bài 6: Sử dụng hàm read.table và scan  sử dụng dữ liệu nghiên cứu biển sâu:
#Tệp ISIT.xls chứa dữ liệu phát quang sinh học được sử dụng để tạo Fig 1.6. 
#Xem đoạn trên biểu đồ này để biết mô tả. Chuẩn bị bảng tính (có 4-5 vấn đề bạn sẽ cần giải quyết) 
#và xuất dữ liệu sang tệp ascii. Nhập dữ liệu vào R trước tiên bằng cách sử dụng hàm read.table 
#và sau đó là hàm Scan. Sử dụng hai tên khác nhau để lưu trữ dữ liệu. 
#Sự khác biệt giữa chúng là gì? Sử dụng các hàm is.matrix và is.data.frame để trả lời câu hỏi này.

# Nhập dữ liệu vào R bằng hàm read.table()
setwd("C:/Dữ liệu/RBook")
ISIT<-read.table("ISIT.txt",header=TRUE)
ISIT
# Lưu dữ liệu vào file ascii
save(ISIT, file="ISITASCII.txt",ascii = TRUE)
ISIT
# Kiểm tra kiểu của biến ISIT
is.matrix(ISIT)
is.data.frame(ISIT)
# Nhập dữ liệu vào R bằng scan()
ISITSCAN<-scan(file="ISIT.txt",what="character")
ISITSCAN
# Lưu dữ liệu sang file ascii
save(ISITSCAN, file="ISITSCANASCII.txt",ascii = TRUE)
ISITSCAN
# Kiểm tra kiểu của biến ISITSCAN
is.matrix(ISITSCAN)
is.data.frame(ISITSCAN)
is.vector(ISITSCAN)

## Khác biệt:
#Hàm read sẽ trả về kết quả là một ma trận với các cột, hàng cụ rõ ràng giống với dữ liệu gốc. 
#Còn scan sẽ trả về kết quả là một vector được đọc theo từng dòng

#Bài 7: Sử dụng hàm read.table và scan  sử dụng dữ liệu dịch tễ học:
#Tệp Deer.xls chứa dữ liệu về hươu được thảo luận trong Bài tập 1, nhưng bao gồm tất cả các loài động vật. 
#Xuất dữ liệu trong tệp Excel sang tệp ascii và nhập dữ liệu đó vào R.


setwd("C:/CODE/RBook")
Deer<-read.table("Deer.txt",header=TRUE)
Deer
#Lưu dữ liệu sang file ascii
save(Deer, file="DeerASCII.txt",ascii = TRUE)
Deerascii<-read.table("DeerASCII.txt",header=TRUE)
Deerascii


