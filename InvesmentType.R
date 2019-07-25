library("plyr")
library("sqldf")
library("plotly")
setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")

filedf=data.frame(file)
filedf$InvestmentType

totstartup=sqldf("SELECT InvestmentType FROM filedf")
totstartup
dfinvtype=data.frame(count(totstartup$InvestmentType))
dfinvtype

p <- plot_ly(dfinvtype, x = ~dfinvtype$x, y = ~dfinvtype$freq, type = 'bar',text =~dfinvtype$freq , textposition = 'auto',
             marker = list(color = c('rgba(204,204,204,1)','rgba(222,45,38,0.8)'))) %>%
  layout(title = "Startup Funding Types",
         xaxis = list(title = "Invesment Type"),
         yaxis = list(title = "No of StartUps"))


p

