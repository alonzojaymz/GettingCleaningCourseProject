---
title: "README: Getting and Cleaning Data Course Project"
author: "Alonzo"
date: "12/21/2021"
output: pdf_document
---

BREAKDOWN
_________
This project takes a somewhat messy data set and makes it more tidy. This is done in the run_analysis.R file. The file firstly combines training and test data into a single data frame. It then strips out the bulk of the variables/columns being
measured in the data set, taking only the mean and variable variables for the measurements; these variables are further given descriptive names. An additional column is added which gives the activity being recorded for a given observation/row. After this, the data is grouped by subject(volunteer) and activity; within each group, the mean of each variable is calculated. All of these means for each subject/activity group are then placed in a new data frame. Lastly, this data is written out to a text file.
