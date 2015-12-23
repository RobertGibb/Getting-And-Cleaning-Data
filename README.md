Getting and Cleaning Data Course Project

This is the course project for the Getting and Cleaning Data course.  The run_analysis.R script does the following:

1) Downloads data files from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2) Reads the data from activity_labels.txt, features.txt subject_test.txt, y_test.txt, and x_test.txt into separate tables

3) Assigns the activity id's names

4) Extracts only measurements related to mean and standard deviation

5) Binds together test data of the mean & standard deviation measurements, the activity names, and the identities of the test subject.

6) Reads the data from subject_train.txt, y_train.txt, and x_train.txt into separate tables

7) Assigns the activity id's names

8) Extracts only measurements related to mean and standard deviation

9) Binds together training data of the mean & standard deviation measurements, the activity names, and the identities of the test subject.

10) Binds together the test & training data

11) Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair