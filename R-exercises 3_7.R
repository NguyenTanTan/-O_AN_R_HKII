setwd("C:/CODE/RBook")
## Bài 2
# D???c d??? li???u
ISIT <- read.table(file = "ISIT.txt", header= TRUE, dec = ".")
names(ISIT)
str(ISIT)
#Extract the data from station 1
ISIT.Station1 <- ISIT[ISIT$Station ==1,]
ISIT.Station1
names(ISIT.Station1)
str(ISIT.Station1)
#How many observations were made at this station
nrow(ISIT.Station1)
# minimum, median, mean, maximum sampled depth 
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
#Ki???m tra station nào ít hon
tapply(ISIT$Station, INDEX = ISIT$Station,length)
#T???o dataframe m??? lo???i b??? station ít hon
ISIT2 <- ISIT[ISIT$Station!=4 & ISIT$Station!=5 ,]
ISIT2
#Extract the data from 2002
Year2002 <- ISIT2[ISIT2$Year ==2002,]
#Extract the data from April (of all years)
AllYear <- ISIT2[ISIT2$Month ==4,]
#Extract the data that were measured at depths greater 
#than 2000 meters (from all years and months)
ISIT2Depth2000 <- ISIT2[ISIT2$SampleDepth >2000,]
#Show the data according to increasing depth values
I1 <- order(ISIT2Depth2000$SampleDepth)
showdata <-ISIT2Depth2000[I1,]
#Show the data that were measured at depths greater 
#than 2000 meters in April
E3 <- ISIT2[ISIT2$Month ==4 & ISIT2$SampleDepth >2000,]

#Exercise 3. Using the write.table function 
#with deep sea research data.
write.table(E3, file="ISITDepth2000April.txt")

#Exercise 4.
#Create a new variable inside ISIT
# New variables Month
ISIT$NewMoth <- NA
ISIT$Station<=5
ISIT$NewMoth[ISIT$Station<=5]
ISIT$NewMoth[ISIT$Station <=5] <- "April"
ISIT$NewMoth[ISIT$Station > 5 & ISIT$Station<=11] <- "August"
ISIT$NewMoth[ISIT$Station > 11 & ISIT$Station<=15] <- "March"
ISIT$NewMoth[ISIT$Station >= 16 & ISIT$Station<=19] <- "October"
ISIT$NewMoth
ISIT$NewMoth <- factor(ISIT$NewMoth)
# New variables Year
ISIT$NewYear <- NA
ISIT$NewYear[ISIT$Station <=11] <- 2001
ISIT$NewYear[ISIT$Station  >=12 & ISIT$Station<=29] <- 2002
ISIT$NewYear
ISIT$NewYear <- factor(ISIT$NewYear)

