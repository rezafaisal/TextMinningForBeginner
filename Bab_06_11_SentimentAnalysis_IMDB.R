setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(sentimentr)
library(lexicon)
library(xlsx)

rm(list = ls())

main_data = read.xlsx("data/result/movie_review_processed.xlsx", sheetName = "review")

if(exists("sentimen_all")){
  rm("sentimen_all")
}

for(i in 1:nrow(main_data)){
  print(i)
  item_i = main_data[i,]
  item_text = item_i$movie_review
  
  sentiment.data = sentiment(item_text, polarity_dt = hash_sentiment_socal_google)
  sentiment.number = sentiment.data$sentiment
  if(sentiment.number >= 0){
    sentiment.value = "positive"
  } else if (sentiment.number < 0) {
    sentiment.value = "negative"
  }
  
  if(!exists("sentimen_all")){
    assign("sentimen_all", sentiment.value)
  } else {
    sentimen_all = rbind(sentimen_all, sentiment.value)
  }
}

main_data.sentiment = cbind(main_data, sentimen_all)
colnames(main_data.sentiment)[ncol(main_data.sentiment)] = "prediction"

n_correct = 0
for(j in 1:nrow(main_data.sentiment)){
  item_j = main_data.sentiment[j,]
  
  if(item_j$prediction == item_j$class_label){
    n_correct = n_correct + 1
  }
}
print(paste("Jumlah prediksi benar:", n_correct))