# Getting and Cleaning data assignment 
# This R program collect and process raw data to get tidy data

wdr <- "~/R_locale/Getting-and-cleaning-data-assignment"
test_dir <- "~/R_locale/Getting-and-cleaning-data-assignment/test"
train_dir <- "~/R_locale/Getting-and-cleaning-data-assignment/train"

library(data.table)
library(dplyr)

## This function read a file on the specified directory and set the directory to wdr (wd by default)
read_my_data <- function(directory, file, wdr = getwd()) {
  setwd(directory)
  data_frame <- fread(file)
  setwd(wdr)
  data_frame
}

## read all data related to training data set combining them in the single data frame "train_data"
## A new variable called "Phase" has been created and initialized at the value "training"
## Note: the intermediate data frames "trainX_data","trainY_data" & "subject_tr_data" are removed
## from workspace to save working memory space 
trainX_data <- read_my_data(train_dir, "X_train.txt", wdr)
trainY_data <- read_my_data(train_dir, "y_train.txt", wdr)
subject_tr_data <- read_my_data(train_dir, "subject_train.txt", wdr)
train_data <- trainX_data %>% mutate(Subject = subject_tr_data[[1]],Activity = trainY_data[[1]], 
                                     Phase = "training") %>%
  select(Phase, Subject, Activity, everything())
rm(list = c("trainX_data", "trainY_data","subject_tr_data"))

## read all data related to test data set combining them in the single data frame "test_data"
## A new variable called "Phase" has been created and initialized at the value "test"
## Note: the intermediate data frames "testX_data","testY_data" & "subject_te_data" are removed
## from workspace to save working memory space 
testX_data <- read_my_data(test_dir, "X_test.txt", wdr)
testY_data <- read_my_data(test_dir, "y_test.txt", wdr)
subject_te_data <- read_my_data(test_dir, "subject_test.txt", wdr)
test_data <- testX_data %>% mutate(Subject = subject_te_data[[1]],Activity = testY_data[[1]], 
                                   Phase = "test") %>%
  select(Phase, Subject, Activity, everything())
rm(list = c("testX_data", "testY_data","subject_te_data"))

## The two data frame "train_data" and "test_data" are merged in "all_data"
## Note: the option sort = FALSE to preserve the original data sets ordering
all_data <- merge(train_data,test_data, all = TRUE, sort = FALSE)
rm(list = c("train_data", "test_data"))

## read original data set columns names and calculate a selection vector col_sel
## The selected columns are related to a single measurement type (time domain acceleration) and
## are stored in the character vector "colnames"
feat_data <- read_my_data(wdr, "features.txt", wdr)
col_sel <- grepl("^tBodyAcc[^J]+mean|^tBodyAcc[^J]+std",feat_data[[2]])
colnames <- (feat_data %>% filter(col_sel) %>% select(2))[[1]]
colnames <- gsub("-","", colnames)     # The specials charater - and () are removed 
colnames <- gsub("[()]","", colnames) 
colnames

## calculate "col_ind" as the column index to select the desired columns from "all_data"
col_ind <- which(col_sel == TRUE)
col_ind <- c(1,2,3,col_ind+3)

## Store the desired columns from "all_data" in the new data frame "tidy_data"
tidy_data <- select(all_data, all_of(col_ind))
## Name all columns of new "tidy_data" data frame 
names(tidy_data) <- c("Phase", "Subject", "Activity", colnames)

## read activity labels and 
## replace the activity code with corresponding activity label in "tidy_data"
activity_data <- read_my_data(wdr, "activity_labels.txt", wdr)
for (i in activity_data[[1]]) {
  tidy_data[[3]] <- gsub(i,activity_data[[i,2]],tidy_data[[3]])
}
## Now "tidy_data" processing is completed

## "tidy_data" is summarized in "sum_data" reporting in the original measurement columns the average
## values calculated by groups of (Activity,Subject)
sum_data <- tidy_data %>% group_by(Activity,Subject) 
sum_data <- summarize(sum_data, tBodyAccmeanX_avg = mean(tBodyAccmeanX),
                      tBodyAccmeanY_avg = mean(tBodyAccmeanY),
                      tBodyAccmeanZ_avg = mean(tBodyAccmeanZ),
                      tBodyAccstdX_avg = mean(tBodyAccstdX),
                      tBodyAccstdY_avg = mean(tBodyAccstdY),
                      tBodyAccstdZ_avg = mean(tBodyAccstdZ),
                      tBodyAccMagmean_avg = mean(tBodyAccMagmean),
                      tBodyAccMagstd_avg = mean(tBodyAccMagstd),
                      )

write.table(sum_data, file = "avg_dataset.txt", row.names = FALSE)


