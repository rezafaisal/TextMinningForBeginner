setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data = read.csv("data/result/tayangan_tv_indonesia_processed.csv", stringsAsFactors = FALSE)
main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$text)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

tdm = TermDocumentMatrix(corpus,control=list(weighting=weightTf))
tdm.matrix = as.matrix(tdm)
term.freq = rowSums(tdm.matrix)
freq.df = data.frame(word=names(term.freq), frequency=term.freq)
freq.df = freq.df[order(freq.df[,2], decreasing=T),]
print(freq.df[1:20,])
