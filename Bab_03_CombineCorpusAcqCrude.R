setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

data("acq")
data("crude")
corpus_gabungan = c(acq, crude)
