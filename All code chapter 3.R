setwd("C:/CODE/RBook")
Squid <- read.table(file = "squid.txt", header = TRUE)
names(Squid)
str(Squid)
Squid2 <- read.table(file = "squidGSI.txt",dec = ",", header = TRUE)
str(Squid2)
GSI
factor(Squid)
M1 <- lm(GSI~  factor(Location) + factor(Year),data = Squid)
mean(GSI, data = Squid)
Squid$GSI
Squid[, 6]

mean(Squid$GSI)
Ord1 <- order(Squid$Month)
Squid[Ord1, ]
Sample Year Month Location Sex GSI

Sq1 <- read.table(file = "squid1.txt",
                    header = TRUE)
Sq2 <- read.table(file = "squid2.txt",
                    header = TRUE)

 SquidMerged <- merge(Sq1, Sq2, by = "Sample")
SquidMerged
attach(Squid)
detach(Squid)
Squid$Sex
unique(Squid$Sex)
Sel <- Squid$Sex == 1
SquidM <- Squid[Sel, ]
Squid$fSex <- factor(Squid$Sex, levels = c(1, 2),
                     labels = c("M", "F"))
Squid$fSex




