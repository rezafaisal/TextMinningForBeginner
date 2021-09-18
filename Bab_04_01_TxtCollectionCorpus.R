setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

#menentukan folder file
folder.negative = file.path(".", "data", "imdb", "negative")
folder.positive = file.path(".", "data", "imdb", "positive")

#membaca file-file dan disimpan ke corpus
docs.negative = VCorpus(DirSource(folder.negative), readerControl = list(reader=readPlain))
docs.positive = VCorpus(DirSource(folder.positive), readerControl = list(reader=readPlain))

docs.all = c(docs.negative, docs.positive)