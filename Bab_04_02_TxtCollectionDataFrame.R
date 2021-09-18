setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)
library(xlsx)

rm(list = ls())

folder.negative = file.path(".", "data", "imdb", "negative")
folder.positive = file.path(".", "data", "imdb", "positive")

docs.negative = Corpus(DirSource(folder.negative), readerControl = list(reader=readPlain))
docs.positive = Corpus(DirSource(folder.positive), readerControl = list(reader=readPlain))

df.negative = data.frame(text = get("content", docs.negative))
df.positive = data.frame(text = get("content", docs.positive))

df.negative.label = cbind(df.negative, "negative")
df.positive.label = cbind(df.positive, "positive")

colnames(df.negative.label) = c("movie_review", "class_label")
colnames(df.positive.label) = c("movie_review", "class_label")

main_data = rbind.data.frame(df.negative.label, df.positive.label)

write.xlsx(main_data, "data/result/movie_review.xlsx", sheetName = "review", append = FALSE, row.names = FALSE)
