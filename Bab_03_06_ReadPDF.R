setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(readtext)

rm(list = ls())

main_data = readtext("data/pdf")
View(main_data)