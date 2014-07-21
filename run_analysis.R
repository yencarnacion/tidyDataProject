featureNames<-gsub(" ", "", read.table("UCI HAR Dataset/features.txt")[[2]])
inertialSignalsVector<-c(1:128)
inertial_body_acc_x<-paste("inertial_body_acc_x-", inertialSignalsVector, "") 
inertial_body_acc_y<-paste("inertial_body_acc_y-", inertialSignalsVector, "") 
inertial_body_acc_z<-paste("inertial_body_acc_z-", inertialSignalsVector, "") 
inertial_body_gyro_x<-paste("inertial_body_gyro_x-", inertialSignalsVector, "")
inertial_body_gyro_y<-paste("inertial_body_gyro_y-", inertialSignalsVector, "") 
inertial_body_gyro_z<-paste("inertial_body_gyro_z-", inertialSignalsVector, "") 
inertial_total_acc_x<-paste("inertial_total_acc_x-", inertialSignalsVector, "") 
inertial_total_acc_y<-paste("inertial_total_acc_y-", inertialSignalsVector, "") 
inertial_total_acc_z<-paste("inertial_total_acc_z-", inertialSignalsVector, "") 


test.subjects<-read.table("UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))
test.activity<-read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activity"))
test.features<-read.table("UCI HAR Dataset/test/X_test.txt", col.names=featureNames)
test.body_acc_x<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", col.names=inertial_body_acc_x)
test.body_acc_y<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", col.names=inertial_body_acc_y)
test.body_acc_z<-read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", col.names=inertial_body_acc_z)
test.body_gyro_x<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", col.names=inertial_body_gyro_x)
test.body_gyro_y<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", col.names=inertial_body_gyro_y)
test.body_gyro_z<-read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", col.names=inertial_body_gyro_z)
test.total_acc_x<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", col.names=inertial_total_acc_x)
test.total_acc_y<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", col.names=inertial_total_acc_y)
test.total_acc_z<-read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", col.names=inertial_total_acc_z)
alltest<-cbind(test.subjects, test.activity, test.features, test.body_acc_x, test.body_acc_y, test.body_acc_z,test.body_gyro_x, test.body_gyro_y, test.body_gyro_z,test.total_acc_x, test.total_acc_y, test.total_acc_z)
alltest$type<-"test"

train.subjects<-read.table("UCI HAR Dataset/train/subject_train.txt", col.names=c("subject"))
train.activity<-read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activity"))
train.features<-read.table("UCI HAR Dataset/train/X_train.txt", col.names=featureNames)
train.body_acc_x<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", col.names=inertial_body_acc_x)
train.body_acc_y<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", col.names=inertial_body_acc_y)
train.body_acc_z<-read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", col.names=inertial_body_acc_z)
train.body_gyro_x<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", col.names=inertial_body_gyro_x)
train.body_gyro_y<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", col.names=inertial_body_gyro_y)
train.body_gyro_z<-read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", col.names=inertial_body_gyro_z)
train.total_acc_x<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", col.names=inertial_total_acc_x)
train.total_acc_y<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", col.names=inertial_total_acc_y)
train.total_acc_z<-read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", col.names=inertial_total_acc_z)
alltrain<-cbind(train.subjects, train.activity, train.features, train.body_acc_x, train.body_acc_y, train.body_acc_z,train.body_gyro_x, train.body_gyro_y, train.body_gyro_z,train.total_acc_x, train.total_acc_y, train.total_acc_z)
alltrain$type<-"train"

alldata<-rbind(alltest, alltrain)

tidydata<-alldata[,c(grep("^activity$", colnames(alldata)), grep("std", colnames(alldata)),grep("mean", colnames(alldata)))]
tidydata[["activity"]]<-factor(tidydata[["activity"]], levels=c(1:6), labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

write.csv(tidydata, "tidydata.csv")