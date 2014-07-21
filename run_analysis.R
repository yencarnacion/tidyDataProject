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

calculatePath<-function(filetype, filestart){
   pathbegin<-paste("UCI HAR Dataset/", filetype, sep="")
   pathend<-paste(filetype, ".txt", sep="")
   calculatedpath<-paste(paste(pathbegin, filestart, sep=""), pathend, sep="")
   calculatedpath
}

readData<-function(type){    
   df.subjectId<-read.table(calculatePath(type, "/subject_"), col.names=c("subjectId"))
   df.activity<-read.table(calculatePath(type, "/y_"), col.names=c("activity"))
   df.features<-read.table(calculatePath(type, "/X_"), col.names=featureNames)
   df.body_acc_x<-read.table(calculatePath(type, "/Inertial Signals/body_acc_x_"), col.names=inertial_body_acc_x)
   df.body_acc_y<-read.table(calculatePath(type, "/Inertial Signals/body_acc_y_"), col.names=inertial_body_acc_y)
   df.body_acc_z<-read.table(calculatePath(type, "/Inertial Signals/body_acc_z_"), col.names=inertial_body_acc_z)
   df.body_gyro_x<-read.table(calculatePath(type, "/Inertial Signals/body_gyro_x_"), col.names=inertial_body_gyro_x)
   df.body_gyro_y<-read.table(calculatePath(type, "/Inertial Signals/body_gyro_y_"), col.names=inertial_body_gyro_y)
   df.body_gyro_z<-read.table(calculatePath(type, "/Inertial Signals/body_gyro_z_"), col.names=inertial_body_gyro_z)
   df.total_acc_x<-read.table(calculatePath(type, "/Inertial Signals/total_acc_x_"), col.names=inertial_total_acc_x)
   df.total_acc_y<-read.table(calculatePath(type, "/Inertial Signals/total_acc_y_"), col.names=inertial_total_acc_y)
   df.total_acc_z<-read.table(calculatePath(type, "/Inertial Signals/total_acc_z_"), col.names=inertial_total_acc_z)
   alldf<-cbind(df.subjectId, df.activity, df.features, df.body_acc_x, df.body_acc_y, df.body_acc_z, df.body_gyro_x, df.body_gyro_y, df.body_gyro_z, df.total_acc_x, df.total_acc_y, df.total_acc_z)
   alldf$type<-"test"
   alldf
}

alldata<-rbind(readData("test"), readData("train"))

pretidydata<-alldata[,c(grep("^subjectId$", colnames(alldata)), grep("^activity$", colnames(alldata)), grep("std", colnames(alldata)),grep("mean", colnames(alldata)))]
pretidydata[["activity"]]<-factor(pretidydata[["activity"]], levels=c(1:6), labels=c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

tidydata<-aggregate(. ~ subjectId+activity,data = pretidydata,FUN=mean)

write.csv(tidydata, "tidydata.csv")