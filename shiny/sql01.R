# https://medium.com/predict/sql-equivalents-in-r-d1a4dfc27ab4
library(sqldf)
data(CO2)
str(CO2)
dim(CO2)
head(CO2)
#
sqldf('SELECT * FROM CO2 WHERE conc>400 AND uptake>40')
CO2_subset <- CO2[CO2$conc>400 & CO2$uptake>40,]
CO2_subset
#
sqldf('SELECT Plant, AVG(uptake) FROM CO2 GROUP BY Plant')
aggregate(x=CO2[,c("uptake")], by=data.frame(CO2$Plant), FUN="mean")
#
