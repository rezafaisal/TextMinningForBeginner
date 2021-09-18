setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

folder.plain_text = file.path(".", "data", "plain_text")
docs.plain_text = Corpus(DirSource(folder.plain_text), readerControl = list(reader=readPlain))

