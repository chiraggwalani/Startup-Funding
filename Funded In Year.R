
install.packages("sqldf")
library("sqldf")
library("plotly")
library("plyr")
setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")
filedf=data.frame(file)
filedf$Date
a2015=sqldf("select industryVertical,date from filedf  where Date BETWEEN '2015-01-01' AND '2015-12-31' ")
df=data.frame(count(a2015$IndustryVertical))
df
a2016=sqldf("select industryVertical,date from filedf  where Date BETWEEN '2016-01-01' AND '2016-12-31' ")
df2=data.frame(count(a2016$IndustryVertical))
df2
a2017=sqldf("select industryVertical,date from filedf  where Date BETWEEN '2017-01-01' AND '2017-12-31' ")
df3=data.frame(count(a2017$IndustryVertical))
finaldf=data.frame(df,df2,df3)
finaldf

library("plotly")

p <- plot_ly(finaldf, x = ~finaldf$freq, y = ~finaldf$x, name = "2015", type = 'scatter',
             mode = "markers", marker = list(color = "pink")) %>%
  add_trace(x = ~finaldf$freq.1, y = ~finaldf$x, name = "2016",type = 'scatter',
            mode = "markers", marker = list(color = "blue")) %>%
  add_trace(x = ~finaldf$freq.2, y = ~finaldf$x, name = "2017",type = 'scatter',
            mode = "markers", marker = list(color = "red")) %>%
  layout(
    title = "Startups Category In diffrent Year",
    xaxis = list(title = "No of Startups"),
    yaxis = list(title = "Categories"),
    margin = list(l = 100)
  )
p
