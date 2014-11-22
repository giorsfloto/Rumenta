
# Call of the packages needed for this script #
library(data.table)
library(plyr)
library(assertthat)
library(reshape2)

# Creation of directory Assignment #
if (!file.exists("Assignment")) {
        dir.create("Assignment")}                           

# Download of the database #
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
download.file(fileurl,destfile = "./Assignment/Activity_Recognition.zip", method="curl")

# Decompression of txt files #
unzip("./Assignment/Activity_Recognition.zip", files = NULL, list = FALSE, overwrite = TRUE,
      junkpaths = FALSE, exdir = "./Assignment", unzip = "internal",
      setTimes = FALSE)

# Reading of test measurements #
xtest <- read.table("./Assignment/UCI HAR Dataset/test/X_test.txt")
# Adding of descriptive variable names #
features <- read.table(("./Assignment/UCI HAR Dataset/features.txt"))
names(xtest) <- features$V2
# Read and adding of Activity Codes to test measurements #
ytest <- read.table("./Assignment/UCI HAR Dataset/test/Y_test.txt",col.names="ACT_Code")
# Creation of test dataframe with test results and activity codes #
test <-cbind(ytest,xtest)
# Reading and adding subject codes #
subjects <- read.table("./Assignment/UCI HAR Dataset/test/subject_test.txt", col.names="Subj_Code")
test <-cbind(subjects,test)

# Reading of training measurements #
xtrain <- read.table("./Assignment/UCI HAR Dataset/train/X_train.txt")
# Adding of descriptive variable names #
names(xtrain) <- features$V2
# Read and adding of Activity Codes to training measurements #
ytrain <- read.table("./Assignment/UCI HAR Dataset/train/Y_train.txt",col.names="ACT_Code")
train <-cbind(ytrain,xtrain)
# Reading and adding subject codes #
subjects_train <- read.table("./Assignment/UCI HAR Dataset/train/subject_train.txt", col.names="Subj_Code")
train <-cbind(subjects_train,train)

# Creation of one dataframe with test and training measurements#
dataset <-rbind(test,train)

# Subset for each measurement of Activity and Subject codes and of mean and std deviation variables #
dataset_clean <-dataset[ , grepl( "mean", names(dataset) ) | grepl( "std", names(dataset) )
                        | grepl( "Code", names(dataset) )]

# Adding descriptive Activity Names #
activity_labels <- read.table(("./Assignment/UCI HAR Dataset/activity_labels.txt"))
colnames(activity_labels) <- c("ACT_Code", "ACT_Des")
dataset_clean <- merge(activity_labels,dataset_clean,"ACT_Code")

