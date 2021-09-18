# referensi
# https://www.r-bloggers.com/2019/04/a-text-mining-function-for-websites/
# https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/text-mining-twitter-data-intro-r/
# https://www.nurandi.id/blog/web-scraping-dengan-r-dan-rvest/

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)

rm(list = ls())

web_page = read_html("data/html/index.html")

div_elements = web_page %>% html_nodes("div") 
for(el in div_elements){
  el_text = html_text(el)
  print(el_text)
}
