setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data = read.csv("data/result/play_store.csv", stringsAsFactors = FALSE)
main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$text)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

#membersihkan teks
corpus.processed = tm_map(corpus, stripWhitespace)

#mengubah jadi huruf kecil
corpus.processed = tm_map(corpus.processed, content_transformer(tolower))

#menghapus tanda baca
corpus.processed = tm_map(corpus.processed, removePunctuation)

#menghapus angka
corpus.processed = tm_map(corpus.processed, removeNumbers)

#menghapus stop words
corpus.processed = tm_map(corpus.processed, removeWords, stopwords("en"))

corpus.df = data.frame(text = unlist(sapply(corpus.processed, '[', "content")), stringsAsFactors = FALSE)
main_data.processed = cbind.data.frame(main_data$doc_id, corpus.df)
colnames(main_data.processed) = c("text", "class_label")

write.csv(main_data.processed, "data/result/play_store_processed.csv", row.names = FALSE)
