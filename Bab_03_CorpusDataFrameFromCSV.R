setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

data_text = read.csv("data/csv/imdb.csv", stringsAsFactors = FALSE)
colnames(data_text) = c("doc_id", "text")

corpus = Corpus(DataframeSource(data_text))
