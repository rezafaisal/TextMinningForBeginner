# referensi
# https://www.r-bloggers.com/2019/04/a-text-mining-function-for-websites/
# https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/text-mining-twitter-data-intro-r/
# https://www.nurandi.id/blog/web-scraping-dengan-r-dan-rvest/

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)

rm(list = ls())

data_url = read.csv("data/url/sport_news_urls.csv", stringsAsFactors = FALSE)

if(exists("main_data")){
  rm("main_data")
}

for(i in 1:nrow(data_url)) {
  url = data_url[i,1]
  
  web_page = read_html(url)
  news_title = web_page %>% html_node("h1") %>% html_text()
  news_content = web_page %>% html_nodes("#detikdetailtext p") %>% html_text(trim = TRUE)

  news_content.all = "";
  for(el in news_content) {
    news_content.all = paste(news_content.all, el)
  }

  if(!exists("main_data")) {
    assign("main_data", c(news_title, news_content.all))
  } else {
    main_data = rbind(main_data, c(news_title, news_content.all))
  }
}

colnames(main_data) = c("title", "content")
rownames(main_data) = c(1:nrow(main_data))

View(main_data)
