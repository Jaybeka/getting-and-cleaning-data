library(reshape2)
# set the folder of UCI HAR Dataset as the work directory 
cat("start to read data...\n")
# get the column names and activity map
colNames <- read.table("./data/features.txt", sep = "", header = F, 
                       stringsAsFactors = F)
labels <- read.table("./data/activity_labels.txt", sep = "", header = F)

# get the test dataset, subjects and activity labels
cat("reading test dataset...\n")
testData <- read.table("./data/test/X_test.txt", sep = "", header = F)
subTest <- read.table("./data/test/subject_test.txt", sep = "", 
                      header = F)
yTest <- read.table("./data/test/y_test.txt", sep = "", header = F)

# get the test dataset, subjects and activity labels
cat("reading train dataset...\n")
trainData <- read.table("./data/train/X_train.txt", sep = "", header = F)
subTrain <- read.table("./data/train/subject_train.txt", sep = "", 
                       header = F)
yTrain <- read.table("./data/train/y_train.txt", sep = "", header = F)

cat("merging and managing data...\n")
# 1. combine the test and train dataset with subject and labels
# separately, then merge them two parts together
testData <- cbind(testData, subTest, yTest)
trainData <- cbind(trainData, subTrain, yTrain)
entireSet <- rbind(testData, trainData)

# 4. name each variable with the content of features.txt
names(entireSet) <- c(colNames[,2], "subject", "label")

# 2. Extracts only the measurements on the mean and standard
# deviation for each measurement, with subject and labels
meanCol <- grep(".*mean.*", colNames[,2])
stdCol <- grep(".*std.*", colNames[,2])
partialSet <- entireSet[ , union(meanCol, c(devCol, 562, 563))]

# 3. Uses descriptive activity names to name the activities 
# in the data set
partialSet$label <- labels[partialSet$label,2]

cat("output the clean data...\n")
# 5. From the data set in step 4, creates a second, independent tidy 
# data set with the average of each variable for each activity and 
# each subject.
output <- melt(partialSet, id = c("subject", "label"))
output <- dcast(output, subject + label ~ variable, mean)

# write.table
write.table(output, "cleandata.txt", row.names = FALSE, 
            quote = FALSE)
