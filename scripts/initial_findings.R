library(tidyverse)

# upload csv file 
# name dataframe data
data <- read.csv("b1e_info_backup.csv")

# tidy data
head(data)
data$number <- NULL # use this function to remove unwanted columns from dataframe
data$name <- NULL
data$class <- NULL
data$date <- NULL
# there has to be a better way to do this

data_clean <- na.omit(data) # remove NA values added by excel
print(data_clean)

# plots

ggplot(data = data_clean) +
  geom_point(mapping = aes(x = proficiency, y = participant, color = level))

#
ggplot(data = data_clean) +
  geom_point(mapping = aes(x = proficiency, y = avg_eng_use)) +
  geom_smooth()
             
# mean
mean(data_clean$proficiency) # 66.85% the avg score of the lexTALE prof exam was 66.85%
mean(data_clean$avg_eng_use) # 10.52% on avg students reported speaking english 10.25% of the time on the BLP.