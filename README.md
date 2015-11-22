# CleansingDataProject
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
