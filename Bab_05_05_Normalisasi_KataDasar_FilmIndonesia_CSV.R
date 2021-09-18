setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(katadasaR)

rm(list = ls())

main_data = read.csv("data/result/film_indonesia_processed.csv", stringsAsFactors = FALSE)

getKataDasar<-function(x) {
  str = unlist(strsplit(stripWhitespace(x), " "))
  str<-sapply(str,katadasaR)
  str<-paste(str,collapse = " ")
  return(str)
}

if(exists("main_data.processed")){
  rm("main_data.processed")
}

for(i in 1:nrow(main_data)){
  main_data[i,1] = getKataDasar(main_data[i,1])
}

write.csv(main_data, "data/result/film_indonesia_processed_katadasar.csv", row.names = FALSE)
