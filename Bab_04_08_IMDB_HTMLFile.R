#referensi: https://medium.com/@16611110/imdb-scraping-cleaning-and-visualization-in-r-cc03ea8f9909
#data: https://www.imdb.com/title/tt0903747/reviews?ref_=tt_urv

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)
library(tm)

rm(list = ls())

url="data/html/imdb.html"
webpage=read_html(url)

#mendapatkan rating
rating_node=html_nodes(webpage,'.rating-other-user-rating span:first-of-type')
rating_data=as.numeric(html_text(rating_node))

#mendapatkan review user
review_node=html_nodes(webpage,'.content div:first-of-type')
review_data=as.character(html_text(review_node))

main_data=cbind.data.frame(rating_data, review_data)
colnames(main_data) = c("rating", "text")

if(exists("main_data.class_label")){
  rm("main_data.class_label")  
}

for(i in 1:nrow(main_data)) {
  item_i = main_data[i,]
  
  class_label = "positive"
  if(item_i$rating < 7) {
    class_label = "negative"
  }
  
  if(!exists("main_data.class_label")){
    assign("main_data.class_label", class_label)
  } else {
    main_data.class_label = rbind(main_data.class_label, class_label)
  }
}

main_data = cbind.data.frame(main_data, main_data.class_label)
colnames(main_data) = c("rating", "text", "class_label")
rownames(main_data) = c(1:nrow(main_data))

write.csv(main_data, "data/result/imdb_mortal_kombat_from_file.csv", row.names = FALSE)
