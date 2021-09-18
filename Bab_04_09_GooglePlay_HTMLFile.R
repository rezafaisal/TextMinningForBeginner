setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)
library(tm)

rm(list = ls())

url="data/html/play_store.html"
webpage=read_html(url)

#mendapatkan review user
review_node=html_nodes(webpage,"span[jsname='bN97Pc']")
review_data=as.character(html_text(review_node))

main_data=cbind.data.frame(c(1:length(review_data)), review_data)
colnames(main_data) = c("doc_id", "text")

write.csv(main_data, "data/result/play_store.csv", row.names = FALSE)
