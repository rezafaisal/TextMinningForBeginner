setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(sentimentr)
library(lexicon)

rm(list = ls())

main_data = read.csv("data/result/natural_disaster_processed.csv", stringsAsFactors = FALSE)
main_data.text = paste(main_data$text, collapse = " ")

sentiment.nrc = sentiment(main_data.text, polarity_dt = hash_sentiment_nrc)
print("NRC")
print(sentiment.nrc)

sentiment.sentiword = sentiment(main_data.text, polarity_dt = hash_sentiment_sentiword)
print("Sentiword")
print(sentiment.sentiword)

sentiment.google = sentiment(main_data.text, polarity_dt = hash_sentiment_socal_google)
print("Google")
print(sentiment.google)