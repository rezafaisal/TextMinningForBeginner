setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(sentimentr)
library(lexicon)

rm(list = ls())

main_data = read.csv("data/result/natural_disaster_processed.csv", stringsAsFactors = FALSE)
main_data = main_data[1:20,]

if(exists("sentimen_all")){
  rm("sentimen_all")
}

for(i in 1:nrow(main_data)){
  print(i)
  item_i = main_data[i,]
  item_text = item_i$text
  
  sentiment.data = sentiment(item_text, polarity_dt = hash_sentiment_nrc)
  sentiment.number = sentiment.data$sentiment
  sentiment.value = "netral"
  if(sentiment.number > 0){
    sentiment.value = "positive"
  } else if (sentiment.number < 0) {
    sentiment.value = "negative"
  }
  
  item_sentiment = c(sentiment.number, sentiment.value)
  
  if(!exists("sentimen_all")){
    assign("sentimen_all", item_sentiment)
  } else {
    sentimen_all = rbind(sentimen_all, item_sentiment)
  }
}

colnames(sentimen_all) = c("sentiment_number","sentiment_value")
main_data.sentiment = cbind(main_data, sentimen_all)
