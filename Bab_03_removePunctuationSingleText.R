setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

text = "halo apa kabar? semoga sehat selalu!"
text = removePunctuation(text)

print(text)