
## Download Data
if(!file.exists("C:/Users/Ahmed/Documents/R/data")){dir.create("C:/Users/Ahmed/Documents/R/data")}
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile = "C:/Users/Ahmed/Documents/R/data/UCIHARSataset.zip")

## Unzip Data
unzip("C:/Users/Ahmed/Documents/R/data/UCIHARSataset.zip", exdir = "C:/Users/Ahmed/Documents/R/data")


##load libraries
library(dplyr)
library(reshape2)
###############Read Data#############

## features and labels data
activity_labels <- read.table("C:/Users/Ahmed/Documents/R/data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("C:/Users/Ahmed/Documents/R/data/UCI HAR Dataset/features.txt")

## train data
trainset <- read.table("C:/Users/Ahmed/Documents/R/data/UCI HAR Dataset/train/X_train.txt")
trainlabel <- read.table("C:/Users/Ahmed/Documents/R/data/UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("C:/Users/Ahmed/Documents/R/data/UCI HAR Dataset/train/subject_train.txt")

## test data
testset <- read.table("C:/Users/Ahmed/Documents/R/data/UCI HAR Dataset/test/X_test.txt")
testlabel <- read.table("C:/Users/Ahmed/Documents/R/data/UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("C:/Users/Ahmed/Documents/R/data/UCI HAR Dataset/test/subject_test.txt")

## 1. Merges the training and the test sets to create one data set
dataset <- rbind(trainset, testset)
colnames(dataset) <- features$V1

datalabel <- rbind(trainlabel, testlabel)
colnames(datalabel) <- "activity"

datasubject <- rbind(trainsubject, testsubject)
colnames(datasubject) <- "subject"

alldata <- cbind(datasubject, datalabel, dataset)


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

featureswanted <- grep("-(mean|std)\\(\\)", features$V2 )
featureswanted <- as.character(featureswanted)
selecteddata <-  select( alldata, 1:2, featureswanted)

## 3. Uses descriptive activity names to name the activities in the data set
selecteddata$activity <- factor(selecteddata$activity, levels = activity_labels$V1, labels = activity_labels$V2)

## 4. Appropriately labels the data set with descriptive variable names.
featuresnames <- grep("-(mean|std)\\(\\)", features$V2 , value = TRUE)
featuresnames <- gsub('-mean|-std|[()]', '', featuresnames)

colnames(selecteddata) <-  c( "subject", "activity", featuresnames)

## 5. From the data set in step 4, creates a second, independent 
## tidy data set with the average of each variable for each activity and each subject.

tidydata <- melt(selecteddata, id = c("subject", "activity"))
tidydata_mean <- dcast(tidydata, subject + activity ~ variable, mean)

write.table(tidydata_mean, "tidydata_mean.txt", row.name = FALSE)