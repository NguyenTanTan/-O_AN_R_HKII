## Sử dụng tập dữ liệu Amphibian_road_Kills.txt để vẽ biểu đồ
setwd('C:/Dữ liệu /RBook')
rk<- read.table('Amphibian_road_Kills.txt', header = TRUE)
rk
names(rk)
str(rk)
plot(x=rk$D_PARK,y=rk$TOT_N,
     xlab="Distance to park",
     ylab="Number of dead animals")
M.Loess <- loess(TOT_N~D_PARK, data =rk)
Fit <- fitted(M.Loess)
Ord1<- order(rk$D_PARK)
lines(rk$D_PARK[Ord1],Fit[Ord1], lwd=3,lty=2)
 
plot(x=rk$D_PARK,y=rk$TOT_N,
     cex = 0.5+3* rk$OLIVE/max(rk$OLIVE),
     xlab="Distance to park",
     ylab=" Number of dead animals")

