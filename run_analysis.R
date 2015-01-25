## Fred Lancia
## 1/24/15
## Getting and Cleaning Data Project
## Week 3

## Read in the activity labels, activities are 1. walking, 2. walking_upstairs, 3. walking_downstairs, 4. sitting, 5. standing, 6. laying

activity_labels <- read.table("./activity_labels.txt")

## Read in features, variable names.  There are 561 of these.

features <- read.table("./features.txt")


## Read in the X test data.  There are 561 variables and 2947 observations.

X_test <- read.table("./test/X_test.txt")

## Read in activity labels (1 through 6) for X test data.  There are 2947 observations.

y_test <- read.table("./test/y_test.txt")

## Read in list of subjects used for X test data.  There are 9 subjects doing tests. 2947 observations.

subject_test <- read.table("./test/subject_test.txt")


## Read in the X train data.  There are 561 variables and 7352 observations.

X_train <- read.table("./train/X_train.txt")

## Read in activity labels (1 through 6) for X train data.  There are 7352 observations.

y_train <- read.table("./train/y_train.txt")

## Read in list of subjects used for train.  There are 21 subjects doing train. 7352 observations.

subject_train <- read.table("./train/subject_train.txt")

## Update column names in X test and train data to reflect feature names.

colNames <- features$V2
colnames(X_test) <- colNames
colnames(X_train) <- colNames

## Add test subjects and activity labels to X test data frame.

X_testA <- cbind(subject_test, y_test, X_test)

## Add train subjects and activity labels to X train data frame.

X_trainA <- cbind(subject_train, y_train, X_train)

## Update column names to show subject variable

colnames(X_testA)[1] <- "subject"
colnames(X_trainA)[1] <- "subject"

## Update column names to show activity variable

colnames(X_testA)[2] <- "activity"
colnames(X_trainA)[2] <- "activity"

## Merge (rbind) the X train and test data together into one data frame.  Result will be a data frame with 10299 rows and 563 columns

X_A <- rbind(X_trainA, X_testA)

## We want to keep only the mean and standard deviation variables.  New resulting (subset) data set dimensions will be 10299 rows and 74 columns

X_B <- X_A[, c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256, 269:273, 
  347:352, 426:431, 505:506, 531:532, 541, 544:545, 554, 557:563)]

## Update the activity codes (1 through 6) in the data frame to reveal activities more clearly.

X_B$activity[X_B$activity == 1] <- "walking"
X_B$activity[X_B$activity == 2] <- "walking_upstairs"
X_B$activity[X_B$activity == 3] <- "walking_downstairs"
X_B$activity[X_B$activity == 4] <- "sitting"
X_B$activity[X_B$activity == 5] <- "standing"
X_B$activity[X_B$activity == 6] <- "laying"

## Create new data set that has average of each variable for each activity and each subject.

