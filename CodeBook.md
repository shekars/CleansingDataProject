Transformation: 


The following library packages are used by the code

plyr
dplyr

Program does the following activities

 1) reads thelist of activities from activity_labels.txt
 2) reads list of feature names (caputured  by gadgets) from features.txt file 
 3) identifies list of mean and standard deviation fields
 4) reads training data and test data and adds the new columns activity_id, acitivity_name, subject_d to track the data by subject and by activity
 6) merges the test and training data sets 
 7) extracts the subset of the merged data, mean and standard deviation columns are extracted
 8) group_by function is used  for calculating average for each variable by subject id and activity.
 9) summarize function is used to capture the averages and then data is written to the flat file in tidydata.txt file.


tidydata.txt 

The tidydata.txt file has the average of each variable grouped by subject and actvity. The following are the column names used in the dataset. 

"subject_id" 
"activity_id"
"activity_name"
 "tBodyAcc_mean_X_mean"
 "tBodyAcc_mean_Y"
 "tBodyAcc_mean_Z"
 "tBodyAcc_std_X_mean"
 "tBodyAcc_std_Y"
 "tBodyAcc_std_Z"
 "tGravityAcc_mean_X"
 "tGravityAcc_mean_Y"
 "tGravityAcc_mean_Z"
 "tGravityAcc_std_X_mean"
 "tGravityAcc_std_Y_mean"
 "tGravityAcc_std_Z"
 "tBodyAccJerk_mean_X_mean"
 "tBodyAccJerk_mean_Y_mean"
 "tBodyAccJerk_mean_Z"
 "tBodyAccJerk_std_X_mean"
 "tBodyAccJerk_std_Y_mean"
 "tBodyAccJerk_std_Z"
 "tBodyGyro_mean_X_mean"
 "tBodyGyro_mean_Y_mean"
 "tBodyGyro_mean_Z"
 "tBodyGyro_std_X_mean"
 "tBodyGyro_std_Y_mean"
 "tBodyGyro_std_Z"
 "tBodyGyroJerk_mean_X_mean"
 "tBodyGyroJerk_mean_Y_mean"
 "tBodyGyroJerk_mean_Z"
 "tBodyGyroJerk_std_X_mean"
 "tBodyGyroJerk_std_Y_mean"
 "tBodyGyroJerk_std_Z"
 "tBodyAccMag_mean_mean"
 "tBodyAccMag_std_mean"
 "tGravityAccMag_mean"
 "tGravityAccMag_std_mean"
 "tBodyAccJerkMag_mean_mean"
 "tBodyAccJerkMag_std"
 "tBodyGyroMag_mean_mean"
 "tBodyGyroMag_std_mean"
 "tBodyGyroJerkMag_mean"
 "tBodyGyroJerkMag_std_mean"
 "fBodyAcc_mean_X_mean"
 "fBodyAcc_mean_Y"
 "fBodyAcc_mean_Z_mean"
 "fBodyAcc_std_X_mean"
 "fBodyAcc_std_Y"
 "fBodyAcc_std_Z_mean"
 "fBodyAcc_meanFreq_X_mean"
 "fBodyAcc_meanFreq_Y"
 "fBodyAcc_meanFreq_Z_mean"
 "fBodyAccJerk_mean_X_mean"
 "fBodyAccJerk_mean_Y"
 "fBodyAccJerk_mean_Z_mean"
 "fBodyAccJerk_std_X_mean"
 "fBodyAccJerk_std_Y"
 "fBodyAccJerk_std_Z_mean"
 "fBodyAccJerk_meanFreq_X_mean"
 "fBodyAccJerk_meanFreq_Y"
 "fBodyAccJerk_meanFreq_Z_mean"
 "fBodyGyro_mean_X_mean"
 "fBodyGyro_mean_Y" 
 "fBodyGyro_mean_Z_mean"
 "fBodyGyro_std_X"
 "fBodyGyro_std_Y"
 "fBodyGyro_std_Z_mean"
 "fBodyGyro_meanFreq_X_mean"
 "fBodyGyro_meanFreq_Y"
 "fBodyGyro_meanFreq_Z_mean"
 "fBodyAccMag_mean_mean"
 "fBodyAccMag_std"
 "fBodyAccMag_meanFreq_mean"
 "fBodyBodyAccJerkMag_mean_mean"
 "fBodyBodyAccJerkMag_std"
 "fBodyBodyAccJerkMag_meanFreq_mean"
 "fBodyBodyGyroMag_mean_mean"
 "fBodyBodyGyroMag_std"
 "fBodyBodyGyroMag_meanFreq_mean"
 "fBodyBodyGyroJerkMag_mean_mean"
 "fBodyBodyGyroJerkMag_std"
 "fBodyBodyGyroJerkMag_meanFreq_mean"
 "angle_tBodyAccMean_gravity_mean"
 "angle_tBodyAccJerkMean_gravityMean_mean"
 "angle_tBodyGyroMean_gravityMean_mean"
 "angle_tBodyGyroJerkMean_gravityMean_mean"
 "angle_X_gravityMean"
 "angle_Y_gravityMean_mean"
 "angle_Z_gravityMean"
