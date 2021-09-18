setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(xlsx)
library(tm)

rm(list = ls())

data_imdb =read.xlsx("imdb.xlsx", sheetName = "data")

data_imdb.text = data_imdb$text
data_imdb.corpus = VCorpus(VectorSource(data_imdb.text))

# Mengubah Teks Menjadi Huruf Kecil
data_imdb.corpus = tm_map(data_imdb.corpus, content_transformer(tolower))

#Menghapus Karakter Spesial
data_imdb.corpus = tm_map(data_imdb.corpus, content_transformer(removePunctuation))
data_imdb.corpus = tm_map(data_imdb.corpus, content_transformer(removeNumbers))

# Menghapus Stopword
data_imdb.corpus = tm_map(data_imdb.corpus, removeWords, stopwords("indonesia"))

# Mengubah Menjadi Kata Dasar
data_imdb.corpus = tm_map(data_imdb.corpus, stemDocument, language = "english")

data_imdb.corpus = tm_map(data_imdb.corpus, stripWhitespace)
