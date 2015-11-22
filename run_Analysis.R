
library(plyr)
library(dplyr)

# read list of activities
activity_labels <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
activity_labels<-rename(activity_labels, activity_id = V1)
activity_labels<-rename(activity_labels, activity_name  = V2)

# read features list
features <- read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features<-rename(features, feature_id = V1)
features<-rename(features, feature_name = V2)


# identify mean and standard deviation columns
stdmeanColumns<-features[grep(c("mean|std"), features$feature_name, ignore.case = TRUE),]

# read training datamre
y_train <- read.csv("UCI HAR Dataset/train/y_train.txt", sep="", header=FALSE, colClasses = "numeric", fill= TRUE)
x_train <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE, colClasses = "numeric", fill= TRUE)
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE, colClasses = "numeric", fill= TRUE)

# name the columns
subject_train<-rename(subject_train, subject_id = V1 )
y_train<-rename(y_train, activity_id = V1)
#colnames(x_train) <-features$feature_name


#trainmeanstd <- x_train[,grep(c("mean|std"), features$feature_name, ignore.case = TRUE)]


#set type to train to identify training data
subject_train$type = c("train")

#add the columns the subject_id, activity  to training data set
x_train$subject_id <- subject_train$subject_id

train_activities <- merge(y_train, activity_labels, by.x="activity_id", by.y = "activity_id")

x_train$activity_id <- train_activities$activity_id
x_train$activity_name <- train_activities$activity_name
x_train$subject_id <- subject_train$subject_id

# read test data
y_test <- read.csv("UCI HAR Dataset/test/y_test.txt", sep="", header=FALSE, colClasses = "numeric", fill= TRUE)
x_test <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE, colClasses = "numeric", fill= TRUE)
subject_test <- read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE, colClasses = "numeric", fill= TRUE)

# name the columns
subject_test<-rename(subject_test, subject_id = V1)
y_test<-rename(y_test, activity_id = V1)
#colnames(x_test) <-features$feature_name

#testmeanstd <- x_train[,grep(c("mean|std"), features$feature_name, ignore.case = TRUE)]

#set type to test to identify test data
subject_test$type = c("test")

#add the columns the subject_id, activity  to training data set

test_activities <- merge(y_test, activity_labels, by.x="activity_id", by.y = "activity_id")
x_test$activity_id <- test_activities$activity_id
x_test$activity_name <- test_activities$activity_name
x_test$subject_id <- subject_test$subject_id


# merge the train and test datasets
mergeddata <- merge(x_train, x_test, all=TRUE)

cnames <- as.character(features$feature_name)

cnames[562] <- "subject_id"
cnames[563] <- "activity_id"
cnames[564] <- "activity_name"
colnames(mergeddata) <-cnames

#Extract only the measurements on the mean and standard deviation for each measurement. 
extractdataset <- mergeddata[,grep(c("mean|std|_name|_id"), colnames(mergeddata), ignore.case = TRUE)]

tidydata<-group_by(extractdataset, subject_id, activity_id, activity_name)

