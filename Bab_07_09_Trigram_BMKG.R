setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

trigram_tokenizer = function(x) {
  unlist(lapply(ngrams(words(x), 3), paste, collapse = " "), use.names = FALSE) 
}

main_data = read.csv("data/result/tweet_bmkg_processed.csv", stringsAsFactors = FALSE)

corpus = VCorpus(DataframeSource(main_data))

dtm = DocumentTermMatrix(corpus, control = list(tokenize = trigram_tokenizer))

main_data.trigram = as.data.frame(as.matrix(dtm))

write.csv(main_data.trigram, "data/ngram/bmkg_trigram.csv", row.names = FALSE)
