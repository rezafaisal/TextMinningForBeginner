setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

folder.positive = file.path(".", "data", "imdb", "positive")
folder.negative = file.path(".", "data", "imdb", "negative")

corpus.positive = VCorpus(DirSource(folder.positive), readerControl = list(reader=readPlain))
corpus.negative = VCorpus(DirSource(folder.negative), readerControl = list(reader=readPlain))

corpus.imdb = c(corpus.positive, corpus.negative)
