setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data = read.csv("data/result/tweet_bmkg_processed.csv", stringsAsFactors = FALSE)

corpus = VCorpus(DataframeSource(main_data))

dtm = DocumentTermMatrix(corpus)

main_data.unigram = as.data.frame(as.matrix(dtm))

write.csv(main_data.unigram, "data/ngram/bmkg_unigram.csv", row.names = FALSE)
