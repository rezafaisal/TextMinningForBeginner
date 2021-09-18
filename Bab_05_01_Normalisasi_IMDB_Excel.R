setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)
library(xlsx)

rm(list = ls())

main_data = read.xlsx("data/result/movie_review.xlsx", sheetName = "review")
main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$movie_review)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

#membersihkan teks
corpus.processed = tm_map(corpus, stripWhitespace)

cleanHTMLCode<-function(x) {
  return(gsub(pattern = "<.*>", replacement = "", x))
}
corpus.processed = tm_map(corpus.processed, content_transformer(cleanHTMLCode))

#mengubah jadi huruf kecil
corpus.processed = tm_map(corpus.processed, content_transformer(tolower))

#menghapus tanda baca
corpus.processed = tm_map(corpus.processed, removePunctuation)

#menghapus angka
corpus.processed = tm_map(corpus.processed, removeNumbers)

#menghapus stop words
corpus.processed = tm_map(corpus.processed, removeWords, stopwords("en"))

corpus.df = data.frame(text = unlist(sapply(corpus.processed, '[', "content")), stringsAsFactors = FALSE)
main_data.processed = cbind.data.frame(corpus.df, main_data$class_label)
colnames(main_data.processed) = c("movie_review", "class_label")

write.xlsx(main_data.processed, "data/result/movie_review_processed.xlsx", sheetName = "review", append = FALSE, row.names = FALSE)
#tokenisasi

# Pre Processing
# documents <- tm_map(documents, content_transformer(tolower))
# documents <- tm_map(documents, removePunctuation)
# documents <- tm_map(documents, stripWhitespace)
# documents <- tm_map(documents, removeNumbers)
# 
# documents <- tm_map(documents, stripWhitespace)
# documents <- tm_map(documents, removeWords, stopwords("english"))
# documents <- tm_map(documents, stripWhitespace)
# documents <- tm_map(documents, stemDocument, language = "english")
# 
# documents <- tm_map(documents, stripWhitespace)
# documents <- tm_map(documents, removeWords, stopwords("english"))