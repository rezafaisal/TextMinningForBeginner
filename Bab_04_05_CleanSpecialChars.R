setwd("D:/Data/My Books/Data Science - Text Mining/code")

rm(list = ls())

unclean_tweet = "Hello! Apakabar? #SelamatPagi @user1 & @user2. Sudah berapa % pekerjaannya?"

#membersihkan nama user / string yang diawali dengan tanda @
clean_tweet = gsub("((?:\\b\\W*@\\w+)+)", "", unclean_tweet)
print(clean_tweet)

#membersihkan RT dan via
clean_tweet = gsub("[[:punct:]]", "", clean_tweet)
print(clean_tweet)

