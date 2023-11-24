# import neccessary library
library(readr)
library(tidyverse)
library(ggplot2)
library(dplyr)

# Load the dataset corresponding to the obesity
df <- read_csv("data_Q036.csv")
summary(df)
# Remove null value from 'VALUE' column
#data <- df[complete.cases(df$Data_Value),]
#drop "total" value from observation
#data <- subset(data, Stratification1 != "Total")


#Data visualization
#Percentage of people who have obesity based on the income  lavel
data %>% filter(StratificationCategoryId1 == "INC", Income!= "Data not reported") %>% ggplot(aes(x = Data_Value)) + geom_histogram(bins = 50, fill = 'red', col = 'blue')+facet_wrap(vars(Income), ncol = 2, nrow = 3)
#Percentage of people who have obesity based on the education level
data %>% filter(StratificationCategoryId1 == "EDU", Education != "Data not reported") %>% ggplot(aes(x = Data_Value)) + geom_boxplot(bins = 50, fill = 'red', col = 'blue')+facet_wrap(vars(Education), ncol = 2, nrow = 2)
# fill all na values with 0
data[is.na(data)] <- '0'

cat1 <- df %>% filter(StratificationCategoryId1 == "EDU")

