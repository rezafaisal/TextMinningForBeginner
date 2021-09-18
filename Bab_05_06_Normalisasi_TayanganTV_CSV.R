setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data = read.csv("data/csv/tayangan_tv_indonesia.csv", stringsAsFactors = FALSE)
main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$Text.Tweet)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

#membersihkan teks
corpus.processed = tm_map(corpus, stripWhitespace)

removeUser<-function(x) {
  return(gsub("@\\w+", "", x))
}
corpus.processed = tm_map(corpus.processed, content_transformer(removeUser))

cleanURL<-function(x) {
  return(gsub("(f|ht)tp(s?)://\\S+", "", x, perl=T))
}
corpus.processed = tm_map(corpus.processed, content_transformer(cleanURL))

cleanHashtag<-function(x) {
  return(gsub('#\\S+', '', x))
}
corpus.processed = tm_map(corpus.processed, content_transformer(cleanHashtag))

#mengubah jadi huruf kecil
corpus.processed = tm_map(corpus.processed, content_transformer(tolower))

#menghapus tanda baca
corpus.processed = tm_map(corpus.processed, removePunctuation)

#menghapus angka
corpus.processed = tm_map(corpus.processed, removeNumbers)

#menghapus stop words
stopwords.id=readLines("data/stopword/tala-masdevid.txt")
corpus.processed = tm_map(corpus.processed, removeWords, stopwords.id)
corpus.processed = tm_map(corpus.processed, stripWhitespace)

corpus.df = data.frame(text = unlist(sapply(corpus.processed, '[', "content")), stringsAsFactors = FALSE)
main_data.processed = cbind.data.frame(corpus.df, main_data$Sentiment)
colnames(main_data.processed) = c("text", "class_label")

write.csv(main_data.processed, "data/result/tayangan_tv_indonesia_processed.csv", row.names = FALSE)