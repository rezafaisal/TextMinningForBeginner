setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

data_text = c("txt1", "I went and saw this movie last night.")
data_text = rbind(data_text, c("txt2", "I knew of Ashton Kutcher he was only able to do comedy"))
data_text = rbind(data_text, c("txt3", "I was wrong"))
data_text = rbind(data_text, c("txt4", "This is one of my three all-time favorite movies"))
data_text = rbind(data_text, c("txt5", "My only quibble is that the director"))

data_text = as.data.frame(data_text)
rownames(data_text) = paste0("data_",1:nrow(data_text))
colnames(data_text) = c("doc_id", "text")

corpus = Corpus(DataframeSource(data_text))
