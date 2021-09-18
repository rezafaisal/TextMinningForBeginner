setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(readtext)

rm(list = ls())

data_file =readtext("data/ms_word/doc1.docx")

print("nama file:")
print(data_file$doc_id)

print("isi file")
print(data_file$text)


