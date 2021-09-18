# referensi
# https://www.r-bloggers.com/2019/04/a-text-mining-function-for-websites/
# https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/text-mining-twitter-data-intro-r/
# https://www.nurandi.id/blog/web-scraping-dengan-r-dan-rvest/

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)

rm(list = ls())

web_page = read_html("https://sport.detik.com/sepakbola/liga-inggris/d-5228245/liverpool-dekati-ozan-kabak-calon-pengganti-van-dijk")

news_title = web_page %>% html_node("h1") %>% html_text()
news_content = web_page %>% html_nodes("#detikdetailtext p") %>% html_text(trim = TRUE)

news_content.all = "";
for(el in news_content) {
  news_content.all = paste(news_content.all, el)
}

print(news_title)
print(news_content.all)
