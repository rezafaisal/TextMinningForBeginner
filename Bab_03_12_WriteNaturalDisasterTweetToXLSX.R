# referensi
# https://www.r-bloggers.com/2019/04/a-text-mining-function-for-websites/
# https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/text-mining-twitter-data-intro-r/

setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rtweet)
library(xlsx)

rm(list = ls())

natural_disaster <- search_tweets2(c("banjir", "gempa"), n = 100, lang = "id", include_rts = FALSE)

natural_disaster.banjir = cbind(natural_disaster[1:100,5], "banjir")
colnames(natural_disaster.banjir)[2] = "natural_disaster"

natural_disaster.gempa = cbind(natural_disaster[101:200,5], "gempa")
colnames(natural_disaster.gempa)[2] = "natural_disaster"

natural_disaster.all = rbind(natural_disaster.banjir, natural_disaster.gempa)

write.xlsx(natural_disaster.all, "natural_disaster.xlsx", append = FALSE, row.names = FALSE)
