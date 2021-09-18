setwd("D:/Data/My Books/Data Science - Text Mining/code")

rm(list = ls())

library(tm)

main_data = read.csv("data/result/tayangan_tv_indonesia_processed.csv", stringsAsFactors = FALSE)
main_data.training = main_data[1:320,]
main_data.testing = main_data[321:400,]

#data training - start
main_data.training.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data.training))), main_data.training$text)
colnames(main_data.training.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.training.corpus[,1:2]))

dtm_tf_raw = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightTf(x)))
dtm_tf_binary = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightBin(x)))

main_data.tf = cbind.data.frame(as.data.frame(as.matrix(dtm_tf_raw)), main_data.training$class_label)
colnames(main_data.tf)[ncol(main_data.tf)] = "class_label"

main_data.binary = cbind.data.frame(as.data.frame(as.matrix(dtm_tf_binary)), main_data.training$class_label)
colnames(main_data.binary)[ncol(main_data.binary)] = "class_label"

main_data.positive = main_data.binary[which(main_data.binary$class_label == "positive"), ]
main_data.negative = main_data.binary[which(main_data.binary$class_label == "negative"), ]

Np = nrow(main_data.positive)
Nn = nrow(main_data.negative)

for(i in 1:nrow(main_data.tf)){
  for(j in 1:ncol(main_data.tf)-1){
    A = sum(main_data.positive[,j])
    C = sum(main_data.negative[,j])

    if(i !=0 && j!=0){
      main_data.tf[i,j] = round(main_data.tf[i,j] * (log2((Np*C+0.5)/(Nn*A+0.5))),2)
    }
    
  }
}
#data training - end

#data testing - start
main_data.template = main_data.tf[FALSE,]

main_data.testing.corpus = cbind.data.frame(paste0("doc_",c(1:nrow(main_data.testing))), main_data.testing$text)
colnames(main_data.testing.corpus) = c("doc_id", "text")

corpus = VCorpus(DataframeSource(main_data.testing.corpus[,1:2]))

dtm_tf_raw.testing = DocumentTermMatrix(corpus, control = list(weighting = function(x) weightTf(x)))
main_data.testing.tf = cbind.data.frame(as.data.frame(as.matrix(dtm_tf_raw.testing)), main_data.testing$class_label)
colnames(main_data.testing.tf)[ncol(main_data.testing.tf)] = "class_label"

for(i in 1:nrow(main_data.testing.tf)){
  main_data.template[i,]=0
}

for(col_i in colnames(main_data.template)){
  if(col_i %in% colnames(main_data.testing.tf)) {
    main_data.template[,col_i] = main_data.testing.tf[,col_i]
  }
}
main_data.testing.tf = main_data.template

for(i in 1:nrow(main_data.testing.tf)){
  for(j in 1:ncol(main_data.testing.tf)-1){
    A = sum(main_data.positive[,j])
    C = sum(main_data.negative[,j])

    if(i !=0 && j!=0){
      main_data.testing.tf[i,j] = round(main_data.testing.tf[i,j] * (log2((Np*C+0.5)/(Nn*A+0.5))),2)
    }
    
  }
}
#data testing - end

write.csv(main_data.tf, "data/result/tv_indonesia_delta_tfidf-training.csv", row.names = FALSE)
write.csv(main_data.testing.tf, "data/result/tv_indonesia_delta_tfidf-testing.csv", row.names = FALSE)
