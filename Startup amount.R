library("plyr")
library("sqldf")
library("plotly")
setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")

filedf=data.frame(file)
filedf
totstartup=sqldf("SELECT startupname FROM filedf GROUP BY startupname HAVING COUNT(*) > 1")
totstartup1=sqldf("SELECT AmountInUSD FROM filedf where startupname= '%s'",totstartup$StartupName)
totstartup1
dfstrt=data.frame(totstartup)
x=sum(dfstrt$AmountInUSD)
?sum

dfcount=data.frame(count(dfstrt$count...))
dfcount
getOption("max.print")
