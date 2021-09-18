setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(tm)

rm(list = ls())

main_data.stopword = read.csv("data/stopwords/stopwords.csv", stringsAsFactors = FALSE)
unclean_text = "nasi goreng ini enak. saya mau makan lagi nanti."
print(unclean_text)

unclean_text = tolower(unclean_text)

token_text = as.data.frame(unlist(strsplit(unclean_text, "[[:space:]]")))

clean_text = ""
for(i in 1:nrow(token_text)){
  kata = token_text[i,1]
  
  is_in_stop_word = FALSE
  for(j in 1:nrow(main_data.stopword)) {
    stop_word = main_data.stopword[j,1]
    
    if(kata == stop_word) {
      is_in_stop_word = TRUE
    }
  }
  
  if(!is_in_stop_word) {
    clean_text = paste(clean_text, kata)
  }
}

print(clean_text)
