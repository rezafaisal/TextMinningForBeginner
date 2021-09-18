setwd("D:/Data/My Books/Data Science - Text Mining/code")

rm(list = ls())

unclean_tweet = "RT @Fathul_Patoel @MeowThwack angin, gempa, beban hidup, dan hentakan tidak menggoyahkan gedung. hanya api rokok. https://t.co/FHpzdyAWpy"

#membersihkan RT dan via
clean_tweet = gsub("(RT|via)", "", unclean_tweet)
print(clean_tweet)

#membersihkan nama user / string yang diawali dengan tanda @
clean_tweet = gsub("((?:\\b\\W*@\\w+)+)", "", clean_tweet)
print(clean_tweet)

#menghapus string yang diawali dengan https://t.co
clean_tweet = gsub("https://t.co/[a-z,A-Z,0-9]*{8}", "", clean_tweet)
print(clean_tweet)

