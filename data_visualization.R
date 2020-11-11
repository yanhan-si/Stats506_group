# This script is used to generate some descriptive summary statistics plots
# Author: Yanhan Si
# Nov 11, 2020
# 79: -------------------------------------------------------------------------
# libraries: ------------------------------------------------------------------
library(tidyverse)
library(ggplot2)
library(readr)
# data: -----------------------------------------------------------------------
path = "./data"
file_name = sprintf('%s/Churn_Modelling_Cleaned.csv', path)
data = read_csv(file_name)
# factoring: ------------------------------------------------------------------
names(data)
data = data %>% mutate(Exited = as.factor(Exited),
                       HasCrCard = as.factor(HasCrCard),
                       IsActiveMember = as.factor(IsActiveMember))
summary(data)
head(data)
data %>% ggplot(aes( CreditScore,color = Exited )) + geom_density()
data %>% ggplot(aes(x = Exited, y = Age, color = Gender)) + geom_boxplot()
data %>% ggplot(aes(x = Geography, y = Exited)) + geom_count()
data %>% ggplot(aes(x = Exited, y = HasCrCard, color = Gender)) +geom_count()