subject1 <- colMeans((X_B[, 3:74]) & (X_B$subject == 1))
subject1 <- c("1", NA, subject1)
subject2 <- colMeans((X_B[, 3:74]) & (X_B$subject == 2))
subject2 <- c("2", NA, subject2)
subject3 <- colMeans((X_B[, 3:74]) & (X_B$subject == 3))
subject3 <- c("3", NA, subject3)
subject4 <- colMeans((X_B[, 3:74]) & (X_B$subject == 4))
subject4 <- c("4", NA, subject4)
subject5 <- colMeans((X_B[, 3:74]) & (X_B$subject == 5))
subject5 <- c("5", NA, subject5)
subject6 <- colMeans((X_B[, 3:74]) & (X_B$subject == 6))
subject6 <- c("6", NA, subject6)
subject7 <- colMeans((X_B[, 3:74]) & (X_B$subject == 7))
subject7 <- c("7", NA, subject7)
subject8 <- colMeans((X_B[, 3:74]) & (X_B$subject == 8))
subject8 <- c("8", NA, subject8)
subject9 <- colMeans((X_B[, 3:74]) & (X_B$subject == 9))
subject9 <- c("9", NA, subject9)
subject10 <- colMeans((X_B[, 3:74]) & (X_B$subject == 10))
subject10 <- c("10", NA, subject10)
subject11 <- colMeans((X_B[, 3:74]) & (X_B$subject == 11))
subject11 <- c("11", NA, subject11)
subject12 <- colMeans((X_B[, 3:74]) & (X_B$subject == 12))
subject12 <- c("12", NA, subject12)
subject13 <- colMeans((X_B[, 3:74]) & (X_B$subject == 13))
subject13 <- c("13", NA, subject13)
subject14 <- colMeans((X_B[, 3:74]) & (X_B$subject == 14))
subject14 <- c("14", NA, subject14)
subject15 <- colMeans((X_B[, 3:74]) & (X_B$subject == 15))
subject15 <- c("15", NA, subject15)
subject16 <- colMeans((X_B[, 3:74]) & (X_B$subject == 16))
subject16 <- c("16", NA, subject16)
subject17 <- colMeans((X_B[, 3:74]) & (X_B$subject == 17))
subject17 <- c("17", NA, subject17)
subject18 <- colMeans((X_B[, 3:74]) & (X_B$subject == 18))
subject18 <- c("18", NA, subject18)
subject19 <- colMeans((X_B[, 3:74]) & (X_B$subject == 19))
subject19 <- c("19", NA, subject19)
subject20 <- colMeans((X_B[, 3:74]) & (X_B$subject == 20))
subject20 <- c("20", NA, subject20)
subject21 <- colMeans((X_B[, 3:74]) & (X_B$subject == 21))
subject21 <- c("21", NA, subject21)
subject22 <- colMeans((X_B[, 3:74]) & (X_B$subject == 22))
subject22 <- c("22", NA, subject22)
subject23 <- colMeans((X_B[, 3:74]) & (X_B$subject == 23))
subject23 <- c("23", NA, subject23)
subject24 <- colMeans((X_B[, 3:74]) & (X_B$subject == 24))
subject24 <- c("24", NA, subject24)
subject25 <- colMeans((X_B[, 3:74]) & (X_B$subject == 25))
subject25 <- c("25", NA, subject25)
subject26 <- colMeans((X_B[, 3:74]) & (X_B$subject == 26))
subject26 <- c("26", NA, subject26)
subject27 <- colMeans((X_B[, 3:74]) & (X_B$subject == 27))
subject27 <- c("27", NA, subject27)
subject28 <- colMeans((X_B[, 3:74]) & (X_B$subject == 28))
subject28 <- c("28", NA, subject28)
subject29 <- colMeans((X_B[, 3:74]) & (X_B$subject == 29))
subject29 <- c("29", NA, subject29)
subject30 <- colMeans((X_B[, 3:74]) & (X_B$subject == 30))
subject30 <- c("30", NA, subject30)

activity1 <- colMeans((X_B[, 3:74]) & (X_B$activity == "walking"))
activity1 <- c(NA, "walking", activity1)
activity2 <- colMeans((X_B[, 3:74]) & (X_B$activity == "walking_upstairs"))
activity2 <- c(NA, "walking_upstairs", activity2)
activity3 <- colMeans((X_B[, 3:74]) & (X_B$activity == "walking_downstairs"))
activity3 <- c(NA, "walking_downstairs", activity3)
activity4 <- colMeans((X_B[, 3:74]) & (X_B$activity == "sitting"))
activity4 <- c(NA, "sitting", activity4)
activity5 <- colMeans((X_B[, 3:74]) & (X_B$activity == "standing"))
activity5 <- c(NA, "standiing", activity5)
activity6 <- colMeans((X_B[, 3:74]) & (X_B$activity == "laying"))
activity6 <- c(NA, "laying", activity6)

## Build matrix from all of the column means for each subject and activity.

mt <- rbind(activity1, activity2, activity3, activity4, activity5, activity6, subject1, subject2, subject3, subject4, subject5, subject6, subject7,
  subject8, subject9, subject10, subject11, subject12, subject13, subject14, subject15, subject16, subject17, subject18, subject19, subject20,
  subject21, subject22, subject23, subject24, subject25, subject26, subject27, subject28, subject29, subject30)

## Convert matrix to data frame

df <- as.data.frame(mt)

## Put subject and activity column names (variables) back into data frame

colnames(df)[1] <- "subject"
colnames(df)[2] <- "activity"


