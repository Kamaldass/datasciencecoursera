activityType = read.table('HAR_Dataset/Dataset/activity_labels.txt',header=FALSE); 

subject_test <- read.table('HAR_Dataset/Dataset/test/subject_test.txt',header= TRUE)
x_test <- read.table('HAR_Dataset/Dataset/test/X_test.txt',header= TRUE)
y_test <- read.table('HAR_Dataset/Dataset/test/Y_test.txt',header= TRUE)

subject_train <- read.table('HAR_Dataset/Dataset/train/subject_train.txt',header= TRUE)
x_train <- read.table('HAR_Dataset/Dataset/train/X_train.txt',header= TRUE)
y_train <- read.table('HAR_Dataset/Dataset/train/Y_train.txt',header= TRUE)

feature <- read.table('HAR_Dataset/Dataset/features.txt',header= FALSE)


colnames(activityType)  = c('activityid','activitytype');

colnames(x_test) <- feature[,2]
colnames(x_train) <- feature[,2]

colnames(subject_test) <- "subjectid"
colnames(subject_train) <- "subjectid"

colnames(y_train) <- "activityid"
colnames(y_test) <- "activityid"

merge_test <- cbind(x_test,subject_test,y_test)
merge_train <- cbind(x_train,subject_train,y_train)

merge_data <- rbind(merge_test,merge_train)

colNames  <- colnames(merge_data); 

logicalVector = (grepl("activity..",colNames) | grepl("subject..",colNames) | grepl("-mean..",colNames) & !grepl("-meanFreq..",colNames) & !grepl("mean..-",colNames) | grepl("-std..",colNames) & !grepl("-std()..-",colNames));

merge_data <- merge_data[logicalVector==TRUE];

merge_data = merge(merge_data,activityType,by='activityid',all.x=TRUE);

colNames <- colnames(merge_data);

for (i in 1:length(colNames)) 
{
      colNames[i] = gsub("\\()","",colNames[i])
      colNames[i] = gsub("-std$","StdDev",colNames[i])
      colNames[i] = gsub("-mean","Mean",colNames[i])
      colNames[i] = gsub("^(t)","time",colNames[i])
      colNames[i] = gsub("^(f)","freq",colNames[i])
      colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
      colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
      colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
      colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
      colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
      colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
      colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

colnames(merge_data) = colNames;
merge_data_no_activity  = merge_data[,names(merge_data) != 'activityType'];

tidyData <- aggregate(merge_data_no_activity[,names(merge_data_no_activity) != c('activityid','subjectid')],by=list(activityid=merge_data_no_activity$activityid,subjectid = merge_data_no_activity$subjectid),mean);

tidyData <- merge(tidyData,activitytype,by='activityid',all.x=TRUE);



subdataFeaturesNames<-feature$V2[grep("mean\\(\\)|std\\(\\)", feature$V2)]