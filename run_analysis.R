#=== Set working directory ==========================================

# Insert YOUR DIRECTORY with files containing the data

setwd("//Mcadr4/text/HL/data_science_coursera")
dir()

#=== Read files =====================================================
# Read train data
# Read subject_train.txt---------------------------------------------
# Each row identifies the subject (1 - 30) who performed the activity 
# for each window sample.

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# 7352 obs of 1 var
table(subject_train)


# Read X_train.txt, training set data -------------------------------

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
# 7352 obs of 561 var
# 561 features. See features.txt for complete list of feature names
head(X_train, 3)


# Read y_train.txt, training activity labels data -------------------

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
# 7352 obs of 1 var
table(y_train)


# Read test data ----------------------------------------------------
# Read subject_test.txt----------------------------------------------
# Each row identifies the subject (1 - 30) who performed the activity 
# for each window sample.

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# 2947 obs of 1 var
table(subject_test)


# Read X_test.txt, test set data ------------------------------------

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
# 2947 obs of 561 var
# 561 features. See features.txt for complete list of feature names
head(X_test, 3)


# Read y_test.txt, test activity labels data ------------------------

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
# 2947 obs of 1 var
table(y_test)


# Read files containing feature names and activity labels -----------

feature_names <- read.table("./UCI HAR Dataset/features.txt")
head(feature_names) # There will be 2 var, V2 contain the names

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt") 
# There will be 2 var, V2 contain the labels

# Change V2 from factor to character for later use
activity_labels$V2 <- as.character(activity_labels$V2)


#=== Add column names =============================================== 

names(subject_train) <- "Subject"
names(subject_test) <- "Subject"
names(X_train) <- feature_names$V2
names(X_test) <- feature_names$V2
names(y_train) <- "Activity_Code"
names(y_test) <- "Activity_Code"


#=== Add labeled Activiy column to y datasets =======================
# Activity labels 
# 1 WALKING
# 2 WALKING_UPSTAIRS
# 3 WALKING_DOWNSTAIRS
# 4 SITTING
# 5 STANDING
# 6 LAYING

for(i in 1:6){
  y_train$Activity[y_train$Activity_Code == i] <- activity_labels$V2[activity_labels$V1 ==i]
  y_test$Activity[y_test$Activity_Code == i] <- activity_labels$V2[activity_labels$V1 ==i]
}

head(y_train)
head(y_test)


#=== Merge all data into one dataset ================================

# Add Condition column to indicate training or test data
cond_train <- rep('train', length.out = seq_along(subject_train))
cond_test <- rep('test', length.out = seq_along(subject_test))

# Merge training datasets
allTrain <- cbind(subject_train, Condition = cond_train, y_train, X_train)
head(allTrain, 3)
tail(allTrain, 3)

# Merge test datasets
allTest <- cbind(subject_test, Condition = cond_test, y_test, X_test)
head(allTest, 3)
tail(allTest, 3)

# Merge both
# 10299 obs of 565 var, 561 are features
allData <- rbind(allTrain, allTest)
head(allData, 3)
tail(allData, 3)

# Export allData (first tidy data set) into tab-separated txt file
write.table(allData, file = "allData_smartphones_tidy.txt", 
            sep = "\t", 
            col.names = colnames(allData),
            row.names = FALSE)


#=== Extract mean and standard deviation measures ===================
# For the purpose of this analysis, all features containing
# 'mean' or 'std' in their names are extracted.

# However, features such as 'angle(tBodyGyroJerkMean,gravityMean)'
# are not extracted even though the name contains 'Mean' 
# because these feature are measurements of angle between vectors. 

partial_match <- paste0('mean', '|', 'std')
names(allData[ , c(1:4, grep(partial_match, colnames(allData)))])
subData <- allData[ , c(1:4, grep(partial_match, colnames(allData)))]

# Export subData (second tidy data set) into tab-separated txt file
write.table(subData, file = "subData_smartphones_tidy.txt", 
            sep = "\t", 
            col.names = colnames(subData),
            row.names = FALSE)

#=== Create a second independent tidy data set =======================
# Each row is the average of each feature variable from subData
# for each activity and each subject.

library(data.table)
dt <- data.table(subData)
meanData <- dt[ , lapply(.SD, mean), 
          by = "Subject,Condition,Activity_Code,Activity"][order(Subject,Activity_Code)]
head(meanData)

# Export meanData (third tidy data set) into tab-separated txt file
write.table(meanData, file = "meanData_smartphones_tidy.txt", 
            sep = "\t", 
            col.names = colnames(meanData),
            row.names = FALSE)
