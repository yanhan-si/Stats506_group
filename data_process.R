# This script is used to process the raw dataset
library(tidyverse)
library(readr)

data = read_csv("Churn_Modelling.csv")
names(data)
data = data %>% select(-RowNumber,-CustomerId,-Surname)
data[!complete.cases(data),]
head(data)
write_csv(data, "Churn_Modelling_Cleaned.csv")
