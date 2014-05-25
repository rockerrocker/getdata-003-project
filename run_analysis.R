##

## UCI HAR data downloaded to data folder in working directory

## Using data.table
library(data.table)

## Read in feature names
feat <- read.table("./data/features.txt")
feat <- feat[,2] # remove first column which only has row numbers
feat <- as.vector(feat)

## Part 1 - Read in Data and Merge
Xtrain <- read.table("./data/train/X_train.txt")
Ytrain <- read.table("./data/train/y_train.txt")
subjTrain <- read.table("./data/train/subject_train.txt")
trainMerge <- cbind(Ytrain, subjTrain, Xtrain)
rm(Xtrain, Ytrain, subjTrain) # Clear from memory

Xtest <- read.table("./data/test/X_test.txt")
Ytest <- read.table("./data/test/y_test.txt")
subjTest <- read.table("./data/test/subject_test.txt")
testMerge <- cbind(Ytest, subjTest, Xtest)
rm(Xtest, Ytest, subjTest) # Clear from memory

mergeData <- rbind(trainMerge, testMerge)
rm(trainMerge, testMerge) # No longer required. Clear memory.
colnames(mergeData) <- c("activity", "subject", feat)

## Part 2 - Extract specific measurements
# Create logical vector showing which features contain 'mean()' or 
# 'std()'
pattern <- "mean\\(\\)|std\\(\\)"
featRegex <- grepl(pattern, feat)
mergeData <- mergeData[featRegex]

## Part 3 - Add descriptive activity names to rows
# Load activity labels and format
actLabels <- read.table("./data/activity_labels.txt")
actLabels[,2] <- gsub("_", "", tolower(as.character(actLabels[,2])))
# Replace numbers with labels and update the column heading
mergeData[,1] <- actLabels[mergeData[,1], 2]

## Part 4 - Appropriately label the dataset with descriptive names
# This was done in the last part of Part 1 above ('colnames')

## Part 5 - Create a tidy dataset with average for each activity/subject
# This part was not completed as I ran out of time.
# In order to submit a sample of my data I exported the first 100 rows.
write.table(mergeData[1:100,], "datasetOfVariableAverages.txt")