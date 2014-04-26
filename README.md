README
========================================================
Courseara Data Science - Getting and Cleaning Data
========================================================
Peer Assessment Project
========================================================

The code in this repository operates on the Human Acitivity Recognition Using Smartphones Data set at the UCI Machine Learning Repository.  

The data was donated by:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws

Citation:<br/>
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This document describes how the code works. 

<br/>
## Data
It is assumed that you have already downloaded the data from the following link. 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

<br/>
## Code
There is only one script, run_analysis.R. Details of the script are explained below.

<br/>
## Working Directory
Your working directory should contain the folder "UCI HAR Dataset". 

In the "Set Working Directory" section of run_analysis.R, insert the path to your working directory. 

<br/>
## Explanation of run_analysis.R

### Input
Six files are read from the folder "UCI HAR Dataset".<br/>
    1. UCI HAR Dataset/train/subject_train.txt<br/>
    2. UCI HAR Dataset/train/X_train.txt<br/>
    3. UCI HAR Dataset/train/y_train.txt<br/>
    4. UCI HAR Dataset/test/subject_test.txt<br/>
    5. UCI HAR Dataset/test/X_test.txt<br/>
    6. UCI HAR Dataset/test/y_test.txt<br/>

For the purpose of this project, all variables that the code produces are derived from the six files above. Raw data in the "Inertial Signals" folders are not used.

### Output
Three files can be generated.<br/>
    1. **allData_smartphones_tidy.txt** - includes all 561 features from the original data.<br/>
    2. **subData_smartphones_tidy.txt** - includes 79 features containing 'mean' or 'std' in their names.However, features such as 'angle(tBodyGyroJerkMean,gravityMean)' are not extracted even though the name contains 'Mean' because such features are measurements of angle between vectors.<br/>
    3. **meanData_smartphones_tidy.txt** - derived from subData_smartphones_tidy.txt. Each row is the average of each feature variable from subData_smartphones_tidy.txt for each activity and each subject. 

Only **meanData_smartphones_tidy.txt** is uploaded in Coursera for peer assessment. The file **CodeBook.md** includes a complete list and explanations of variables in **meanData_smartphones_tidy.txt**. 

Four additional variables are included in all three files. They are:<br/>
    1. Subject - subject ID<br/>
    2. Condition - indicates whether data is from training or test set<br/>
    3. Activity_Code - numeric code of activity<br/>
    4. Activity - description of activity<br/>
    
All three are tab-delimited text files with headers.

### Summary of code
Listed here is a summary of main procedures in run_analysis.R. There are detailed comments in the code itself. There are also lines in the code, such as head(...) and table(...) that help understand the data sets and check the validity of the code.<br/>
    1. Set working directory.<br/>
    2. Read data from files.<br/>
    3. Add proper column names.<br/>
    4. Label Activity column descriptively.<br/>
    5. Merge data sets into one set called allData.<br/>
    6. Extract features containing 'mean' or 'std' in their name and store into a set called subData.<br/>
    7. Average each feature variable from subData for each activity and each subject across sampling windows and store these averages into a final tidy data set called meanData.<br/>
    8. Export meanData to a tab-delimited .txt file.