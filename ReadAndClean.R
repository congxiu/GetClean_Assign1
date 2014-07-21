setwd('/Users/xc/datasciencecoursera/GetClean_Assign1')

#read feature names
feature_names <- read.table('./UCI HAR Dataset/features.txt', 
                            comment.char = '', nrows = 561, 
                            col.names = c('temp', 'names'))
feature_names[, 1] <- NULL

#read training data, giving feature names as column names
subject_train <- 
  read.table('./UCI HAR Dataset/train/subject_train.txt')
m_train <- length(subject_train[, 1])
X_train <- read.table('./UCI HAR Dataset/train/X_train.txt',
                      comment.char = '', colClasses = 
                        rep('numeric', 561), col.names = 
                        feature_names[, 1], nrows = m_train)
Y_train <- read.table('./UCI HAR Dataset/train/Y_train.txt', 
                      comment.char = '', colClasses = 'numeric',
                      nrows = m_train, col.names = 'labels')

#read testing data
subject_test <- 
  read.table('./UCI HAR Dataset/test/subject_test.txt')
m_test <- length(subject_test[, 1])
X_test <- read.table('./UCI HAR Dataset/test/X_test.txt',
                      comment.char = '', colClasses = 
                        rep('numeric', 561), col.names = 
                        feature_names[, 1], nrows = m_test)
Y_test <- read.table('./UCI HAR Dataset/test/Y_test.txt', 
                      comment.char = '', colClasses = 'numeric',
                      nrows = m_test, col.names = 'labels')

#merge traing and testing data, X_temp, Y_temp is going to be 
#replaced by X and Y in the next step
X_temp <- rbind(X_train, X_test)
Y_temp <- rbind(Y_train, Y_test)

#process the subject variable
subject <- rbind(subject_train, subject_test)
names(subject) <- 'subject'
subject <- transform(subject, subject = as.factor(subject))

#extract only the mean and std for each measurements, then merge 
#the new data set. I excluded variables with names like 
#'meanFrenquency' here.
meanX <- X_temp[, grep('.*mean()[^F]', names(X_temp))]
stdX <- X_temp[, grep('.*std()', names(X_temp))]
X <- cbind(meanX, stdX)

#read in activity names and assign it to Y
act_names <- read.table('./UCI HAR Dataset/activity_labels.txt')
temp <- as.factor(Y_temp$labels)
levels(temp) <- act_names$V2
Y <- transform(Y_temp, labels = temp)

#merge subject and X, subject and Y
X <- cbind(subject, X)
Y <- cbind(subject, Y)

#calculate the tidy data set using dcast
#Here I do this on the new data set with only mean and std
#extracted from the original big data set, since I can't tell 
#exactly on which data set I shoud work on from the instructions.
#To do this on the oringal data set, simply apply the 
#following steps to the dataframes X_temp calculated 
#previously(with Y added)
library(plyr)
library(reshape2)
my_data <- cbind(X, 'labels' = Y$labels)
my_factor <- with(my_data, interaction(subject, labels))
my_data <- melt(my_data, id = c('subject', 'labels'),
                 measure.vars = names(my_data)[2:67])
my_data <- dcast(my_data, subject + labels ~ variable, mean)
write.table(my_data, file = 'ave_data.txt', )