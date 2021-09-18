setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(readtext)

rm(list = ls())

main_data.positive = readtext("data/imdb/positive")
main_data.positive = cbind(main_data.positive, "positive")
colnames(main_data.positive)[3] = "class_label"

main_data.negative = readtext("data/imdb/negative")
main_data.negative = cbind(main_data.negative, "negative")
colnames(main_data.negative)[3] = "class_label"

main_data = rbind(main_data.positive, main_data.negative)
main_data = main_data[,-1]
