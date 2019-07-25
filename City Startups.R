library("plyr")
library("sqldf")
library("plotly")
setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")

filedf=data.frame(file)
filedf

totstartup=sqldf("SELECT distinct StartupName,cityLocation FROM filedf")
totstartup
dfcity=data.frame(count(totstartup$CityLocation))
dfcity


p <- plot_ly(dfcity, x = ~dfcity$x, y = ~dfcity$freq, type = 'bar', marker = list(color = 'rgb(49,130,189)'),textposition = 'inside',
             insidetextfont = list(color = '#FFFFFF'),
             text = ~paste( dfcity$freq),
             marker = list(colors = colors,
                           line = list(color = '#FFFFFF', width = 1)))%>%
  
  layout(title="Startup Location",
         xaxis = list(title = "City", tickangle = -45),
         yaxis = list(title = "No of Startups"),
         margin = list(b = 100),
         barmode = 'group')
p
