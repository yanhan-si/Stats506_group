# This script is used to build the logistic model
# Author: Yanhan Si
# Nov 11, 2020
# 79: -------------------------------------------------------------------------
# libraries: ------------------------------------------------------------------
library(tidyverse)
library(ggplot2)
library(readr)
library(ResourceSelection)
library(jtools)
# data: -----------------------------------------------------------------------
path = "../data"
file_name = sprintf('%s/Churn_Modelling_Cleaned.csv', path)
data = read_csv(file_name)
# factoring: ------------------------------------------------------------------
data = data %>% mutate(Exited = as.factor(Exited),
                       HasCrCard = as.factor(HasCrCard),
                       IsActiveMember = as.factor(IsActiveMember))
# modeling
model1 = glm(Exited ~ ., data = data, family = binomial(link="logit"))
summ(model1)
model2 = glm(Exited ~ Geography + Gender + Age + Tenure + 
               NumOfProducts + HasCrCard + IsActiveMember, 
             data = data, 
             family = binomial(link="logit"))
summ(model2)
# Hosmer-Lemeshow Goodness of Fit Test: ---------------------------------------
hl1 = hoslem.test(model1$y, model1$fitted.values, g = 10)
hl1
cbind(hl1$expected, hl1$observed)
# Hosmer-Lemeshow Goodness of Fit Test: ---------------------------------------
hl2 = hoslem.test(model2$y, model2$fitted.values, g = 10)
hl2
cbind(hl2$expected, hl2$observed)