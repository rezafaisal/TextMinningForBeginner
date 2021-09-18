# referensi
# https://www.r-bloggers.com/2019/04/a-text-mining-function-for-websites/
# https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/text-mining-twitter-data-intro-r/
# https://www.nurandi.id/blog/web-scraping-dengan-r-dan-rvest/

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)

rm(list = ls())

web_page = read_html("data/html/index.html")

judul_element = html_node(web_page, "h1")
judul_text = html_text(judul_element, trim = TRUE)
print(judul_text)

author_element = html_node(web_page, ".author")
author_text = html_text(author_element, trim = TRUE)
print(author_text)

isi_element = html_node(web_page, "#isi")
isi_text = html_text(isi_element, trim = TRUE)
print(isi_text)