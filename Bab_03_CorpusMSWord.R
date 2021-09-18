setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

folder.ms_word = file.path(".", "data", "doc")
docs.ms_word = Corpus(DirSource(folder.ms_word), readerControl = list(reader=readDOC))

