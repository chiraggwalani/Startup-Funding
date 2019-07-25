?tibble
library("tibble")
library("sqldf")
library("plotly")
setwd("C:/Users/Chirag/Desktop")
rawdata<-read.csv("startup_funding.csv")
rawdata$AmountInUSD
totstartup=sqldf("SELECT startupname FROM rawdata GROUP BY startupname HAVING COUNT(*) > 1")
totstartup

c=unique(rawdata["StartupName"])


rawlength=nrow(rawdata)
rawlength=rawlength+1
rawlength
ch=1
mylist <- list()
while(ch!=rawlength){
  key<-rawdata$StartupName[ch]
  value<-rawdata$AmountInUSD[ch]
  key=toString(key)
  names(mylist)
  
  if(key %in% names(mylist)==TRUE){
    mylist[[key]]=mylist[[key]]+value
  }
  else {
    mylist[[ key ]] <- value
  }
  ch=ch+1
}
mylist
mylistdf<-enframe(mylist)
Amount=mylistdf$value
Amount=as.integer(Amount,digits=16)
Startupname=names(mylist)
newdf=data.frame(Startupname,Amount)
newdf
val=sqldf("select Amount from newdf order by Amount desc ")
val

library("plyr")
dfcount=data.frame(count(val))
dfcount
am1=sqldf("select count(Amount) from newdf where Amount>=10000001 ")
am50=sqldf("select count(Amount) from newdf where Amount between 5000001 and 10000000 ")
am25=sqldf("select count(Amount) from newdf where Amount  between 500001 and 5000000")
am0=sqldf("select count(Amount) from newdf where Amount<=500000 ")

r=rbind(am1,am50,am25,am0)
n=c("More Than 1 Crore","50Lakh to 1 Crore","5Lakh to 50 Lakh","Less Then 5Lakh")
df=data.frame(r,n)

p <- plot_ly(df, x = ~df$n, y = ~df$count.Amount., type = 'bar','rgba(204,204,204,1)',textposition = 'inside',
             insidetextfont = list(color = '#FFFFFF'),
             text = ~paste(df$count.Amount.),
             marker = list(color = c('rgba(204,204,204,1)'
     , 'rgba(222,45,38,0.8)', 'rgba(222,45,38,0.8)'))) %>%
  layout(title = "Amount Of Funding In USD",
         xaxis = list(title = "Amount "),
         yaxis = list(title = "No of Startups"))
p

