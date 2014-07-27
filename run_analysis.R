#Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Q1 Merge the training and the test sets
#combine the three seperate types (S=subject Y=activity X=results) and combine results from test and training group
Xtrain <- read.table("train/X_train.txt")
Xtest <- read.table("test/X_test.txt")
X <- rbind(Xtrain, Xtest)

Strain <- read.table("train/subject_train.txt")
Stest <- read.table("test/subject_test.txt")
S <- rbind(Strain, Stest)

Ytrain <- read.table("train/y_train.txt")
Ytest <- read.table("test/y_test.txt")
Y <- rbind(Ytrain, Ytest)


#combine three datasets into one clean dataset (clean) and rename columns for "S" and "Y". 
clean <- cbind(S,Y,X)
colnames(clean)[1] <- "S"
colnames(clean)[2] <- "Y"

#delete seperated columns to declutter
rm(Stest, Strain, Xtest, Xtrain, Ytest, Ytrain)



#Q2 Extracts only the measurements on the mean and standard deviation for each measurement
#read features table and extracts all mean and.or standard deviation

features <- read.table("features.txt")

#rename columns in X with the features name, extract all with mean() and std()
names(X) <- names(X) <- features[, 2]
X1 <- X[,names(X)[grep("mean()", names(X))]]
X2 <- X[,names(X)[grep("std()", names(X))]]
mean.dev.filter<- cbind(X1,X2)

#delete seperated columns to declutter
rm(X1, X2)



#Q3 Uses descriptive activity names to name the activities in the data set
#create new column in Y called activity and add description
Y$activity
Y$activity[Y$V1 == 1] = "WALKING"
Y$activity[Y$V1 == 2] = "WALKING_UPSTAIRS"
Y$activity[Y$V1 == 3] = "WALKING_DOWNSTAIRS"
Y$activity[Y$V1 == 4] = "SITTING"
Y$activity[Y$V1 == 5] = "STANDING"
Y$activity[Y$V1 == 6] = "LAYING"



#Q4 Label the data set with descriptive variable names. 
#recombine the new S,Y and X (mean.dev.filter) table, change row names to Subject and Activity
mdf <- cbind(S,Y[,2], mean.dev.filter)
colnames(mdf)[1] <- "Subject"
colnames(mdf)[2] <- "Activity"

#write a txt file to the working directory
write.table(mdf, "mdf.txt")



#Q5 Create a second, independent tidy data set with the average of each variable
#read in activity labels and set dataframe size based on unique subjects and unqiue activites. 
ActOne <- read.table("activity_labels.txt")

Subjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
Activities = unique(Y)[,2]
numActivities = length(unique(Y)[,1])
numCols = dim(mdf)[2]

mdf_averaged = mdf[1:(numSubjects*numActivities), ]

#set row to start at one and use a for loop to run through and average all the instances of each subject
row = 1
for (s in 1:numSubjects) {
    for (a in 1:numActivities) {
      mdf_averaged[row, 1] = Subjects[s]
      mdf_averaged[row, 2] = ActOne[a, 2]
        store <- mdf[mdf$Subject==s & mdf$Activity==ActOne[a, 2], ]
      mdf_averaged[row, 3:numCols] <- colMeans(store[, 3:numCols])
        row = row+1
  }
}

#write a txt file to the working directory
write.table(mdf_averaged, "mdf_averaged.txt")

#declutter
rm(ActOne, features, S, X, Y, store, a, Activities, numActivities)
rm(numCols, numSubjects, row, s, Subjects, mean.dev.filter)
