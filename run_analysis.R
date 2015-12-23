library("data.table")
library("reshape2")

#Get the files
setwd("~/")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
             destfile = "projectFiles.zip")
unzip(zipfile = "projectFiles.zip",exdir = "projectFiles")
setwd("projectFiles/UCI HAR Dataset")

#Build the test data
activity_labels <- read.table("activity_labels.txt")[,2]
features <- read.table("features.txt")[,2]
subject <- read.table("test/subject_test.txt")
y <- read.table("test/y_test.txt")
X <- read.table("test/X_test.txt")

#Build y test
y[,2] <- activity_labels[y[,1]]
names(y) <- c("Activity_ID","Activity_Name")

#Build test features extract
features_extract_bool <- grepl("mean|std" , features)
features_extract <- X[,features_extract_bool]
names(features_extract) <- features[features_extract_bool]

#Build test subject
names(subject) <- c("Subject")

#Bind test data
testData <- cbind(features_extract, y, subject)



#Build the training data
subject <- read.table("train/subject_train.txt")
y <- read.table("train/y_train.txt")
X <- read.table("train/X_train.txt")

#Build y training
y[,2] <- activity_labels[y[,1]]
names(y) <- c("Activity_ID","Activity_Name")

#Build training features extract
features_extract_bool <- grepl("mean|std" , features)
features_extract <- X[,features_extract_bool]
names(features_extract) <- features[features_extract_bool]
                                    
#Build training subject
names(subject) <- c("Subject")                                    

#Bind training data
trainData <- cbind(features_extract, y, subject)

#Bind all data
allData <- rbind(testData, trainData)

#labels1 <- c("Subject", "Activity_ID", "Activity_Name")
#labels2 <- setdiff(colnames(allData), labels1)

meltedData <- melt(allData, id = c("Subject", "Activity_Name"), measure.vars = colnames(features_extract))

finalData <- dcast(meltedData, Subject + Activity_Name ~ variable, mean)

write.table(finalData, file="finalData.txt", row.name = FALSE)