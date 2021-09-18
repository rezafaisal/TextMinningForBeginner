setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())
data("acq")

text = inspect(removePunctuation(acq[[1]]))

print(text)