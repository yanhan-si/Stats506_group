# This script is used to generate some descriptive summary statistics plots
# Author: Yanhan Si
# Nov 11, 2020
# 79: -------------------------------------------------------------------------
# libraries: ------------------------------------------------------------------
library(tidyverse)
library(ggplot2)
# data: -----------------------------------------------------------------------
path = "../data"
file_name = sprintf('%s/Churn_Modelling_Cleaned.csv', path)
data = read.csv(file_name)
# factoring: ------------------------------------------------------------------
names(data)
data = data %>% mutate(Exited = as.factor(Exited),
                       HasCrCard = as.factor(HasCrCard),
                       IsActiveMember = as.factor(IsActiveMember))
data %>% 
  ggplot(aes( CreditScore, color = Exited )) + 
  geom_density() + 
  ggtitle("Figure.1.1 The distribution of credit score by exited") +
  theme_bw()

data %>% 
  ggplot(aes( EstimatedSalary, color = Exited )) + 
  geom_density() + 
  ggtitle("Figure.1.2 The distribution of estimated salary by exited") +
  theme_bw()

data %>% 
  ggplot(aes( Balance, color = Exited )) + 
  geom_density() + 
  ggtitle("Figure.1.3 The distribution of balance by exited") +
  theme_bw()

data %>% 
  ggplot(aes(x = Exited, y = Age, color = Gender)) + 
  geom_boxplot() + 
  ggtitle("Figure.2 Age + Gender ~ Exited") +
  theme_bw()

data %>% 
  ggplot(aes(x = Exited)) + 
  geom_bar() + 
  facet_grid(~ Geography) +
  ggtitle("Figure.3 Geography ~ Exited") +
  theme_bw()

data %>% 
  ggplot(aes(x = Exited)) +
  geom_bar() + 
  facet_grid(  ~ Gender) +
  ggtitle("Figure.4 Gender ~ Exited") +
  theme_bw()

