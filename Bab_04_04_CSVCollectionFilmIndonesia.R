setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data = read.csv("data/csv/film_indonesia.csv", stringsAsFactors = FALSE)

data_text = cbind.data.frame(paste0(main_data$Sentiment,"_",rownames(main_data)), main_data$Text.Tweet)
colnames(data_text) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(data_text))