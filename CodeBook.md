Code Book
========================================================
Courseara Data Science - Getting and Cleaning Data
--------------------------------------------------------
Peer Assessment Project
--------------------------------------------------------

This code book list and describes variables in **meanData_smartphones_tidy.txt**, which is the final tidy data set generated by run_analysis.R. 


## Description of Original Data Set
Human Acitivity Recognition Using Smartphones Data set at the UCI Machine Learning Repository.  

The data set (folder "UCI HAR Dataset") contain data from recording of smartphone accelerometer and gyroscope signals in 30 subjects performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Each subject in each activity is sampled in multiple windows. 

For more information, refer to **README.txt** and **features_info.txt** in the **"UCI HAR Dataset" folder**. 

Link to download data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data was donated by:<br/>
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.<br/>
Smartlab - Non Linear Complex Systems Laboratory<br/>
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy.<br/>
activityrecognition '@' smartlab.ws<br/>
www.smartlab.ws<br/>

Citation:<br/>
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

## Input
Six files are read from the folder "UCI HAR Dataset".<br/>
    1. UCI HAR Dataset/train/subject_train.txt<br/>
    2. UCI HAR Dataset/train/X_train.txt<br/>
    3. UCI HAR Dataset/train/y_train.txt<br/>
    4. UCI HAR Dataset/test/subject_test.txt<br/>
    5. UCI HAR Dataset/test/X_test.txt<br/>
    6. UCI HAR Dataset/test/y_test.txt<br/>

For the purpose of this project, all variables in **meanData_smartphones_tidy.txt** are derived from the six files above. Raw data in the "Inertial Signals" folders are not used.

## Main procedures in Creating **meanData_smartphones_tidy.txt**
1. Set working directory.<br/>
2. Read data from files.<br/>
3. Add proper column names.<br/>
4. Label Activity column descriptively.<br/>
5. Add Condition column to indicate whether data is from training or test set<br/>
6. Merge data sets into one set.<br/>
7. Extract features containing 'mean' or 'std' in their names into a subset.<br/>
8. Using the subset from Step 7, average each feature variable (i.e. means of mean() and std() variables) for each activity and each subject across sampling windows and store these averages into a final tidy data set.<br/>
9. Export tidy data set to a tab-delimited .txt file.

For more information, see **README.md** in this repository and the comments in run_analysis.R. 

## List of Variables and Descriptions
There are a total of 83 variables, 79 of which are feature variables. **Bolded** terms below are variables in the data set.

* **Subject** - subject ID
* **Condition** - indicates whether data is from training or test set
* **Activity_Code** - numeric code of activity <br/>
    (1 WALKING; 2 WALKING_UPSTAIRS; 3 WALKING_DOWNSTAIRS; 4 SITTING; 5 STANDING; 6 LAYING)
* **Activity** - description of activity

*Feature Variables*<br/>
-Denotations:<br/>
t: time domain variables<br/> 
f: frequency domain variables.<br/>
mean(): Mean value<br/>
std(): Standard deviation<br/>
meanFreq(): Weighted average of the frequency components to obtain a mean frequenc<br/>
-XYZ: 3-axial signals in the X, Y and Z directions

-It is important to remember that the values in this final tidy data set are average values of each feature variable (i.e. means of mean(), meanFreq(), and std() variables) for each activity and each subject across sampling windows.

Body Acceleration
* **tBodyAcc-mean()-X**
* **tBodyAcc-mean()-Y**
* **tBodyAcc-mean()-Z**
* **tBodyAcc-std()-X**
* **tBodyAcc-std()-Y**
* **tBodyAcc-std()-Z**

Gravity Accelerateion
* **tGravityAcc-mean()-X**
* **tGravityAcc-mean()-Y**
* **tGravityAcc-mean()-Z**
* **tGravityAcc-std()-X**
* **tGravityAcc-std()-Y**
* **tGravityAcc-std()-Z**

Body Acceleration Jerk
* **tBodyAccJerk-mean()-X**
* **tBodyAccJerk-mean()-Y**
* **tBodyAccJerk-mean()-Z**
* **tBodyAccJerk-std()-X**
* **tBodyAccJerk-std()-Y**
* **tBodyAccJerk-std()-Z**

Body Gyroscope Signal
* **tBodyGyro-mean()-X**
* **tBodyGyro-mean()-Y**
* **tBodyGyro-mean()-Z**
* **tBodyGyro-std()-X**
* **tBodyGyro-std()-Y**
* **tBodyGyro-std()-Z**

Body Gyroscope Jerk
* **tBodyGyroJerk-mean()-X**
* **tBodyGyroJerk-mean()-Y**
* **tBodyGyroJerk-mean()-Z**
* **tBodyGyroJerk-std()-X**
* **tBodyGyroJerk-std()-Y**
* **tBodyGyroJerk-std()-Z**

Body Acceleration Magnitude
* **tBodyAccMag-mean()**
* **tBodyAccMag-std()**

Gravity Acceleration Magnitude
* **tGravityAccMag-mean()**
* **tGravityAccMag-std()**

Body Acceleration Jerk Magnitude
* **tBodyAccJerkMag-mean()**
* **tBodyAccJerkMag-std()**

Body Gyroscope Signal Magnitude
* **tBodyGyroMag-mean()**
* **tBodyGyroMag-std()**

Body Gyroscope Jerk Magnitude
* **tBodyGyroJerkMag-mean()**
* **tBodyGyroJerkMag-std()**

The following are frequency domain variables. Descriptions are equivalent to those for time domain variables. 
* **fBodyAcc-mean()-X**
* **fBodyAcc-mean()-Y**
* **fBodyAcc-mean()-Z**
* **fBodyAcc-std()-X**
* **fBodyAcc-std()-Y**
* **fBodyAcc-std()-Z**
* **fBodyAcc-meanFreq()-X**
* **fBodyAcc-meanFreq()-Y**
* **fBodyAcc-meanFreq()-Z**
* **fBodyAccJerk-mean()-X**
* **fBodyAccJerk-mean()-Y**
* **fBodyAccJerk-mean()-Z**
* **fBodyAccJerk-std()-X**
* **fBodyAccJerk-std()-Y**
* **fBodyAccJerk-std()-Z**
* **fBodyAccJerk-meanFreq()-X**
* **fBodyAccJerk-meanFreq()-Y**
* **fBodyAccJerk-meanFreq()-Z**
* **fBodyGyro-mean()-X**
* **fBodyGyro-mean()-Y**
* **fBodyGyro-mean()-Z**
* **fBodyGyro-std()-X**
* **fBodyGyro-std()-Y**
* **fBodyGyro-std()-Z**
* **fBodyGyro-meanFreq()-X**
* **fBodyGyro-meanFreq()-Y**
* **fBodyGyro-meanFreq()-Z**
* **fBodyAccMag-mean()**
* **fBodyAccMag-std()**
* **fBodyAccMag-meanFreq()**
* **fBodyBodyAccJerkMag-mean()**
* **fBodyBodyAccJerkMag-std()**
* **fBodyBodyAccJerkMag-meanFreq()**
* **fBodyBodyGyroMag-mean()**
* **fBodyBodyGyroMag-std()**
* **fBodyBodyGyroMag-meanFreq()**
* **fBodyBodyGyroJerkMag-mean()**
* **fBodyBodyGyroJerkMag-std()**
* **fBodyBodyGyroJerkMag-meanFreq()**
