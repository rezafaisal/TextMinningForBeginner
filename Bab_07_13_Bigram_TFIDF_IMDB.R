setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)
library(xlsx)

rm(list = ls())

bigram_tokenizer = function(x) {
  unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE) 
}

main_data = read.xlsx("data/result/movie_review_processed.xlsx", sheetName = "review")

main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$movie_review)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

dtm = DocumentTermMatrix(corpus, control = list(tokenize = bigram_tokenizer, weighting = function(x) weightTfIdf(x)))

main_data.bigram = cbind.data.frame(as.data.frame(as.matrix(dtm)), main_data$class_label)
colnames(main_data.bigram)[ncol(main_data.bigram)] = "class_label"

write.csv(main_data.bigram, "data/ngram/movie_review_bigram_TFIDF.csv", row.names = FALSE)
