setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)
library(xlsx)

rm(list = ls())

main_data = read.xlsx("data/result/movie_review_processed.xlsx", sheetName = "review")

main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$movie_review)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

dtm = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightBin(x)))

main_data.unigram = cbind.data.frame(as.data.frame(as.matrix(dtm)), main_data$class_label)
colnames(main_data.unigram)[ncol(main_data.unigram)] = "class_label"

write.csv(main_data.unigram, "data/ngram/movie_review_unigram_tf_bin.csv", row.names = FALSE)
