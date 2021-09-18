setwd("D:/Data/My Books/Data Science - Text Mining/code")

library(rtweet)

users = c("@BDGPodcast", "@infobandung", "@BandungIKLAN")
timeline_data = get_timeline(users, n = 50)
View(timeline_data)
