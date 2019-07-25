library("sqldf")
library("plotly")
library("plyr")

setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")
filedf=data.frame(file)
filedf$InvestorsName
totstartup=sqldf("SELECT InvestorsName FROM filedf")
x=count(totstartup)

library(stringr)
x=str_split_fixed(totstartup$InvestorsName, ",",7)
x=count(x)
df=count(x$x.1)
df1=sqldf("SELECT * FROM df where freq > 3 order by freq  ")
df1
x2=count(df1$freq)
x2
x2=data.frame(x2)
col=c('rgba(204,204,204,1)','rgba(222,45,38,0.8)','rgba(204,204,204,1)','rgba(222,45,38,0.8)','rgba(204,204,204,1)','rgba(222,45,38,0.8)','rgba(204,204,204,1)','rgba(222,45,38,0.8)','rgba(204,204,204,1)','rgba(222,45,38,0.8)','rgba(204,204,204,1)','rgba(222,45,38,0.8)')
p <- plot_ly(x2, x = ~x2$x, y = ~x2$freq, type = 'bar',text ="" , textposition = 'auto',
             marker = list(color =col )) %>%
  layout(title = "Investor Invested in Startups",
         xaxis = list(title ="No of StartUps" ),
         yaxis = list(title = "No of Investor"))
p
