setwd('C:/Dữ liệu/RBook/')
df=read.table('GDP_VN.txt',header=TRUE,na.strings = "..")
names(df)=c(2000,2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014)
str(df)
# Biểu đồ thể hiện sự tăng trưởng về tổng thu nhập sản phẩm trong nước từ năm 2000 đến năm 2014
setwd('C:/Save_image')
tsp=df[1,]
YourFileName ='TSP_TD.jpg'
jpeg(file = YourFileName)
barplot(as.matrix(tsp),col=2,main="Tổng thu nhập sản phẩm trong nước tư năm 200 đến năm 2014(Tỷ đồng)")
dev.off()
# Biểu đồ thể hiện sự tăng trưởng về tổng tiêu dùng từ năm 2000 đến năm 2014

setwd('C:/Save_image')
ttd=df[5,]
YourFileName ='TTD_TD.jpg'
jpeg(file = YourFileName)
barplot(as.matrix(ttd),col=4,main="Tổng tiêu dùng từ năm 200 đến năm 2014(Tỷ đồng)")
dev.off()


