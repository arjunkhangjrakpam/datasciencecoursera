
Peer-graded Assignment:
Getting and Cleaning Data Course Project( Data Science Specialization)

This repository contains submission for the course project Getting and cleaning data. It explains how all of the scripts work and how they are connected for running analysis on Human Activity recognition dataset.

The following datasets and files are required for the analysis and they are explained as below:

Dataset
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Files
The CodeBook.md is a  code book that contains the desription of the variables , the data set and all the transformations that I have done to tidy the data.

run_analysis.R does the preparation of the data and then follows the following 5 steps:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

cleaned_data_final.txt is the cleaned data which is exported after following all the above mentioned steps in order.
