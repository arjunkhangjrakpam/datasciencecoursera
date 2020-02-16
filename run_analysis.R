#Load required libraries
library(dplyr)

#Download the dataset
FILENAME <- "Coursera_DS_course3_project.zip"

# Checking if  archive and folder  exists/not.
if (!file.exists(FILENAME)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, FILENAME)
}  


if (!file.exists("UCI HAR Dataset")) { 
  unzip(FILENAME) 
}


#Assigning all data frames

activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
sub_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
sub_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)

#1.Merges the training and the test sets to create one data set.
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
sub <- rbind(sub_train, sub_test)
Merged_dataframe <- cbind(sub, Y, X)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.
cleaned_data <- Merged_dataframe %>% select(subject, code, contains("mean"), contains("std"))

#3.Uses descriptive activity names to name the activities in the data set
cleaned_data$code <- activities[cleaned_data$code, 2]

#4.Appropriately labels the data set with descriptive variable names.
names(cleaned_data)[2] = "activity"

names(cleaned_data)<-gsub("BodyBody", "Body", names(cleaned_data))
names(cleaned_data)<-gsub("angle", "Angle", names(cleaned_data))
names(cleaned_data)<-gsub("-mean()", "Mean", names(cleaned_data), ignore.case = TRUE)
names(cleaned_data)<-gsub("-std()", "STD", names(cleaned_data), ignore.case = TRUE)
names(cleaned_data)<-gsub("Mag", "Magnitude", names(cleaned_data))
names(cleaned_data)<-gsub("Acc", "Accelerometer", names(cleaned_data))
names(cleaned_data)<-gsub("Gyro", "Gyroscope", names(cleaned_data))
names(cleaned_data)<-gsub("^f", "Frequency", names(cleaned_data))
names(cleaned_data)<-gsub("tBody", "TimeBody", names(cleaned_data))
names(cleaned_data)<-gsub("^t", "Time", names(cleaned_data))
names(cleaned_data)<-gsub("-freq()", "Frequency", names(cleaned_data), ignore.case = TRUE)
names(cleaned_data)<-gsub("gravity", "Gravity", names(cleaned_data))
names(cleaned_data)
summary(cleaned_data)
#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

cleaned_data_final <- cleaned_data %>%group_by(subject, activity) %>%summarise_all(funs(mean))

write.table(cleaned_data_final, "cleaned_data_final.txt", row.name=FALSE)



