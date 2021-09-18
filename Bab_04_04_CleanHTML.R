setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(textclean)

rm(list = ls())

text_1 = "<b>Ozan</b> Kabak memang menjadi salah satu bek muda potensial di <a href="#">Liga Jerman</a> saat ini. Dia sudah membukukan 30 penampilan bersama Schalke sejak musim lalu dengan torehan tiga gol dan satu assist."

text_1.html = replace_html(text_1)
print(text_1.html)
