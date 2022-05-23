setwd("C:/D??? li???u/RBook")
Veg <- read.table(file = "Vegetation2.txt",header = TRUE)
# v??? bi???u d??? theo c???t BARESOIL v? c???t R
plot(Veg$BARESOIL, Veg$R) # c?ch 1
plot(R ~ BARESOIL,  Veg) # c?ch 2
# c?ch 3
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19))
# C?ch th??? 2 d??? ch???n don v??? tr???c x,y d??? v???
xlim = c(min(Veg$BARESOIL), max(Veg$BARESOIL))
xlim = c(min(Veg$BARESOIL, na.rm = TRUE),
         max(Veg$BARESOIL, na.rm = TRUE))
# Thay d???i ki???u th??? hi???n c?c di???m tr?n bi???u d???
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19), pch = 18)
# Hi???n th??? c???t Transect, l?m tham s??? pch
Veg$Transect
# V??? l???i bi???u d??? th??? hi???n ph?n bi???t theo Transect
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness",
     main = "Scatter plot", xlim = c(0, 45),
     ylim = c(4, 19), pch = Veg$Transect)
#  Use of a Vector for pch
Veg$Time2 <- Veg$Time
Veg$Time2 [Veg$Time <= 1974] <- 1
Veg$Time2 [Veg$Time > 1974] <- 16
Veg$Time2
# V??? l???i v???i pch m???i
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     pch = Veg$Time2)
# Tru???ng h???p kh?ng th??? v??? du???c do c???t tham chi???u ch???a gi? tr??? kh?ng n???m trong pch
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     pch = Veg$Time)
warnings() 
# Changing the Colour of Plotting Symbols
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     col = 2)
# Thang m?u 
x <- 1:8
plot(x, col = x)
# Use of a Vector for col
Veg$Time2 <- Veg$Time
Veg$Time2 [Veg$Time <= 1974] <- 15
Veg$Time2 [Veg$Time > 1974] <- 16
Veg$Col2 <- Veg$Time
Veg$Col2 [Veg$Time <= 1974] <- 1
Veg$Col2 [Veg$Time > 1974] <- 2
plot(x = Veg$BARESOIL, y = Veg$R,
       xlab = "Exposed soil",
       ylab = "Species richness", main = "Scatter plot",
       xlim = c(0, 45), ylim = c(4, 19),
       pch = Veg$Time2, col = Veg$Col2)
# Thay d???i k?ch thu???c di???m bi???u di???n:  cex
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness",
     main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     pch = 16, cex = 1)

# Use of a Vector for cex
Veg$Cex2 <- Veg$Time
Veg$Cex2[Veg$Time == 2002] <- 2
Veg$Cex2[Veg$Time != 2002] <- 1
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness",
     main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19),
     pch = 16, cex = Veg$Cex2)
# Adding a Smoothing Line
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil", ylab = "Species richness",
     main = "Scatter plot", xlim = c(0, 45),
     ylim = c(4, 19))
M.Loess <- loess(R~BARESOIL, data = Veg)
Fit <- fitted(M.Loess)
lines(Veg$BARESOIL, Fit)
M.Loess
#
plot(x = Veg$BARESOIL, y = Veg$R,
     xlab = "Exposed soil",
     ylab = "Species richness", main = "Scatter plot",
     xlim = c(0, 45), ylim = c(4, 19))
M.Loess <- loess(R ~ BARESOIL, data = Veg)
Fit <- fitted(M.Loess)
Ord1 <- order(Veg$BARESOIL)
lines(Veg$BARESOIL[Ord1], Fit[Ord1],
        lwd = 3, lty = 2)
