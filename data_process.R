# This script is used to process the raw dataset
library(tidyverse)
library(readr)
path = "./data"
file_name = sprintf('%s/Churn_Modelling.csv', path)
out_file_name = sprintf('%s/Churn_Modelling_Cleaned.csv', path)
data = read_csv(file_name)
names(data)
data = data %>% select(-RowNumber,-CustomerId,-Surname)
data[!complete.cases(data),]
head(data)
write_csv(data, out_file_name)
