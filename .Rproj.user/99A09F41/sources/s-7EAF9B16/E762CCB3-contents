---
title: "Codebook"
author: "Arjun"
date: "2/16/2020"
output: html_document
 keep_md: yes
---


#Introduction
This code book describes the data used in this project, as well as the processing required to create the resulting tidy data set. It also contains all the variables and summaries calculated, along with units, and any other relevant information.


#Explanation of each file
The dataset includes the following files:

features.txt: 561 rows, 2 columns
Names of the 561 features.

activity_labels.txt:  6 rows, 2 columns
List of activities performed when the corresponding measurements were taken and its codes (labels)

X_train.txt: 7352 rows, 561 columns
7352 observations of the 561 features, for 21 of the 30 volunteers.

subject_train.txt: 7352 rows, 1 column
A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.

y_train.txt:  7352 rows, 561 columns
A vector of 7352 integers, denoting the ID of the activity related to each of the observations in X_train.txt.

X_test.txt: 2947 rows, 561 columns
2947 observations of the 561 features, for 9 of the 30 volunteers.

subject_test.txt: 2947 rows, 1 column
A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.

y_test.txt: 2947 rows, 1 columns
A vector of 2947 integers, denoting the ID of the activity related to each of the observations in X_test.txt.




#Data Cleaning steps

1. Download the dataset
 The zipped Dataset downloaded and extracted under the folder called UCI HAR Dataset

2. Assign each data to variables:
Each of data is assigned variables.


3. Merges the training and the test sets to create one data set
X (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
Y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
sub (10299 rows, 1 column) is created by merging sub_train and sub_test using rbind() function
Merged_dataframe (10299 rows, 563 column) is created by merging Subject, Y and X using cbind() function

4. Extracts only the measurements on the mean and standard deviation for each measurement
cleaned_data (10299 rows, 88 columns) is created by subsetting Merged_dataframe, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement

5. Uses descriptive activity names to name the activities in the data set
Entire numbers in code column of the cleaned_data replaced with corresponding activity taken from second column of the activities variable

6. Appropriately labels the data set with descriptive variable names
code column in cleaned_data renamed into activities
All Acc in column’s name replaced by Accelerometer
All Gyro in column’s name replaced by Gyroscope
All BodyBody in column’s name replaced by Body
All Mag in column’s name replaced by Magnitude
All start with character f in column’s name replaced by Frequency
All start with character t in column’s name replaced by Time

7. From the data set in step 4, we create a second, independent tidy data set with the average of each variable for each activity and each subject
cleaned_data_final (180 rows, 88 columns) is created by sumarizing cleaned_data taking the means of each variable for each activity and each subject, after groupped by subject and activity.
Lastly export cleaned_data_final into cleaned_data_final.txt file.
