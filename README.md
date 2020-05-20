---
output:
  pdf_document: default
  html_document: default
---
# Getting-and-cleaning-data-assignment
This is a short description of the data processing implemented in the R script 'run_analysis.R'.

1. The data files related to training phase 'X_train.txt', 'y_train.txt' and 'subject_train.txt' have been combined in a single data frame called "train_data".
Furthermore a new variable called "Phase" has been created and initialized at the value "training".
This new variable takes into account the context change information implied in the following merging of training and test data sets.
2. The data files related to test phase 'X_test.txt', 'y_test.txt' and 'subject_test.txt' have been combined in a single data frame called "test_data".
Consistently with previous note the new variable called "Phase" has been  initialized at the value "test"
3. The two data frame "train_data" and "test_data" described above have been merged in a new data frame called "all_data"
4. The columns names related to the measures included in the original files 'X_train.txt' and 'X_test.txt' have been derived from file 'features.txt' assuming the variable order of this file consitent with 'X_train.txt' file columns that now are the 561 righmost colums of "all_data" data frame.
5. To obtain a tidy data set only one measure type has been selected choosing all accelerations in the time domain measures. This selection is performed by calculation of the vector "col_sel".
The selected column names are stored in the character vector "colnames". Consequently is calculated the vector "col_ind" as the column index to select the desired columns from "all_data".
6. The selected columns by "col_sel" vector are stored in the new data frame "tidy_data" and its variable names are assigned taking advantage of the vector "colnames".
7. Finally the values in the column Activity of "tidy_data" are replaced with the corresponding literal values derived from file 'activity_labels.txt'. 
8. Starting from "tidy_data" the column measures are summarized in a new data frame "sum_data" with their average values calculated by groups of each Activity and each Subject.
9. The resultant "sum_data" data frame is saved in the attached file 'avg_dataset.txt'



