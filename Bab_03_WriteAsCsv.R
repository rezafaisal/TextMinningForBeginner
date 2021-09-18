setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rtweet)

timeline_data = get_timeline("@infobandung", n = 100)

write_as_csv(timeline_data, "timeline_data.csv")
