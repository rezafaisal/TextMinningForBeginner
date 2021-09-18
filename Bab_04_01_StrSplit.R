setwd("D:/Data/My Books/Data Science - Text Mining/code")


rm(list = ls())

text_sample_1 = "Selamat ulang tahun, semoga panjang umur. Silakan kuenya dimakan!"
text_sample_2 = "  Selamat ulang    tahun, semoga panjang umur.     Silakan kuenya dimakan!"

result1 = unlist(strsplit(text_sample_1, " "))
result2 = unlist(strsplit(text_sample_1, "[[:space:]]"))

result3 = unlist(strsplit(text_sample_2, " "))
result4 = unlist(strsplit(text_sample_2, "[[:space:]]"))
