# Download the data set in the data folder
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Read data from UCI HAR Dataset
## Read the Activity files
dataActivityTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt",header=F)
dataActivityTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt",header = F)
## Read the Subject files
dataSubjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt",header=F)
dataSubjectTest <-read.table("./data/UCI HAR Dataset/test/subject_test.txt",header=F)
## Read the Feature files
dataFeatureTrain <-read.table("./data/UCI HAR Dataset/train/x_train.txt",header=F)
dataFeatureTest <- read.table("./data/UCI HAR Dataset/Test/x_test.txt",header=F)

# Look at the structure of the above files
str(dataActivityTrain)
str(dataActivityTest)
str(dataSubjectTrain)
str(dataSubjectTest)
str(dataFeatureTrain)
str(dataFeatureTest)

# Combine the training and the test data 
## Combine data for Activity, Subject and Feature dataset
dataActivity <- rbind(dataActivityTrain, dataActivityTest)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataFeature <- rbind(dataFeatureTrain, dataFeatureTest)

## Set names 
names(dataActivity) <- c("Activity")
names(dataSubject) <- c("Subject")
ReadFeatureNames <- read.table("./data/UCI HAR Dataset/features.txt",header =F)
names(dataFeature)<-ReadFeatureNames$V2

## Combine files by column
Activity_Subject<- cbind(dataActivity, dataSubject)
Dat <- cbind(Activity_Subject,dataFeature)
# Extracts only the measurements on the mean and standard deviation for each measurement 
## Extract names of features with mean or std
Mean_Std <-ReadFeatureNames$V2[grep("mean\\(\\)|std\\(\\)",ReadFeatureNames$V2)]
## Collect all the selected names of names
SubsetNames <-c(as.character(Mean_Std),"Activity","Subject")
## Subset the Dat by selected names of features
Dat<-subset(Dat,select=SubsetNames)
## Check the structure of the Dat
str(Dat)

# Uses descriptive activity names to name the activities in the data set
## Read descriptive activity names from "activity_labels.txt"
Activity_Labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
## Factorize Dat by variable Activity
colnames(Activity_Labels)<-c("activityID","activityType")
Data_Merge <-merge(Dat,Activity_Labels,by.x = "Activity", by.y ="activityID")

# Appropriately labels the data set with descriptive variable names
names(Data_Merge)<- gsub("^t","time",names(Data_Merge))
names(Data_Merge)<- gsub("^f","frequency",names(Data_Merge))
names(Data_Merge)<- gsub("Acc","Accelerometer",names(Data_Merge))
names(Data_Merge)<- gsub("Gyro","Gyroscope",names(Data_Merge))
names(Data_Merge)<- gsub("Mag","Magnitude",names(Data_Merge))
names(Data_Merge)<- gsub("BodyBody","Body",names(Data_Merge))

# Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject
library(dplyr) 
Mean_All <- Data_Merge %>% group_by(activityType, Subject) %>% summarize_all(funs(mean))
write.table(Mean_All,file ="tidydata.txt", row.names=FALSE)

