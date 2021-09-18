setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

bigram_tokenizer = function(x) {
  unlist(lapply(ngrams(words(x), 2), paste, collapse = " "), use.names = FALSE) 
}

main_data = read.csv("data/result/tweet_bmkg_processed.csv", stringsAsFactors = FALSE)

corpus = VCorpus(DataframeSource(main_data))

dtm = DocumentTermMatrix(corpus, control = list(tokenize = bigram_tokenizer))

main_data.bigram = as.data.frame(as.matrix(dtm))

write.csv(main_data.bigram, "data/ngram/bmkg_bigram.csv", row.names = FALSE)
