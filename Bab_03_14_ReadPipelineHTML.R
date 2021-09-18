# referensi
# https://www.r-bloggers.com/2019/04/a-text-mining-function-for-websites/
# https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/text-mining-twitter-data-intro-r/
# https://www.nurandi.id/blog/web-scraping-dengan-r-dan-rvest/

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)

rm(list = ls())

web_page = read_html("data/html/index.html")

judul_text = web_page %>% html_node("h1") %>% html_text(trim = TRUE)
print(judul_text)

author_text = web_page %>% html_node(".author") %>% html_text()
print(author_text)

isi_text = web_page %>% html_node("#isi") %>% html_text(trim = TRUE)
print(isi_text)