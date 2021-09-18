setwd("D:/Data/My Books/Data Science - Text Mining/code")

rm(list = ls())

library(tm)

main_data = read.csv("data/csv/term_weight_class-all.csv")

corpus = VCorpus(DataframeSource(main_data[,1:2]))

dtm = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightTfIdf(x)))

main_data.unigram = cbind.data.frame(as.data.frame(as.matrix(dtm)), main_data$class_label)
colnames(main_data.unigram)[ncol(main_data.unigram)] = "class_label"
