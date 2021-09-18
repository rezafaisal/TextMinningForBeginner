# referensi
# https://www.r-bloggers.com/2019/04/a-text-mining-function-for-websites/
# https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/text-mining-twitter-data-intro-r/
# https://www.nurandi.id/blog/web-scraping-dengan-r-dan-rvest/

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rvest)

rm(list = ls())

#web_page = read_html("https://sport.detik.com/sepakbola/liga-inggris/d-5226133/mourinho-suka-stadion-yang-sepi-tanpa-penonton-ini-katanya")
# web_page = read_html("https://sport.detik.com/sepakbola/liga-inggris/d-5225947/oezil-punya-opsi-opsi-ini-jika-mau-tinggalkan-arsenal-sekarang-juga")
web_page = read_html("https://sport.detik.com/sepakbola/liga-inggris/d-5228245/liverpool-dekati-ozan-kabak-calon-pengganti-van-dijk")

judul_element = html_node(web_page, ".jdl h1")
judul_text = html_text(judul_element, trim = TRUE)

judul_text = web_page %>% html_node(".jdl h1") %>% html_text(trim = TRUE)

isi = web_page %>% html_node("#detikdetailtext") %>% html_text(trim = TRUE)

judul = web_page %>% html_nodes(".jdl") %>% html_nodes("h1") %>% html_text(trim = TRUE)
waktu = web_page %>% html_nodes(".jdl") %>% html_nodes(".date") %>% html_text(trim = TRUE)
penulis = web_page %>% html_nodes(".jdl") %>% html_nodes(".author") %>% html_text(trim = TRUE)

isi = web_page %>% html_nodes("#detikdetailtext") %>% html_text(trim = TRUE)
