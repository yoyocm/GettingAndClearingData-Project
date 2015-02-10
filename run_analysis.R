library('dplyr')

################################################################
#1.Merges the training and the test sets to create one data set.
setwd('UCI HAR Dataset/')

# Get train data
x_train <- read.table('train/X_train.txt')
y_train <- read.table('train/Y_train.txt')
subject_train <- read.table('train/subject_train.txt')

# Get test data
x_test <- read.table('test/X_test.txt')
y_test <- read.table('test/y_test.txt')
subject_test <- read.table('test/subject_test.txt')

# Join Train and Test data
x_data <- rbind(x_train,x_test)
y_data <- rbind(y_train,y_test)
subject_data <- rbind(subject_train,subject_test)


################################################################
#2.Extracts only the measurements on the mean and standard deviation for each measurement.

# Get features couples
features <- read.table('features.txt')

# Get indices of mean and standard deviation features
mean_sd_indices <- grep("mean\\(\\)|std\\(\\)", features[, 2])

# Get interesting data columns
fltrd_x_data <- x_data[,mean_sd_indices]


################################################################
#3.Uses descriptive activity names to name the activities in the data set.

# Get activity labels
activity_labels <- read.table('activity_labels.txt')

# Merge and get activity labels list
fltrd_y_data <- as.data.frame(merge(x = activity_labels, y = y_data, by=1, all=TRUE)[,2])


################################################################
#4.Appropriately labels the data set with descriptive activity names.
names(fltrd_x_data) <- features[mean_sd_indices,2]
names(fltrd_y_data) <- "activity"
names(subject_data) <- "subject"


################################################################
#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Merging x,y and subject data
fltrd_data <- cbind(fltrd_y_data, subject_data,fltrd_x_data)

#Define a new function which caculates averages except for two first columns
myColMeans <- function(data) { colMeans(data[,-c(1,2)]) }

#Apply myColMeans function group by subjects and activities
final_data <- ddply(fltrd_data, .(activity,subject), myColMeans)

#Save data to result.csv file
write.table(final_data, "../result.txt", row.names=FALSE)
