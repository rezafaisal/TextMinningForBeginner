#referensi: https://medium.com/@16611110/imdb-scraping-cleaning-and-visualization-in-r-cc03ea8f9909
#data: https://www.imdb.com/title/tt0903747/reviews?ref_=tt_urv

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)
library(tm)

rm(list = ls())

url="https://play.google.com/store/apps/details?id=com.chess&showAllReviews=true"
webpage=read_html(url)

#mendapatkan review user
comment_node=html_nodes(webpage,'.UD7Dzf')
comment_data=as.character(html_text(comment_node))

main_data = cbind.data.frame(rownames(review_data), review_data[,1])
colnames(main_data) = c("doc_id", "text")

write.csv(main_data, "data/result/bukalapak_review.csv", row.names = FALSE)