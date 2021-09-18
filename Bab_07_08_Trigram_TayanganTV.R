setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

trigram_tokenizer = function(x) {
  unlist(lapply(ngrams(words(x), 3), paste, collapse = " "), use.names = FALSE) 
}

main_data = read.csv("data/result/tayangan_tv_indonesia_processed.csv", stringsAsFactors = FALSE)

main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$text)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

dtm = DocumentTermMatrix(corpus, control = list(tokenize = trigram_tokenizer))

main_data.trigram = cbind.data.frame(as.data.frame(as.matrix(dtm)), main_data$class_label)
colnames(main_data.trigram)[ncol(main_data.trigram)] = "class_label"

write.csv(main_data.trigram, "data/ngram/tayangan_tv_indonesia_trigram.csv", row.names = FALSE)
