<<<<<<< HEAD
README file
run_analysis.R script
Project
Getting and Cleaning Data
Fred Lancia
January 25, 2015

A. The data for the project can be found at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================


B. Transformations:

1. Read in the activity labels, activities are 1. walking, 2. walking_upstairs, 3. walking_downstairs, 4. sitting, 5. standing, 6. laying 
   activity_labels <- read.table("./activity_labels.txt")

2. Read in features, variable names.  There are 561 of these.
   features <- read.table("./features.txt")

3. Read in the X test data.  There are 561 variables and 2947 observations.
   X_test <- read.table("./test/X_test.txt")

4. Read in activity labels (1 through 6) for X test data.  There are 2947 observations.
   y_test <- read.table("./test/y_test.txt")

5. Read in list of subjects used for X test data.  There are 9 subjects doing tests. 2947 observations.
   subject_test <- read.table("./test/subject_test.txt")

6. Read in the X train data.  There are 561 variables and 7352 observations.
   X_train <- read.table("./train/X_train.txt")

7. Read in activity labels (1 through 6) for X train data.  There are 7352 observations.
   y_train <- read.table("./train/y_train.txt")

8. Read in list of subjects used for train.  There are 21 subjects doing train. 7352 observations.
   subject_train <- read.table("./train/subject_train.txt")

9. Update column names in X test and train data to reflect feature names.
   colNames <- features$V2
   colnames(X_test) <- colNames
   colnames(X_train) <- colNames

10. Add test subjects and activity labels to X test data frame.
    X_testA <- cbind(subject_test, y_test, X_test)
    Add train subjects and activity labels to X train data frame.
    X_trainA <- cbind(subject_train, y_train, X_train)

11. Update column names to show subject variable
    colnames(X_testA)[1] <- "subject"
    colnames(X_trainA)[1] <- "subject"

12. Update column names to show activity variable
    colnames(X_testA)[2] <- "activity"
    colnames(X_trainA)[2] <- "activity"

13. Merge (rbind) the X train and test data together into one data frame.  Result will be a data frame with 10299 rows and 563 columns
    X_A <- rbind(X_trainA, X_testA)

14. We want to keep only the mean and standard deviation variables.  New resulting (subset) data set dimensions will be 10299 rows and 74 columns
    X_B <- X_A[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 269:273, 
        347:352, 426:431, 505:506, 531:532, 541, 544:545, 554, 557:563)]

15. Update the activity codes (1 through 6) in the data frame to reveal activities more clearly.
    X_B$activity[X_B$activity == 1] <- "walking"
    X_B$activity[X_B$activity == 2] <- "walking_upstairs"
    X_B$activity[X_B$activity == 3] <- "walking_downstairs"
    X_B$activity[X_B$activity == 4] <- "sitting"
    X_B$activity[X_B$activity == 5] <- "standing"
    X_B$activity[X_B$activity == 6] <- "laying"

16. Create new data set that has average of each variable for each activity and each subject.

    subject1 <- colMeans((X_B[, 3:74]) & (X_B$subject == 1))
    subject1 <- c("1", NA, subject1)
    .
    .
    .
    subject30 <- colMeans((X_B[, 3:74]) & (X_B$subject == 30))
    subject30 <- c("30", NA, subject30)

    activity1 <- colMeans((X_B[, 3:74]) & (X_B$activity == "walking"))
    activity1 <- c(NA, "walking", activity1)
    .
    .
    .
    activity6 <- colMeans((X_B[, 3:74]) & (X_B$activity == "laying"))
    activity6 <- c(NA, "laying", activity6)

17. Build matrix from all of the column means for each subject and activity.

    mt <- rbind(activity1, activity2, activity3, activity4, activity5, activity6, subject1, subject2, subject3, subject4, subject5, subject6, subject7,
      subject8, subject9, subject10, subject11, subject12, subject13, subject14, subject15, subject16, subject17, subject18, subject19, subject20,
      subject21, subject22, subject23, subject24, subject25, subject26, subject27, subject28, subject29, subject30)

18. Convert matrix to data frame
    df <- as.data.frame(mt)

19. Put subject and activity column names (variables) back into data frame
    colnames(df)[1] <- "subject"
    colnames(df)[2] <- "activity"

From R, source("run_analysis.R") to run the script.  This produces the df data.frame.

Finally, write.table(df, "./tidy_data_frame.txt", row.names=FALSE)










=======
# GettingAndCleaningDataProject
Getting and Cleaning Data Project: Tidy Data Set: 1/25/15
>>>>>>> 9c30f6f9d53c52ca19d53f657c9a75942dba5ed2
