setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

folder.pdf = file.path(".", "data", "pdf")
docs.pdf = Corpus(DirSource(folder.pdf), readerControl = list(reader=readPDF))

