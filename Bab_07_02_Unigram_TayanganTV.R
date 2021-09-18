setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data = read.csv("data/result/tayangan_tv_indonesia_processed.csv", stringsAsFactors = FALSE)

main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$text)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

dtm = DocumentTermMatrix(corpus)

main_data.unigram = cbind.data.frame(as.data.frame(as.matrix(dtm)), main_data$class_label)
colnames(main_data.unigram)[ncol(main_data.unigram)] = "class_label"

write.csv(main_data.unigram, "data/ngram/tayangan_tv_indonesia_unigram.csv", row.names = FALSE)
