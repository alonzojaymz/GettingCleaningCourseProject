---
title: "CodeBook: Getting and Cleaning Data Course Project"
author: "Alonzo"
date: "12/21/2021"
output: pdf_document
---

BREAKDOWN
_________
This Code Book pertains to a tidy data set that takes from a broader data set. A group of 30 volunteers wore a smart phone that had an accelerometer and gyroscope. Measurements using the tools at time intervals were taken of these subjects and the activity they were performing at the time of each measurement was recorded. These activities were: walking, walking upstairs, walking downstairs, sitting, standing and laying. 561 features were recorded for a given observation. This data was tidied up, taking a subset of features measuring the mean and standard deviation. This data also added descriptive names to the variables. Columns were also added to sync the subject being tested and the activity being performed for a given observation with the rest of the data. This data were further simplified by taking the mean of the variable measurements, grouped by subject and activity.


CODEBOOK
________
Number of variables/columns: 68
Number of observations: 180 (30 subjects * 6 activities)

VARIABLES/COLUMNS
Subject: 1 of the 30 subjects the given observation pertains to.
Activity: The activity the subject was performing when the observation was recorded.
The further 66 variables are the means and standard deviations data.

OBSERVATIONS/ROWS
Each row corresponds to a given subject and the activity they were performing for the given measurements.




