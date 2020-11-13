# Tutorial of Hosmer-Lemeshow Testing

* Date: Nov 12, 2020

* Author: Hao He, Yanhan Si

* Software: R, Stata

## Introduction

This project provides a tutorial of using the Hosmer-Lemeshow Test, which is
a goodness of fit test for logistic regression models. We will first introduce
the key concepts behind logistic regression models and the Hosmer-Lemeshow Test
then apply the model on a bank churn data to illustrate how to perform Hosmer-Lemeshow
test and create Hosmer-Lemeshow plot in **R** and **Stata**. Eventually we will
compare the result to a likelihood based approach like AIC and explain the
potential limitations with the HL test.

### Logistic Regression Model

Logistic regression is a statistical model that in its basic form uses a
logistic function to model a binary response variable. In our example, the
response variable will be whether the customer churn or not. Let's denote the
response variable to have value 0 or 1 in our case.

### Hosmer-Lemeshow Test

The Hosmer-Lemeshow Test assesses whether or not the observed event rates match
expected event rates in subgroups of the model population. The Hosmer–Lemeshow
test statistic is given by:  
$$H = \sum_{g=1}^{G}\frac{(O_{1g}-E_{1g})^2}{N_g\pi_g(1-\pi_g)}$$  
, where $O_{1g}$, $E_{1g}$, $O_{0g}$, $E_{0g}$, $N_g$, and $π_g$ denote the
observed $Y=1$ events, expected $Y=1$ events, observed $Y=0$ events, expected
$Y=0$ events, total observations, predicted risk for the $g^{th}$ risk decile
group, and G is the number of groups. The test statistic asymptotically follows
a $\chi ^{2}$ distribution with G − 2 degrees of freedom. For the HL test, the
null hypothesis is that the observed and expected proportions are the same
across subgroups, which indicates a good fit model.

### Data Description
We will use the bank churn data available on Kaggle([ Data Source](https://www.kaggle.com/shrutimechlearn/churn-modelling)).
The data contains 10000 observations of 14 variables of which 2000 are postivie observations. For simplicity, we only
construct the logistic model using the variables below:  
`Credit Score`: The credit score of the customer, ranging from 350 to 850  
`Geography`: The country where the customer belongs. There are only three
countries in our case, which are Germany, France and Spain.  
`Gender`: Gender  
`Age`: Age   
`Tenure`: Number of years for which the customer has been with the bank  
`Balance`: Bank balance of the customer  
`HasCrCard`: Binary Flag for whether the customer holds a credit card with the
bank or not.  
`NumOfProducts`: Number of bank products the customer is utilising.  
`IsActiveMember`: Binary Flag for whether the customer is an active member with
the bank or not.  
`EstimatedSalary`: Estimated salary of the customer in Dollars.  
`Exited`: The response variable indicated whether the customer churn or not. 1
means customer exited and 0 means retained.

### Data Visualization  
The distribution of credit score by the exited status  
![](./fig/CreditScore.png)

Age + Gender ~ Exited  
![](./fig/Age_exited.png)

Geography ~ Exited  
![](./fig/Geography.png)

HasCrCard ~ Exited  
![](./fig/HasCrCard.png)

### References
[Logistic Model](https://en.wikipedia.org/wiki/Logistic_regression)  
[Hosmer-Lemeshow Test](https://en.wikipedia.org/wiki/Hosmer%E2%80%93Lemeshow_test#Pearson_chi-squared_goodness_of_fit_test)
