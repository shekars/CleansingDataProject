##Transformation: 


The following library packages are used by the code

plyr
dplyr

Program does the following activities

 1. reads thelist of activities from activity_labels.txt
 2. reads list of feature names (caputured  by gadgets) from features.txt file 
 3. identifies list of mean and standard deviation fields
 4. reads training data and test data and adds the new columns activity_id, acitivity_name, subject_d to track the data by subject and by activity
 6. merges the test and training data sets 
 7. extracts the subset of the merged data, mean and standard deviation columns are extracted
 8. group_by function is used  for calculating average for each variable by subject id and activity.
 9. summarize function is used to capture the averages and then data is written to the flat file in tidydata.txt file.


##tidydata.txt 

The tidydata.txt file has the average of each variable grouped by subject and actvity. The following are the column names used in the dataset. Even though some of the field names did not end with "_mean", all the variables are averages grouped by subject and activity. 

1. "subject_id" 
2. "activity_id"
3. "activity_name"
4. "tBodyAcc_mean_X_mean"
5. "tBodyAcc_mean_Y"
6. "tBodyAcc_mean_Z"
7. "tBodyAcc_std_X_mean"
8. "tBodyAcc_std_Y"
9. "tBodyAcc_std_Z"
10. "tGravityAcc_mean_X"
11. "tGravityAcc_mean_Y"
12. "tGravityAcc_mean_Z"
13. "tGravityAcc_std_X_mean"
14. "tGravityAcc_std_Y_mean"
15. "tGravityAcc_std_Z"
16. "tBodyAccJerk_mean_X_mean"
17. "tBodyAccJerk_mean_Y_mean"
18. "tBodyAccJerk_mean_Z"
19. "tBodyAccJerk_std_X_mean"
20. "tBodyAccJerk_std_Y_mean"
21. "tBodyAccJerk_std_Z"
22. "tBodyGyro_mean_X_mean"
23. "tBodyGyro_mean_Y_mean"
24. "tBodyGyro_mean_Z"
25. "tBodyGyro_std_X_mean"
26. "tBodyGyro_std_Y_mean"
27. "tBodyGyro_std_Z"
26. "tBodyGyroJerk_mean_X_mean"
29. "tBodyGyroJerk_mean_Y_mean"
30. "tBodyGyroJerk_mean_Z"
31. "tBodyGyroJerk_std_X_mean"
32. "tBodyGyroJerk_std_Y_mean"
33. "tBodyGyroJerk_std_Z"
34. "tBodyAccMag_mean_mean"
35. "tBodyAccMag_std_mean"
36. "tGravityAccMag_mean"
37. "tGravityAccMag_std_mean"
38. "tBodyAccJerkMag_mean_mean"
39. "tBodyAccJerkMag_std"
40. "tBodyGyroMag_mean_mean"
41. "tBodyGyroMag_std_mean"
42. "tBodyGyroJerkMag_mean"
43. "tBodyGyroJerkMag_std_mean"
44. "fBodyAcc_mean_X_mean"
45. "fBodyAcc_mean_Y"
46. "fBodyAcc_mean_Z_mean"
47. "fBodyAcc_std_X_mean"
48. "fBodyAcc_std_Y"
49. "fBodyAcc_std_Z_mean"
50. "fBodyAcc_meanFreq_X_mean"
51. "fBodyAcc_meanFreq_Y"
52. "fBodyAcc_meanFreq_Z_mean"
53. "fBodyAccJerk_mean_X_mean"
54. "fBodyAccJerk_mean_Y"
55. "fBodyAccJerk_mean_Z_mean"
56. "fBodyAccJerk_std_X_mean"
57. "fBodyAccJerk_std_Y"
58. "fBodyAccJerk_std_Z_mean"
59. "fBodyAccJerk_meanFreq_X_mean"
60. "fBodyAccJerk_meanFreq_Y"
61. "fBodyAccJerk_meanFreq_Z_mean"
62. "fBodyGyro_mean_X_mean"
63. "fBodyGyro_mean_Y" 
64. "fBodyGyro_mean_Z_mean"
65. "fBodyGyro_std_X"
66. "fBodyGyro_std_Y"
67. "fBodyGyro_std_Z_mean"
68. "fBodyGyro_meanFreq_X_mean"
69. "fBodyGyro_meanFreq_Y"
70. "fBodyGyro_meanFreq_Z_mean"
71. "fBodyAccMag_mean_mean"
73. "fBodyAccMag_std"
74. "fBodyAccMag_meanFreq_mean"
75. "fBodyBodyAccJerkMag_mean_mean"
76. "fBodyBodyAccJerkMag_std"
77. "fBodyBodyAccJerkMag_meanFreq_mean"
78. "fBodyBodyGyroMag_mean_mean"
79. "fBodyBodyGyroMag_std"
80. "fBodyBodyGyroMag_meanFreq_mean"
81. "fBodyBodyGyroJerkMag_mean_mean"
82. "fBodyBodyGyroJerkMag_std"
83. "fBodyBodyGyroJerkMag_meanFreq_mean"
84. "angle_tBodyAccMean_gravity_mean"
85. "angle_tBodyAccJerkMean_gravityMean_mean"
86. "angle_tBodyGyroMean_gravityMean_mean"
87. "angle_tBodyGyroJerkMean_gravityMean_mean"
88. "angle_X_gravityMean"
89. "angle_Y_gravityMean_mean"
90. "angle_Z_gravityMean"
