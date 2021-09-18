setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(readtext)

data_file =readtext("data/plain_text/doc1.txt")

print("nama file:")
print(data_file$doc_id)

print("isi file")
print(data_file$text)


