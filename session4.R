#----Script Header------------------------------------------------------####
#Date:        16.04.2021
#Author:      Elly Koutamanis
#Filename:    session4.R
#Description: Example code created by Julia Egger and 
#             updated by Elly Koutamanis as homework for the session
#             "Best practices for programming in R" by Arushi Garg.
#             The script does a simple anova analysis.
#Project:     Key Practices for the Language Scientist 2021
#-----------------------------------------------------------------------###

#----Change log----####
#Date:        16.04.2021
#Change by:   Elly Koutamanis
#Changes:     Script header added
#             Sections added
#             Comments describing *what* is happening deleted
#             Comments describing *why* things are done added
#             Variable names changed into more meaningful and consistent names
#Purpose:     Increase readability


#----Preliminaries----####
library(package)
setwd("directory")


#----Data preparation----####
AllData <- read.delim("data.csv", header = TRUE, sep = ",")

RTDataInclNA <- AllData %>%
            select(ppID, condition, trial, RT) %>%
            mutate(condition = as.factor(condition), target = as.factor(target))

#Only complete cases can be included in final analysis:
RTData <- na.omit(RTDataInclNA)


#----Data exploration----####
summary(RTData)


#----Analysis: one-way Anova----####
AnovaRTByCategory <- aov(RT ~category+error(ppID/category), data = analysis_anova)
summary(AnovaRTByCategory)