setwd("C:/D??? li???u/RBook")
Owls <- read.table(file = "Owls.txt", header = TRUE)
names(Owls)
str(Owls)
unique(Owls$Nest)
# V??? bi???u d??? c???a t??? AutavauxTV
Owls.ATV <- Owls[Owls$Nest=="AutavauxTV", ]
plot(x = Owls.ATV$ArrivalTime,
     y = Owls.ATV$NegPerChick,
     xlab = "Arrival Time", main = "AutavauxTV",
     ylab = "Negotiation behaviour")
# V??? bi???u d??? c???a t??? Bochet
Owls.Bot <- Owls[Owls$Nest == "Bochet", ]
plot(x = Owls.Bot$ArrivalTime,
  y = Owls.Bot$NegPerChick,
  xlab = "Arrival Time",
  ylab = "Negotiation behaviour", main = "Bochet")     
# Luu bi???u d??? t??? Bochet

setwd("C:/???nh/")
Nest.i <- "Bochet"
Owls.i <- Owls[Owls$Nest == Nest.i, ]
YourFileName <- paste(Nest.i, ".jpg", sep="")
jpeg(file = YourFileName)
plot(x = Owls.i$ArrivalTime, y = Owls.i$NegPerChick,
       xlab = "Arrival Time", main = Nest.i,
       ylab = "Negotiation behaviour")
dev.off()
# Luu bi???u d??? các t???
AllNests <- unique(Owls$Nest)
AllNests
for (i in 1:27){
  Nest.i <- AllNests[i]
  Owls.i <- Owls[Owls$Nest == Nest.i, ]
  YourFileName <- paste(Nest.i, ".jpg", sep = "")
  jpeg(file = YourFileName)
  plot(x = Owls.i$ArrivalTime, 
       y = Owls.i$NegPerChick,
       xlab = "Arrival Time",
       ylab = "Negotiation behaviour", main = Nest.i)
  dev.off()
}

#
Veg <- read.table(file = "Vegetation2.txt",
                  header = TRUE)
names(Veg)
## Ch???ng minh khác nhau gi???a Zeros và NA: 
# T???o hàm d???m giá tr??? NA
NAPerVariable <- function(X1) {
  D1 <- is.na(X1)
  colSums(D1)
}
# Zeros
NAPerVariable(Veg[,5:24])
# NA
setwd("C:/D??? li???u/RBOok")
Parasite <- read.table(file = "CodParasite.txt",
                       header = TRUE)
names(Parasite)
NAPerVariable(Parasite)
# T???o hàm d???m giá tr??? zeros
ZerosPerVariable <- function(X1) {
  D1 = (X1 == 0)
  colSums(D1)
}
ZerosPerVariable(Parasite)
# D???m nhung b??? NA
ZerosPerVariable <- function(X1) {
  D1 = (X1 == 0)
  colSums(D1)
  colSums(D1, na.rm = TRUE)
}
ZerosPerVariable(Parasite)
# T???o hàm d???m zeros ho???c NA
VariableInfo <- function(X1, Choice1) {
  if (Choice1 == "Zeros"){ D1 = (X1 == 0) }
  if (Choice1 == "NAs") { D1 <- is.na(X1)}
  colSums(D1, na.rm = TRUE)
}
VariableInfo(Parasite, "Zeros")
VariableInfo(Parasite, "NAs")
# T???o hàm d???m zeros ho???c Na, và có nh???c nh??? khi nh???p sai tham s???
VariableInfo <- function(X1, Choice1 = "Zeros") {
  if (Choice1 == "Zeros"){ D1 = (X1 == 0) }
  if (Choice1 == "NAs") { D1 <- is.na(X1)}
  if (Choice1 != "Zeros" & Choice1 != "NAs") {
    print("You made a typo")} else {
      colSums(D1, na.rm = TRUE)}
}
VariableInfo(Parasite, "abracadabra")
###
Benthic <- read.table("C:/D??? li???u/RBook/RIKZ.txt",
                      header = TRUE)
Species <- Benthic[ , 2:76] # D???c d??? li???u c???t 2 d???n c???t 76
n <- dim(Species)# Kích thu???c d??? li???u v???a d???c
n
sum(Species[1, ], na.rm = TRUE) # C???ng t???t c??? d??? li???u hàng 1
sum(Species[2, ], na.rm = TRUE) # C???ng t???t c??? d??? li???u hàng 2
TA <- vector(length = n[1])   # T???o m???t vector kích thu???c b???ng s??? hàng d??? li???u
# C???ng t???t c??? các hàng d??? li???u
for (i in 1:n[1]){
  TA[i] <- sum(Species[i, ], na.rm = TRUE)
}
TA
# DÙng hàm có s???n d??? c???ng
TA <- rowSums(Species, na.rm = TRUE)
TA
# D???m s??? ph???n t??? có giá tr??? l???n hon 0
# sum s??? chuy???n TRUE thành giá tr??? 1 và FALSE thành giá tr??? 0
sum(Species[1, ] > 0, na.rm = TRUE)
sum(Species[2, ] > 0, na.rm = TRUE)

