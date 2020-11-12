*-----------------------------------------------------------------------------*
* Stats 506, Fall 2020 
* Midterm Project
* 
* This script shows an example of doing HL test in Stata
* 
*
* Author: Hao He
* Updated: Month Day, 2020
*-----------------------------------------------------------------------------*
// 79: ---------------------------------------------------------------------- *

// set up: ------------------------------------------------------------------ * 
version 16.0
log using mtproject.log, text replace

// install packages to help performing hl test
net from https://www.sealedenvelope.com/
net describe hl
net install hl

// load data: --------------------------------------------------------------- *
import delimited Churn_Modelling_Cleaned.csv
summarize
save churn_data.dta, replace
clear

// fit a logistic model using all the variables
use churn_data
encode geography, gen(geo)
encode gender, gen(sex)
logit exited creditscore i.geo i.sex age tenure balance numofproducts i.hascrcard i.isactivemember estimatedsalary


// perform an initial HL-test and generate HL plot
predict p_exited
hl exited p_exited, plot

// Try AIC 
estat ic
logit exited creditscore i.geo i.sex age tenure balance numofproducts i.isactivemember estimatedsalary
estat ic
logit exited creditscore i.geo i.sex age tenure balance numofproducts i.isactivemember
estat ic

// HL test and calibration plot for new model
predict np_exited
hl exited p_exited, plot


// Reference: https://www.sealedenvelope.com/stata/hl/







log close
// 79: ---------------------------------------------------------------------- *
