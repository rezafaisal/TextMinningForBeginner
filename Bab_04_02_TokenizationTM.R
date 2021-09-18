setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

text_sample_1 = "  Selamat ulang    tahun ke 20, SELAMAT ULANG TAHUN semoga panjang umur.     Silakan kuenya dimakan!"

result1 = Boost_tokenizer(text_sample_1)
result2 = scan_tokenizer(text_sample_1)
result3 = MC_tokenizer(text_sample_1)

