setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(readtext)

rm(list = ls())

main_data = readtext("data/ms_word")
View(main_data)