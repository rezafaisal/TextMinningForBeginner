setwd("D:/Data/My Books/Data Science - Text Mining/code")

rm(list = ls())

data1 = iris[sample(nrow(iris), 10),]
table(data1$Species)

data2 = iris[1:10,]

data3 = rbind(data1, data2)
print(data3$Sepal.Width)

print(data3[, c(2,4,5)])
print(data3[13,])
print(data3[c(4,9,13),])
print(data3[7:11,])

data4 = data3[7:11, c(1,5)]
