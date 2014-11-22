# Experimental design and background:

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist*mounted smartphone with embedded inertial 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 1948 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, experimenters captured 3axial linear acceleration and 3axial angular velocity at a constant rate of 50Hz.

** Raw Data **

UCI Har Dataset (downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), a folder containing the following files:
* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

*  Subjects.txt : Subject Codes


**Processed Data :**

* Creation of directory Assignment
* Download of the database 
* Decompression of txt files 
* Reading of test and training measurements  
* Adding of descriptive variable names (from features.txt)
* Read and adding of Activity Codes to test measurements 
* Creation of test dataframe with test results and activity codes 
* Reading and adding subject codes (from subject.txt)
* Creation of one dataframe with test and training measurements
* Subset for each measurement of Activity and Subject codes and of mean and  std deviation variables 
* Adding descriptive Activity Names (from activitylabels.txt)
* Creation of a output dataset (dataset_means.txt) with the average of every   measure variable for each activity and subject 


**List of variables :**

* ACT_Code: Activity Code (1 to 6)
* ACT_Des: Activity Description
* Subj_Code:        Subject Code (1 to 30)
* tBodyAcc*mean()*X:	Body Acceleration X mean
* tBodyAcc*mean()*Y:	Body Acceleration Y mean
* tBodyAcc*mean()*Z:	Body Acceleration Z mean
* tBodyAcc*std()*X:	Body Acceleration X std deviation
* tBodyAcc*std()*Y:	Body Acceleration Y std deviation
* tBodyAcc*std()*Z:	Body Acceleration Z std deviation
* tGravityAcc*mean()*X:	Gravity Acceleration X mean
* tGravityAcc*mean()*Y:	Gravity Acceleration Y mean
* tGravityAcc*mean()*Z:	Gravity Acceleration Z mean
* tGravityAcc*std()*X:	Gravity Acceleration X std deviation
* tGravityAcc*std()*Y:	Gravity Acceleration Y std deviation
* tGravityAcc*std()*Z:	Gravity Acceleration Z std deviation
* tBodyAccJerk*mean()*X:	Jerk Body Acceleration X mean
* tBodyAccJerk*mean()*Y:	Jerk Body Acceleration Y mean
* tBodyAccJerk*mean()*Z:	Jerk Body Acceleration Z mean
* tBodyAccJerk*std()*X:	Jerk Body Acceleration X std deviation
* tBodyAccJerk*std()*Y: Jerk Body Acceleration Y std deviation
* tBodyAccJerk*std()*Z:	Jerk Body Acceleration Z std deviation
* tBodyGyro*mean()*X:	Body Angular Velocity X mean
* tBodyGyro*mean()*Y:	Body Angular Velocity Y mean
* tBodyGyro*mean()*Z:	Body Angular Velocity Z mean
* tBodyGyro*std()*X:   Body Angular Velocity X std deviation
* tBodyGyro*std()*Y:	Body Angular Velocity Y std deviation
* tBodyGyro*std()*Z:	Body Angular Velocity Z std deviation
* tBodyGyroJerk*mean()*X:	Jerk Body Angular Velocity X mean
* tBodyGyroJerk*mean()*Y:	Jerk Body Angular Velocity Y mean
* tBodyGyroJerk*mean()*Z:	Jerk Body Angular Velocity Z mean
* tBodyGyroJerk*std()*X:	Jerk Body Angular Velocity X std deviation
* tBodyGyroJerk*std()*Y:	Jerk Body Angular Velocity Y std deviation
* tBodyGyroJerk*std()*Z:	Jerk Body Angular Velocity Z std deviation
* tBodyAccMag*mean():	Euclidean Body Acceleration mean
* tBodyAccMag*std():	Euclidean Body Acceleration std deviation
* tGravityAccMag*mean():	Euclidean Gravity Acceleration mean
* tGravityAccMag*std():	Euclidean Gravity Acceleration std deviation
* tBodyAccJerkMag*mean():	Euclidean Jerk Body Acceleration mean
* tBodyAccJerkMag*std():	Euclidean Jerk Body Acceleration std deviation
* tBodyGyroMag*mean():	Euclidean Body Angular Velocity Mean
* tBodyGyroMag*std():	Euclidean Body Angular Velocity std deviation
* tBodyGyroJerkMag*mean():	Euclidean Jerk Body Angular Velocity Mean
* tBodyGyroJerkMag*std():	Euclidean Jerk Body Angular Velocity std deviation
* fBodyAcc*mean()*X:	Fast Fourier Transf Body Acceleration X mean
* fBodyAcc*mean()*Y:	Fast Fourier Transf Body Acceleration Y mean
* fBodyAcc*mean()*Z:	Fast Fourier Transf Body Acceleration Z mean
* fBodyAcc*std()*X:	Fast Fourier Transf Body Acceleration X std deviation
* fBodyAcc*std()*Y:	Fast Fourier Transf Body Acceleration Y std deviation
* fBodyAcc*std()*Z:	Fast Fourier Transf Body Acceleration Z std deviation
* fBodyAcc*meanFreq()*X:	Fast Fourier Transf Body Acceleration X Mean Frequency
* fBodyAcc*meanFreq()*Y:	Fast Fourier Transf Body Acceleration Y Mean Frequency
* fBodyAcc*meanFreq()*Z:	Fast Fourier Transf Body Acceleration Z Mean Frequency
* fBodyAccJerk*mean()*X:	Jerk Fast Fourier Transf Body Acceleration X mean
* fBodyAccJerk*mean()*Y:	Jerk Fast Fourier Transf Body Acceleration Y mean
* fBodyAccJerk*mean()*Z:	Jerk Fast Fourier Transf Body Acceleration Z mean
* fBodyAccJerk*std()*X:	Jerk Fast Fourier Transf Body Acceleration X std deviation
* fBodyAccJerk*std()*Y	Jerk Fast Fourier Transf Body Acceleration Y std deviation
* fBodyAccJerk*std()*Z:	Jerk Fast Fourier Transf Body Acceleration Z std deviation
* fBodyAccJerk*meanFreq()*X:	Jerk Fast Fourier Transf Body Acceleration X Mean Frequency
* fBodyAccJerk*meanFreq()*Y:	Jerk Fast Fourier Transf Body Acceleration Y Mean Frequency
* fBodyAccJerk*meanFreq()*Z:	Jerk Fast Fourier Transf Body Acceleration Z Mean Frequency
* fBodyGyro*mean()*X:	Fast Fourier Transf Body Angular Velocity X mean
* fBodyGyro*mean()*Y:	Fast Fourier Transf Body Angular Velocity Y mean
* fBodyGyro*mean()*Z:	Fast Fourier Transf Body Angular Velocity Z mean
* fBodyGyro*std()*X:   Fast Fourier Transf Body Angular Velocity X std deviation
* fBodyGyro*std()*Y:	Fast Fourier Transf Body Angular Velocity Y std deviation
* fBodyGyro*std()*Z:	Fast Fourier Transf Body Angular Velocity Z std deviation
* fBodyGyro*meanFreq()*X:	Fast Fourier Transf Body Angular Velocity X Mean Frequency
* fBodyGyro*meanFreq()*Y:	Fast Fourier Transf Body Angular Velocity Y Mean Frequency
* fBodyGyro*meanFreq()*Z:	Fast Fourier Transf Body Angular Velocity Z Mean Frequency
* fBodyAccMag*mean():	Euclidean Fast Fourier Transf Body Acceleration mean
* fBodyAccMag*std():	Euclidean Fast Fourier Transf Body Acceleration std deviation
* fBodyAccMag*meanFreq():	Euclidean Fast Fourier Transf Body Acceleration Mean Frequency
* fBodyBodyAccJerkMag*mean():	Euclidean Jerk Fast Fourier Transf Body Acceleration mean
* fBodyBodyAccJerkMag*std():	Euclidean Jerk Fast Fourier Transf Body Acceleration std deviation
* fBodyBodyAccJerkMag*meanFreq():	Euclidean Jerk Fast Fourier Transf Body Acceleration Mean Frequency
* fBodyBodyGyroMag*mean():	Euclidean Fast Fourier Transf Body Angular Velocity Mean
* fBodyBodyGyroMag*std():	Euclidean Fast Fourier Transf Body Angular Velocity std deviation
* fBodyBodyGyroMag*meanFreq():	Euclidean Fast Fourier Transf Body Angular Velocity Mean Frequency
* fBodyBodyGyroJerkMag*mean():	Euclidean Jerk Fast Fourier Transf Body Angular Velocity Mean
* fBodyBodyGyroJerkMag*std():	Euclidean Jerk Fast Fourier Transf Body Angular Velocity std deviation
* fBodyBodyGyroJerkMag*meanFreq():	Euclidean Jerk Fast Fourier Transf Body Angular Velocity Mean Frequency
