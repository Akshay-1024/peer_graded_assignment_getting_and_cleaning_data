# peer_graded_assignment_getting_and_cleaning_data


this is the project of getting and cleaning data of coursera
in this project we have collected raw data and converted it into tidy data

## steps followed are....

**Merges the training and the test sets to create one data set.

**Extracts only the measurements on the mean and standard deviation for each measurement.

**Uses descriptive activity names to name the activities in the data set

**Appropriately labels the data set with descriptive variable names.

**From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### each process explained what has been done

File with R code "run_analysis.R" perform 5 following steps (in accordance assigned task of course work):

**Merging the training and the test sets to create one data set.
1.1 Reading files

1.1.1 Reading trainings tables

1.1.2 Reading testing tables

1.1.3 Reading feature vector

1.1.4 Reading activity labels

1.2 Assigning column names

1.3 Merging all data in one set

**Extracting only the measurements on the mean and standard deviation for each measurement

2.1 Reading column names

2.2 Create vector for defining ID, mean and standard deviation

2.3 Making nessesary subset from Tot_mer

**Using descriptive activity names to name the activities in the data set

**Appropriately labeling the data set with descriptive variable names

**Creating a second, independent tidy data set with the average of each variable for each activity and each subject

5.1 Making second tidy data set

5.2 Writing second tidy data set in txt file