# Melt of dataset and definition of id variables and measure variables #
dataclean_melt <-melt(dataset_clean, id=c("ACT_Code","ACT_Des","Subj_Code"),measure.vars=c("tBodyAcc-mean()-X",        "tBodyAcc-mean()-Y"  ,             
                                                                                   "tBodyAcc-mean()-Z"   ,
                                                                                   "tBodyAcc-std()-X"   ,             "tBodyAcc-std()-Y"         ,    
                                                                                   "tBodyAcc-std()-Z"    ,            "tGravityAcc-mean()-X"   ,      
                                                                                   "tGravityAcc-mean()-Y"  ,          "tGravityAcc-mean()-Z"  ,         
                                                                                   "tGravityAcc-std()-X"   ,          "tGravityAcc-std()-Y"      ,      
                                                                                   "tGravityAcc-std()-Z"   ,          "tBodyAccJerk-mean()-X" ,        
                                                                                   "tBodyAccJerk-mean()-Y"   ,        "tBodyAccJerk-mean()-Z"      ,    
                                                                                   "tBodyAccJerk-std()-X"    ,        "tBodyAccJerk-std()-Y"    ,       
                                                                                   "tBodyAccJerk-std()-Z"    ,        "tBodyGyro-mean()-X"    ,         
                                                                                   "tBodyGyro-mean()-Y"   ,           "tBodyGyro-mean()-Z"   ,          
                                                                                   "tBodyGyro-std()-X"      ,         "tBodyGyro-std()-Y"     ,         
                                                                                   "tBodyGyro-std()-Z"       ,        "tBodyGyroJerk-mean()-X"  ,       
                                                                                   "tBodyGyroJerk-mean()-Y"    ,      "tBodyGyroJerk-mean()-Z" ,        
                                                                                   "tBodyGyroJerk-std()-X"    ,       "tBodyGyroJerk-std()-Y"  ,        
                                                                                   "tBodyGyroJerk-std()-Z"     ,      "tBodyAccMag-mean()"      ,       
                                                                                   "tBodyAccMag-std()"         ,      "tGravityAccMag-mean()"   ,       
                                                                                   "tGravityAccMag-std()"        ,    "tBodyAccJerkMag-mean()"    ,     
                                                                                   "tBodyAccJerkMag-std()"   ,        "tBodyGyroMag-mean()"    ,        
                                                                                   "tBodyGyroMag-std()"        ,      "tBodyGyroJerkMag-mean()"  ,      
                                                                                   "tBodyGyroJerkMag-std()"   ,       "fBodyAcc-mean()-X",       
                                                                                   "fBodyAcc-mean()-Y"        ,       "fBodyAcc-mean()-Z" ,             
                                                                                   "fBodyAcc-std()-X"           ,     "fBodyAcc-std()-Y"     ,          
                                                                                   "fBodyAcc-std()-Z"              ,  "fBodyAcc-meanFreq()-X"   ,       
                                                                                   "fBodyAcc-meanFreq()-Y"   ,        "fBodyAcc-meanFreq()-Z"   ,       
                                                                                   "fBodyAccJerk-mean()-X"     ,      "fBodyAccJerk-mean()-Y",          
                                                                                   "fBodyAccJerk-mean()-Z"      ,     "fBodyAccJerk-std()-X" ,          
                                                                                   "fBodyAccJerk-std()-Y"        ,    "fBodyAccJerk-std()-Z"   ,        
                                                                                   "fBodyAccJerk-meanFreq()-X"   ,    "fBodyAccJerk-meanFreq()-Y" ,   
                                                                                   "fBodyAccJerk-meanFreq()-Z"   ,    "fBodyGyro-mean()-X",          
                                                                                   "fBodyGyro-mean()-Y"        ,      "fBodyGyro-mean()-Z" ,           
                                                                                   "fBodyGyro-std()-X"        ,       "fBodyGyro-std()-Y"  ,            
                                                                                   "fBodyGyro-std()-Z"            ,   "fBodyGyro-meanFreq()-X",         
                                                                                   "fBodyGyro-meanFreq()-Y"   ,       "fBodyGyro-meanFreq()-Z",         
                                                                                   "fBodyAccMag-mean()"     ,         "fBodyAccMag-std()" ,           
                                                                                   "fBodyAccMag-meanFreq()"       ,   "fBodyBodyAccJerkMag-mean()",     
                                                                                   "fBodyBodyAccJerkMag-std()"    , "fBodyBodyAccJerkMag-meanFreq()" ,
                                                                                   "fBodyBodyGyroMag-mean()"     ,   "fBodyBodyGyroMag-std()" ,        
                                                                                   "fBodyBodyGyroMag-meanFreq()"  ,   "fBodyBodyGyroJerkMag-mean()" , 
                                                                                   "fBodyBodyGyroJerkMag-std()"    ,  "fBodyBodyGyroJerkMag-meanFreq()"))

# Creation of a new dataset with the average of every measure variable for each activity and subject #
dataset_means <-dcast(dataclean_melt, ACT_Code + ACT_Des + Subj_Code ~ variable, mean)

# Writing the final database in a txt file #
write.table(dataset_means, "datasetmeans.txt", row.names=FALSE)
