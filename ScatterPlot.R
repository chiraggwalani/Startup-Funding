library("plotly")
library(data.table)
library("plyr")
setwd("C:/Users/Chirag/Desktop")
file=read.csv("startup_funding.csv")
dt = data.table(file)
dt[, IndustryVertical := as.character(IndustryVertical)][IndustryVertical == "Consumer Internet", IndustryVertical := "1"][IndustryVertical == "Education", IndustryVertical := "2"][IndustryVertical == "E-Commerce", IndustryVertical := "3"][IndustryVertical == "FMCG", IndustryVertical := "4"][IndustryVertical == "Finance", IndustryVertical := "5"][IndustryVertical == "Healthcare", IndustryVertical := "6"][IndustryVertical == "Logistics", IndustryVertical := "7"][IndustryVertical == "Others", IndustryVertical := "8"][IndustryVertical == "Technology", IndustryVertical := "9"]
x=head(dt$AmountInUSD,n=50)
y=head(dt$IndustryVertical,n=50)

p <- plot_ly(dt, x = ~dt$AmountInUSD, y = ~dt$IndustryVertical,type="scatter",
             marker = list(size = 10,
                           color = 'rgba(255, 182, 193, .9)',
                           line = list(color = 'rgba(152, 0, 0, .8)',
                                       width = 2))) %>%
  layout(title = 'Amount Funded On Categories',
         yaxis = list(zeroline = FALSE),
         xaxis = list(zeroline = FALSE))
p
