setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data = read.csv("data/csv/term_weight.csv", stringsAsFactors = FALSE)
corpus = VCorpus(DataframeSource(main_data))

dtm = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightTfIdf(x, normalize = FALSE)))

main_data.unigram = as.data.frame(as.matrix(dtm))
