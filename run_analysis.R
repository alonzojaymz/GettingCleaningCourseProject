library(data.table)
library(dplyr)

#Reads in training and test data
testData <- data.table::fread("./UCI Har Dataset/test/X_test.txt", data.table=FALSE)
trainData <- data.table::fread("./UCI Har Dataset/train/X_train.txt", data.table=FALSE)

#ANSWER TO PART 1: mergedData
#Merges training and test data sets into a single data set by row combing them
mergedData <- rbind(testData,trainData)

#ANSWER TO PART 2: extractedMeasurements
features <- data.table::fread("./UCI Har Dataset/features.txt", data.table=FALSE)[,2] #reads in all of the features/variables
featureIndices <- grep("(mean|std)\\(\\)", features) #finds indices of features/variables that are for either the mean or standard deviation of a measurement
extractedFeatures <- mergedData[,featureIndices] #extracts only features/variables that are the mean or standard deviation of a measurement

#ANSWER TO PART 3: extractedFeaturesWithActivities
activityLabels <- data.table::fread("./UCI Har Dataset/activity_labels.txt", data.table=FALSE)[,2] #name labels corresponding to numeric labels for activities
testActivities <- data.table::fread("./UCI Har Dataset/test/y_test.txt", data.table=FALSE) #numeric labels for activities in test set for each observation
trainActivities <- data.table::fread("./UCI Har Dataset/train/y_train.txt", data.table=FALSE) #numeric labels for activities in train set for each observation
activityNumbers <- rbind(testActivities, trainActivities) #merges numeric labels for training and test activities for each observation by row combining them
activityNumbers <- activityNumbers[,1]
activities <- vector("character")
for(activity in activityNumbers) { #creates character vector with activity labels for each observation
      activities <- c(activities, activityLabels[activity])
}
extractedFeaturesWithActivities <- cbind(Activity = activities, extractedFeatures) #adds activity labels to data frame

#ANSWER TO PART 4: extractedFeaturesWithActivities
colnames(extractedFeaturesWithActivities)[2:ncol(extractedFeaturesWithActivities)] <- features[featureIndices] #adds descriptive names to variables 

#ANSWER TO PART 5
testSubjects <- data.table::fread("./UCI Har Dataset/test/subject_test.txt", data.table=FALSE)
trainSubjects <- data.table::fread("./UCI Har Dataset/train/subject_train.txt", data.table=FALSE)
subjects <- rbind(testSubjects, trainSubjects)
tidyData <- cbind(subjects, extractedFeaturesWithActivities) #adds subjects(volunteers) to data frame
colnames(tidyData)[1] <- "Subject"

#Groups data by subject and activity, then finds the mean for each variable. Arranges/sorts by subject, then activity
tidyData <- dplyr::tbl_df(tidyData)
tidyData <- dplyr::group_by(tidyData,Subject,Activity) %>% dplyr::summarise_all(mean) %>% dplyr::arrange(Subject,Activity)
tidyData <- dplyr::ungroup(tidyData)
tidyData <- as.data.frame(tidyData)

write.table(tidyData,"./tidyData.txt", row.names = FALSE) #write tidy data to a txt file
print(tidyData)

