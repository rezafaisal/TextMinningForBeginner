setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rtweet)
library(tm)

rm(list = ls())

online_data = search_tweets(q = "covid19", n = 1000, lang = "id", include_rts = FALSE)

online_data.corpus = cbind.data.frame(online_data$status_id, online_data$text)
colnames(online_data.corpus) = c("doc_id", "text")

#simpan data ke file
write.csv(online_data.corpus, "data/csv/tweet_covid19.csv", row.names = FALSE)

#membaca data dari file
main_data = read.csv("data/csv/tweet_covid19.csv", stringsAsFactors = FALSE)

#membuat corpus
corpus = VCorpus(DataframeSource(main_data))
