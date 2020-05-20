---
title: "Code Book"
author: "Alessandro"
date: "5/15/2020"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

#               Data Dictionary for data set  "tidy_data"  

The following data set variable list has been developed in conformity with the bullet point 4 of the assignment for the course "Getting and cleaning data"

## Variables List
  Phase
  
|    This variable determines the partitioning of the experiment according two phases identified
|    with the keywords 'training' and 'test'
|    Type: character
1. training
2. test

  Subject
  
|     A number identifying the specific vounteer who take part to the experiment
|     Type: integer
1. 1..30

  Activity
  
|     Human activity recognition, that are described according the following values:
|     Type: character
1. WALKING
2. WALKING_USPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

| Note: all the following variables have the same common characteristics:
| Type: numeric with range bounded in [-1, 1]

  tBodyAccmeanX

|     mean of the body acceleration in the X direction measured in standard gravity units g

  tBodyAccmeanY

|     mean of the body acceleration in the Y direction measured in standard gravity units g

  tBodyAccmeanZ

|     mean of the body acceleration in the Z direction measured in standard gravity units g

  tBodyAccstdX

|     standard deviation of the body acceleration in the X direction measured in standard gravity units g

  tBodyAccstdY

|     standard deviation of the body acceleration in the Y direction measured in standard gravity units g

  tBodyAccstdZ

|     standard deviation of the body acceleration in the Z direction measured in standard gravity units g

  tBodyAccMagmean

|     mean of the body acceleration module magnitude measured in standard gravity units g

  tBodyAccMagstd

|     standard deviation of the body acceleration module magnitude measured in standard gravity units g


#               Data Dictionary for data set  "sum_data"  

The following data set variable list has been developed in conformity with the bullet point 5 of the assignment for the course "Getting and cleaning data".

It is derived from the above data set "tidy_data" summarizing all measures making the average of each acceleration variable for each activity and each subject. 

## Variables List
  Activity
  
|     Human activity recognition are described according the following values:
|     Type: character
1. WALKING
2. WALKING_USPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

  Subject
  
|     A number identifying the specific vounteer who take part to the experiment
|     Type: integer
1. 1..30

| Note: all the following variables have the same common characteristics:
| Type: numeric with range bounded in [-1, 1]

  tBodyAccmeanX_avg

|     average of the mean of the body acceleration in the X direction measured in standard gravity units g

  tBodyAccmeanY_avg

|     average of the mean of the body acceleration in the Y direction measured in standard gravity units g

  tBodyAccmeanZ_avg

|     average of the mean of the body acceleration in the Z direction measured in standard gravity units g

  tBodyAccstdX_avg

|     average of the standard deviation of the body acceleration in the X direction measured in standard gravity units g

  tBodyAccstdY_avg

|     average of the standard deviation of the body acceleration in the Y direction measured in standard gravity units g

  tBodyAccstdZ_avg

|     average of the standard deviation of the body acceleration in the Z direction measured in standard gravity units g

  tBodyAccMagmean_avg

|     average of the mean of the body acceleration module magnitude measured in standard gravity units g

  tBodyAccMagstd_avg

|     average of the standard deviation of the body acceleration module magnitude measured in standard gravity units g
