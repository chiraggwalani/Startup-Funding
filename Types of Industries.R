library("plyr")
library("plotly")
library("sqldf")
setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")
nrow(file)
filedf=data.frame(file)
filedf

totstartup=sqldf("SELECT distinct StartupName,IndustryVertical FROM filedf")
totstartup
dfcounver=data.frame(count(totstartup$IndustryVertical))

p <- plot_ly(dfcounver, labels = ~dfcounver$x, values = ~dfcounver$freq, type = 'pie',
             textposition = 'inside',
             textinfo = 'label+percent',
             insidetextfont = list(color = '#FFFFFF'),
             hoverinfo = 'text',
             text = ~paste( dfcounver$freq, 'StartUps'),
             marker = list(colors = colors,
                           line = list(color = '#FFFFFF', width = 1)),
             #The 'pull' attribute can also be used to create space between the sectors
             showlegend = FALSE)%>%
  layout(title = 'Strat-Ups Funded by Categories',
         xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
         yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
p

