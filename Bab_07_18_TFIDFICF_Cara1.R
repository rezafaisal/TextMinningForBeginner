setwd("D:/Data/My Books/Data Science - Text Mining/code")

rm(list = ls())

library(tm)

main_data = read.csv("data/csv/term_weight_class-all.csv")
main_data.training = main_data[1:5,]
main_data.testing = main_data[6,]

#data training - start
corpus = VCorpus(DataframeSource(main_data.training[,1:2]))

dtm_tf_idf = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightTfIdf(x)))

main_data.training.tfidf = cbind.data.frame(as.data.frame(as.matrix(dtm_tf_idf)), main_data.training$class_label)
colnames(main_data.training.tfidf)[ncol(main_data.training.tfidf)] = "class_label"

M = nrow(as.data.frame(table(main_data.training.tfidf$class_label)))

for(i in 1:nrow(main_data.training.tfidf)){
  for(j in 1:ncol(main_data.training.tfidf)-1){
    data_term = main_data.training.tfidf[which(main_data.training.tfidf[j] > 0),]
    CFt = nrow(as.data.frame(table(data_term$class_label)))

    if(i !=0 && j!=0){
      main_data.training.tfidf[i,j] = round((round(main_data.training.tfidf[i,j],2)*(1+log(M/CFt))),2)
    }
  }
}
#data training - end
