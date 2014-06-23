# Course project
if (!file.exists("proj")) {dir.create("proj")}

# download raw data file
fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
tmp<-"./proj/zdata.zip"
download.file(fileUrl, destfile=tmp, method="curl")
list.files("./proj")

# unzip the file 
unzip(tmp, files=NULL, exdir="./proj", overwrite=TRUE)

#read in features and activity labels
loc="./proj/UCI HAR Dataset"
allin<-list.files(loc, full.name=TRUE)
featurelab<-read.table(allin[3])
activitylab<-read.table(allin[1])

#read in test data
testloc="./proj/UCI HAR Dataset/test"
testin<-list.files(testloc, full.name=TRUE)

#label and merge test data
testsub<-read.table(testin[2])
testX<-read.table(testin[3])
colnames(testX)<-as.character(featurelab[,2])
testY<-read.table(testin[4])


m1<-cbind(testsub,testY,testX)
colnames(m1)[1] <- "subject"
colnames(m1)[2] <- "activity code"
m1$type<-"test"

#read in training data
trainloc="./proj/UCI HAR Dataset/train"
trainin<-list.files(trainloc, full.name=TRUE)

#label and merge training data
trainsub<-read.table(trainin[2])
trainX<-read.table(trainin[3])
colnames(trainX)<-as.character(featurelab[,2])
trainY<-read.table(trainin[4])

m2<-cbind(trainsub,trainY,trainX)
colnames(m2)[1] <- "subject"
colnames(m2)[2] <- "activity code"
m2$type<-"train"

#merge train and test data
comb<-rbind(m1,m2)

#find mean and std data measures and exclude all other measures (but keep #identy codes)
incl<-grepl( "subject|activity code|mean|std|type" , names(comb))
redcomb<-comb[,incl]
fincl<-grep("meanFreq", names(redcomb), invert=TRUE)
fcomb<-redcomb[,fincl]

#add text label for activity
fcomb$actlab<-activitylab[fcomb[,2],2]

#take average of measurement columns
final<-aggregate(fcomb[,3:68],by=list(fcomb$actlab), mean)

coln<-gsub("()", "", names(final), fixed=TRUE)
coln<-gsub("-", ".", coln, fixed=TRUE)
coln<-gsub("^t", "time", coln)
coln<-gsub("^f", "frequency", coln)
colnames(final)<-coln
colnames(final)[1] <- "activity"

#save the file to txt
filedest="./proj/tidyset.txt"
write.table(final, filedest)

