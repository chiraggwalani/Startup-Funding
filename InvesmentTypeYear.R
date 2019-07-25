library("sqldf")
library("plyr")
library("plotly")
setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")

filedf=data.frame(file)
filedf$IndustryVertical
  
totstartup=sqldf("SELECT IndustryVertical FROM filedf where Date between'2015-01-01' And '2015-12-31' ")
totstartup
totstartup1=sqldf("SELECT IndustryVertical FROM filedf where Date between'2016-01-01' And '2016-12-31' ")
totstartup1
totstartup2=sqldf("SELECT IndustryVertical FROM filedf where Date between'2017-01-01' And '2017-12-31' ")
totstartup2

dfcounver=data.frame(count(totstartup$IndustryVertical))
dfcounver
dfcounver1=data.frame(count(totstartup1$IndustryVertical))
dfcounver1
dfcounver2=data.frame(count(totstartup2$IndustryVertical))
dfcounver2
vertical=c("Consumer Internet","E-commerce","Others","Technology")
y15=c(272,102,109,110)
y16=c(533,169,101,190)
y17=c(228,61,33,121)

finaldf=data.frame(vertical,y15,y16,y17)
finaldf
p <- plot_ly(s, color = I("gray80")) %>%
  add_segments(x = ~finaldf$y15 ,xmid=~finaldf$y16,xend = ~finaldf$y17, y = ~finaldf$vertical, yend = ~finaldf$vertical, showlegend = FALSE) %>%
  add_markers(x = ~finaldf$y15, y = ~finaldf$vertical, name = "2015", color = I("pink")) %>%
  add_markers(x = ~finaldf$y16, y = ~finaldf$vertical, name = "2016", color = I("blue")) %>%
  add_markers(x = ~finaldf$y17, y = ~finaldf$vertical, name = "2017", color = I("red")) %>%
  
  layout(
    title = "Invesment Type By Year",
    xaxis = list(title = "Invesment Type"),
    margin = list(l = 65)
  )
p
