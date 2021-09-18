setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data = read.csv("data/csv/natural_disaster.csv", stringsAsFactors = FALSE)

data_text = cbind.data.frame(paste0(main_data$class_label,"_",rownames(main_data)), main_data$text)
colnames(data_text) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(data_text))
writeCorpus(corpus, path = "./data/result/natural_disaster")