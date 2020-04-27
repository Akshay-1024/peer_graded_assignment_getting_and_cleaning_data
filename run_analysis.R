#_________________________________________
#Step 0. Downloading and unzipping dataset
#_________________________________________

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="C:/Users/aksha/Desktop/DataSets/a.zip")
unzip(zipfile="C:/Users/aksha/Desktop/DataSets/a.zip",exdir="C:/Users/aksha/Desktop/DataSets")

#You should create one R script called run_analysis.R that does the following.

#1.Merges the training and the test sets to create one data set.

#2.Extracts only the measurements on the mean and standard deviation for each measurement.

#3.Uses descriptive activity names to name the activities in the data set

#4.Appropriately labels the data set with descriptive variable names.

#5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#___________________________________________________________________
#Step 1.Merges the training and the test sets to create one data set.
#___________________________________________________________________

# So to do that we have to read the files.for that purpose we use read.table()

#1.we read training tables.

#2.we read testing tables.

#3.we have to read features.

#4.we have to read activitylabels.

#5.Then assign column names.

#6.merge the both training and testing Datasets

# 1.1.1  Reading trainings tables:

x_train <- read.table("C:/Users/aksha/Desktop/DataSets/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("C:/Users/aksha/Desktop/DataSets/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("C:/Users/aksha/Desktop/DataSets/UCI HAR Dataset/train/subject_train.txt")

# 1.1.2 Reading testing tables:
x_test <- read.table("C:/Users/aksha/Desktop/DataSets/UCI HAR Dataset/test/x_test.txt")
y_test <- read.table("C:/Users/aksha/Desktop/DataSets/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("C:/Users/aksha/Desktop/DataSets/UCI HAR Dataset/test/subject_test.txt")

# 1.1.3 Reading feature vector:
features <- read.table('C:/Users/aksha/Desktop/DataSets/UCI HAR Dataset/features.txt')

# 1.1.4 Reading activity labels:
activityLabels = read.table('C:/Users/aksha/Desktop/DataSets/UCI HAR Dataset/activity_labels.txt')

# 1.2 Assigning column names:

colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

#1.3 Merging all data in one set:

train_mer <- cbind(y_train, subject_train, x_train)
test_mer <- cbind(y_test, subject_test, x_test)
Tot_mer <- rbind(train_mer,test_mer)


#_______________________________________________________________________________________________
#Step 2.-Extracts only the measurements on the mean and standard deviation for each measurement.
#_______________________________________________________________________________________________

#2.1 Reading column names:

colNames <- colnames(Tot_mer)

#2.2 Create vector for defining ID, mean and standard deviation:

mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | grepl("mean.." , colNames) | grepl("std.." , colNames))

#2.3 Making nessesary subset from Tot_mer:

setMeanAndStd <- Tot_mer[ , mean_and_std == TRUE]

#______________________________________________________________________________
#Step 3. Uses descriptive activity names to name the activities in the data set
#______________________________________________________________________________

setActivityNames <- merge(setMeanAndStd, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#__________________________________________________________________________
#Step 4. Appropriately labels the data set with descriptive variable names.
#__________________________________________________________________________

#This is already completed.

#______________________________________________________________________________________________________________________________________________________
#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#______________________________________________________________________________________________________________________________________________________

#5.1 Making a second tidy data set

secTidySet <- aggregate(. ~subjectId + activityId, setActivityNames, mean)
secTidySet <- secTidySet[order(secTidySet$subjectId, secTidySet$activityId),]

#5.2 Writing second tidy data set in txt file

write.table(secTidySet, "secTidySet.txt", row.name=FALSE)

