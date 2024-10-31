
##post pandemic data are important 2021-2023
# install.packages("haven")
# install.packages("writexl")
library(haven)
library(writexl)

# Load the XPT file
#<https://wwwn.cdc.gov/nchs/nhanes/search/datapage.aspx?Component=Demographics&Cycle=2021-2023>
data <- read_xpt("~/downloads/DEMO_L.XPT")


df=as.data.frame(data)

##definition in Demo_L_Doc

# SEQN - Respondent sequence number
# SDDSRVYR - Data release cycle
# RIDSTATR - Interview/Examination status
# RIAGENDR - Gender
# RIDAGEYR - Age in years at screening
# RIDAGEMN - Age in months at screening - 0 to 24 mos
# RIDRETH1 - Race/Hispanic origin
# RIDRETH3 - Race/Hispanic origin w/ NH Asian
# RIDEXMON - Six-month time period
# RIDEXAGM - Age in months at exam - 0 to 19 years
# DMQMILIZ - Served active duty in US Armed Forces
# DMDBORN4 - Country of birth
# DMDYRUSR - Length of time in US
# DMDEDUC2 - Education level - Adults 20+
#   DMDMARTZ - Marital status
# RIDEXPRG - Pregnancy status at exam
# DMDHHSIZ - Total number of people in the Household
# DMDHRGND - HH ref person’s gender
# DMDHRAGZ - HH ref person’s age in years
# DMDHREDZ - HH ref person’s education level
# DMDHRMAZ - HH ref person’s marital status
# DMDHSEDZ - HH ref person’s spouse’s education level
# WTINT2YR - Full sample 2-year interview weight
# WTMEC2YR - Full sample 2-year MEC exam weight
# SDMVSTRA - Masked variance pseudo-stratum
# SDMVPSU - Masked variance pseudo-PSU
# INDFMPIR - Ratio of family income to poverty
# National Health and Nutrition Examination Survey
# August 2021-August 2023 Data Documentation, Codebook, and Frequencies
# Demographic Variables and Sample Weights (DEMO_L)
# Data File: DEMO_L.xpt
# First Published: September 2024
# Last Revised: NA
# Component Description

#bloodpressure and cholestorol
#<https://wwwn.cdc.gov/nchs/nhanes/search/datapage.aspx?Component=Questionnaire&Cycle=2021-2023>


data_bloodpressure <- read_xpt("~/downloads/BPQ_L.XPT")
data_bloodpressure<-as.data.frame(data_bloodpressure)
colnames(data_bloodpressure)
##who are in urban rural
##RIDRETH1 - Race/Hispanic origin from 1 to 5, see from codebook
#<https://wwwn.cdc.gov/Nchs/Nhanes/2021-2022/BPQ_L.htm#SEQN>
##1.categrize Age yong adults(18-39), middle age (40-59), older adults (>60)
##2. categorize gender male, female
##3. having high blood pressure greater than 2 times in doctor visit. yes no
###in black. origin category, what is the prevalence of 
#high bloodpressure in young adults vs older adults

##4. may compare black and white

##<https://wwwn.cdc.gov/Nchs/Nhanes/2021-2022/DBQ_L.htm> diet nutrition data

##problem 2:
#DBQ930 - Main meal planner/preparer
##if black people do prepare food at home or outside while having hypertention
##link age, gender, meal, education level

##problem 3:
#https://wwwn.cdc.gov/Nchs/Nhanes/2021-2022/PAQ_L.htm for physical activity
#PAD800 - Minutes moderate LTPA how much to do exercisein leisure time
##check if black adults had enough physical activity and blood pressure relation
#




