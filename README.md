# Getting and Cleaning Data Project

The file "run_analysis.R" should be place in the root folder of this project,
and the folder "data" contains the UCI datasets which is downloaded from this 
url:

`http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphone`

The script reads the test and train data from files at first, adding two 
columns which are subject and activity label.

Then it merges them together into one dataset.

The features in UCI dataset are used to describe each variable.

Extracting the measurements on the mean and standard deviation and using 
descriptive activity names to name the activities.

At the end, creating a second, independent tidy data set with the average of 
each variable for each activity and each subject. 