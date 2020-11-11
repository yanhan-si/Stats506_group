# This script is used to build the logistic model
# Author: Yanhan Si
# Nov 11, 2020
# 79: -------------------------------------------------------------------------
# libraries: ------------------------------------------------------------------
library(tidyverse)
library(ggplot2)
library(readr)
library(ResourceSelection)
# data: -----------------------------------------------------------------------
path = "./data"
file_name = sprintf('%s/Churn_Modelling_Cleaned.csv', path)
data = read_csv(file_name)
# factoring: ------------------------------------------------------------------
names(data)
data = data %>% mutate(Exited = as.factor(Exited),
                       HasCrCard = as.factor(HasCrCard),
                       IsActiveMember = as.factor(IsActiveMember))
# modeling: -------------------------------------------------------------------
model1 = glm(Exited ~ ., data = data, family = binomial(link="logit"))
summary(model1)
# Hosmer-Lemeshow Goodness of Fit Test: ---------------------------------------
hoslem.test(model1$y, model1$fitted.values, g = 10)
