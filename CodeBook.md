# Code Book

This code book  describes the variables, the data, and any transformations or work that I performed to clean up the data 

## variables

* `subject` - The ID of the volunteers that made the experiment
* `activity` - The type of activity performed when the corresponding measurements were taken

## data variables
The variables in `tidydata_mean.txt` in the first lines are the variables for data only for the mean and standard deviation for each measurement

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
"tBodyAcc-X" "tBodyAcc-Y" "tBodyAcc-Z" "tGravityAcc-X" "tGravityAcc-Y" "tGravityAcc-Z" "tBodyAccJerk-X" "tBodyAccJerk-Y" "tBodyAccJerk-Z" "tBodyGyro-X" "tBodyGyro-Y" "tBodyGyro-Z" "tBodyGyroJerk-X" "tBodyGyroJerk-Y" "tBodyGyroJerk-Z" "tBodyAccMag" "tGravityAccMag" "tBodyAccJerkMag" "tBodyGyroMag" "tBodyGyroJerkMag" "fBodyAcc-X" "fBodyAcc-Y" "fBodyAcc-Z" "fBodyAccJerk-X" "fBodyAccJerk-Y" "fBodyAccJerk-Z" "fBodyGyro-X" "fBodyGyro-Y" "fBodyGyro-Z" "fBodyAccMag" "fBodyBodyAccJerkMag" "fBodyBodyGyroMag" "fBodyBodyGyroJerkMag"

## Activity Labels

* `WALKING` (value `1`): subject was walking during the test
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the test
* `SITTING` (value `4`): subject was sitting during the test
* `STANDING` (value `5`): subject was standing during the test
* `LAYING` (value `6`): subject was laying down during the test
