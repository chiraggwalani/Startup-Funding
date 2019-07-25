library("plyr")
library("sqldf")
library("plotly")
setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")

filedf=data.frame(file)
filedf

totstartup=sqldf("SELECT startupname,count(*) FROM filedf GROUP BY startupname HAVING COUNT(*)>1")
totstartup
dfstrt=data.frame(totstartup)
dfstrt
dfcount=data.frame(count(dfstrt$count...))
dfcount

p <- plot_ly(dfcount, labels = ~dfcount$x, values = ~dfcount$freq, type = 'pie',
             textposition = 'inside',
             textinfo = 'text',
             insidetextfont = list(color = '#FFFFFF'),
             text = ~paste( dfcount$freq, 'StartUps',dfcount$x,'Times'),
             marker = list(colors = colors,
                           line = list(color = '#FFFFFF', width = 1)),
             showlegend = FALSE)%>%
  layout(title = 'No of Times Strat-Ups Funded ',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p
