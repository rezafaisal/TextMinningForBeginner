setwd("D:/Data/My Books/Data Science - Text Mining/code")

rm(list = ls())

library(tm)
library(xlsx)

main_data = read.xlsx("data/result/movie_review_processed.xlsx", sheetName = "review")

#membuat corpus
main_data.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data))), main_data$movie_review)
colnames(main_data.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.corpus))

#membuat DTM
dtm_tf_raw = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightTf(x)))
dtm_tf_binary = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightBin(x)))

#membuat DTM -> Data Frame
main_data.tf = cbind.data.frame(as.data.frame(as.matrix(dtm_tf_raw)), main_data$class_label)
colnames(main_data.tf)[ncol(main_data.tf)] = "class_label"

main_data.binary = cbind.data.frame(as.data.frame(as.matrix(dtm_tf_binary)), main_data$class_label)
colnames(main_data.binary)[ncol(main_data.binary)] = "class_label"

#data training - start
main_data.binary.training = main_data.binary[1:150,]
main_data.tf.training = main_data.tf[1:150,]

main_data.positive.training = main_data.binary[which(main_data.binary.training$class_label == "positive"), ]
main_data.negative.training = main_data.binary[which(main_data.binary.training$class_label == "negative"), ]

Np = nrow(main_data.positive.training)
Nn = nrow(main_data.negative.training)

for(i in 1:nrow(main_data.tf.training)){
  for(j in 1:ncol(main_data.tf.training)-1){
    A = sum(main_data.positive.training[,j])
    C = sum(main_data.negative.training[,j])

    if(i !=0 && j!=0){
      main_data.tf.training[i,j] = round(main_data.tf.training[i,j] * (log2((Np*C+0.5)/(Nn*A+0.5))),2)
    }
  }
}
#data training - end

#data testing - start
main_data.tf.testing = main_data.tf[151:200,]

for(i in 1:nrow(main_data.tf.testing)){
  for(j in 1:ncol(main_data.tf.testing)-1){
    A = sum(main_data.positive.training[,j])
    C = sum(main_data.negative.training[,j])

    if(i !=0 && j!=0){
      main_data.tf.testing[i,j] = round(main_data.tf.testing[i,j] * (log2((Np*C+0.5)/(Nn*A+0.5))),2)
    }
    
  }
}
#data testing - end