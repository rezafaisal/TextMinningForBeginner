setwd("D:/Data/My Books/Data Science - Text Mining/code")

rm(list = ls())

main_data = read.csv("data/result/tayangan_tv_indonesia_processed.csv", stringsAsFactors = FALSE)
lexicon_inset = read.csv("data/lexicon/inset.csv", stringsAsFactors = FALSE)

if(exists("sentimen_all")){
  rm("sentimen_all")
}

for(i in 1:nrow(main_data)){
  print(i)
  item_i = main_data[i,]
  item_text = item_i$text
  
  #hitung sentiment - start
  sentiment.number = 0
  item_text.array = unlist(strsplit(item_text, " "))
  for(x in 1:length(item_text.array)){
    word_x = item_text.array[x]
    
    lexicon_x = lexicon_inset[which(lexicon_inset$x == word_x),]
    if(nrow(lexicon_x) > 0){
      sentiment.number = sentiment.number + lexicon_x[1,2]
    }
  }
  #hitung sentiment - end
  
  if(sentiment.number >= 0){
    sentiment.value = "positive"
  } else if (sentiment.number < 0) {
    sentiment.value = "negative"
  }
  
  if(!exists("sentimen_all")){
    assign("sentimen_all", sentiment.value)
  } else {
    sentimen_all = rbind(sentimen_all, sentiment.value)
  }
}

main_data.sentiment = cbind(main_data, sentimen_all)
colnames(main_data.sentiment)[ncol(main_data.sentiment)] = "prediction"

n_correct = 0
for(j in 1:nrow(main_data.sentiment)){
  item_j = main_data.sentiment[j,]
  
  if(item_j$prediction == item_j$class_label){
    n_correct = n_correct + 1
  }
}
print(paste("Jumlah prediksi benar:", n_correct))