tdata<- summarize(tidydata, tBodyAcc_mean_X_mean=mean( `tBodyAcc-mean()-X`),
                  tBodyAcc_mean_Y =mean( `tBodyAcc-mean()-Y` ),
                  tBodyAcc_mean_Z                   =mean( `tBodyAcc-mean()-Z`                   ),
                  tBodyAcc_std_X_mean=mean( `tBodyAcc-std()-X`),
                  tBodyAcc_std_Y =mean( `tBodyAcc-std()-Y` ),
                  tBodyAcc_std_Z                    =mean( `tBodyAcc-std()-Z`                    ),
                  tGravityAcc_mean_X =mean( `tGravityAcc-mean()-X` ),
                  tGravityAcc_mean_Y =mean( `tGravityAcc-mean()-Y` ),
                  tGravityAcc_mean_Z                =mean( `tGravityAcc-mean()-Z`                ),
                  tGravityAcc_std_X_mean=mean( `tGravityAcc-std()-X`),
                  tGravityAcc_std_Y_mean=mean( `tGravityAcc-std()-Y`),
                  tGravityAcc_std_Z                 =mean( `tGravityAcc-std()-Z`                 ),
                  tBodyAccJerk_mean_X_mean=mean( `tBodyAccJerk-mean()-X`),
                  tBodyAccJerk_mean_Y_mean=mean( `tBodyAccJerk-mean()-Y`),
                  tBodyAccJerk_mean_Z               =mean( `tBodyAccJerk-mean()-Z`               ),
                  tBodyAccJerk_std_X_mean=mean( `tBodyAccJerk-std()-X`),
                  tBodyAccJerk_std_Y_mean=mean( `tBodyAccJerk-std()-Y`),
                  tBodyAccJerk_std_Z                =mean( `tBodyAccJerk-std()-Z`                ),
                  tBodyGyro_mean_X_mean=mean( `tBodyGyro-mean()-X`),
                  tBodyGyro_mean_Y_mean=mean( `tBodyGyro-mean()-Y`),
                  tBodyGyro_mean_Z                  =mean( `tBodyGyro-mean()-Z`                  ),
                  tBodyGyro_std_X_mean=mean( `tBodyGyro-std()-X`),
                  tBodyGyro_std_Y_mean=mean( `tBodyGyro-std()-Y`),
                  tBodyGyro_std_Z                   =mean( `tBodyGyro-std()-Z`                   ),
                  tBodyGyroJerk_mean_X_mean=mean( `tBodyGyroJerk-mean()-X`),
                  tBodyGyroJerk_mean_Y_mean=mean( `tBodyGyroJerk-mean()-Y`),
                  tBodyGyroJerk_mean_Z              =mean( `tBodyGyroJerk-mean()-Z`              ),
                  tBodyGyroJerk_std_X_mean=mean( `tBodyGyroJerk-std()-X`),
                  tBodyGyroJerk_std_Y_mean=mean( `tBodyGyroJerk-std()-Y`),
                  tBodyGyroJerk_std_Z               =mean( `tBodyGyroJerk-std()-Z`               ),
                  tBodyAccMag_mean_mean=mean( `tBodyAccMag-mean()`),
                  tBodyAccMag_std_mean=mean( `tBodyAccMag-std()`),
                  tGravityAccMag_mean               =mean( `tGravityAccMag-mean()`               ),
                  tGravityAccMag_std_mean=mean( `tGravityAccMag-std()`),
                  tBodyAccJerkMag_mean_mean=mean( `tBodyAccJerkMag-mean()`),
                  tBodyAccJerkMag_std               =mean( `tBodyAccJerkMag-std()`               ),
                  tBodyGyroMag_mean_mean=mean( `tBodyGyroMag-mean()`),
                  tBodyGyroMag_std_mean=mean( `tBodyGyroMag-std()`),
                  tBodyGyroJerkMag_mean             =mean( `tBodyGyroJerkMag-mean()`             ),
                  tBodyGyroJerkMag_std_mean=mean( `tBodyGyroJerkMag-std()`),
                  fBodyAcc_mean_X_mean=mean( `fBodyAcc-mean()-X`),
                  fBodyAcc_mean_Y                   =mean( `fBodyAcc-mean()-Y`                   ),
                  fBodyAcc_mean_Z_mean=mean( `fBodyAcc-mean()-Z`),
                  fBodyAcc_std_X_mean=mean( `fBodyAcc-std()-X`),
                  fBodyAcc_std_Y                    =mean( `fBodyAcc-std()-Y`                    ),
                  fBodyAcc_std_Z_mean=mean( `fBodyAcc-std()-Z`),
                  fBodyAcc_meanFreq_X_mean=mean( `fBodyAcc-meanFreq()-X`),
                  fBodyAcc_meanFreq_Y               =mean( `fBodyAcc-meanFreq()-Y`               ),
                  fBodyAcc_meanFreq_Z_mean=mean( `fBodyAcc-meanFreq()-Z`),
                  fBodyAccJerk_mean_X_mean=mean( `fBodyAccJerk-mean()-X`),
                  fBodyAccJerk_mean_Y               =mean( `fBodyAccJerk-mean()-Y`               ),
                  fBodyAccJerk_mean_Z_mean=mean( `fBodyAccJerk-mean()-Z`),
                  fBodyAccJerk_std_X_mean=mean( `fBodyAccJerk-std()-X`),
                  fBodyAccJerk_std_Y                =mean( `fBodyAccJerk-std()-Y`                ),
                  fBodyAccJerk_std_Z_mean=mean( `fBodyAccJerk-std()-Z`),
                  fBodyAccJerk_meanFreq_X_mean=mean( `fBodyAccJerk-meanFreq()-X`),
                  fBodyAccJerk_meanFreq_Y           =mean( `fBodyAccJerk-meanFreq()-Y`           ),
                  fBodyAccJerk_meanFreq_Z_mean=mean( `fBodyAccJerk-meanFreq()-Z`),
                  fBodyGyro_mean_X_mean=mean( `fBodyGyro-mean()-X`),
                  fBodyGyro_mean_Y                  =mean( `fBodyGyro-mean()-Y`                  ),
                  fBodyGyro_mean_Z_mean=mean( `fBodyGyro-mean()-Z`),
                  fBodyGyro_std_X =mean( `fBodyGyro-std()-X` ),
                  fBodyGyro_std_Y                   =mean( `fBodyGyro-std()-Y`                   ),
                  fBodyGyro_std_Z_mean=mean( `fBodyGyro-std()-Z`),
                  fBodyGyro_meanFreq_X_mean=mean( `fBodyGyro-meanFreq()-X`),
                  fBodyGyro_meanFreq_Y              =mean( `fBodyGyro-meanFreq()-Y`              ),
                  fBodyGyro_meanFreq_Z_mean=mean( `fBodyGyro-meanFreq()-Z`),
                  fBodyAccMag_mean_mean=mean( `fBodyAccMag-mean()`),
                  fBodyAccMag_std                   =mean( `fBodyAccMag-std()`                   ),
                  fBodyAccMag_meanFreq_mean=mean( `fBodyAccMag-meanFreq()`),
                  fBodyBodyAccJerkMag_mean_mean=mean( `fBodyBodyAccJerkMag-mean()`),
                  fBodyBodyAccJerkMag_std           =mean( `fBodyBodyAccJerkMag-std()`           ),
                  fBodyBodyAccJerkMag_meanFreq_mean=mean( `fBodyBodyAccJerkMag-meanFreq()`),
                  fBodyBodyGyroMag_mean_mean=mean( `fBodyBodyGyroMag-mean()`),
                  fBodyBodyGyroMag_std              =mean( `fBodyBodyGyroMag-std()`              ),
                  fBodyBodyGyroMag_meanFreq_mean=mean( `fBodyBodyGyroMag-meanFreq()`),
                  fBodyBodyGyroJerkMag_mean_mean=mean( `fBodyBodyGyroJerkMag-mean()`),
                  fBodyBodyGyroJerkMag_std          =mean( `fBodyBodyGyroJerkMag-std()`          ),
                  fBodyBodyGyroJerkMag_meanFreq_mean=mean( `fBodyBodyGyroJerkMag-meanFreq()`),
                  angle_tBodyAccMean_gravity_mean=mean( `angle(tBodyAccMean,gravity)`),
                  angle_tBodyAccJerkMean_gravityMean_mean=mean( `angle(tBodyAccJerkMean),gravityMean)`),
                  angle_tBodyGyroMean_gravityMean_mean=mean( `angle(tBodyGyroMean,gravityMean)`),
                  angle_tBodyGyroJerkMean_gravityMean_mean=mean( `angle(tBodyGyroJerkMean,gravityMean)`),
                  angle_X_gravityMean                =mean( `angle(X,gravityMean)`                ),
                  angle_Y_gravityMean_mean=mean( `angle(Y,gravityMean)`),
                  angle_Z_gravityMean =mean( `angle(Z,gravityMean)` ))


write.table(tdata,"tidydata.txt")

#

