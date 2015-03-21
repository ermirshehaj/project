a <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(a, "getdata-projectfiles-UCI HAR Dataset.zip")
unzip("getdata-projectfiles-UCI HAR Dataset.zip")
if (getwd()!="C:/Users/Ermir/Documents/UCI HAR Dataset"){setwd("C:/Users/Ermir/Documents/UCI HAR Dataset")}
list.files()
library(data.table)
library(plyr)
library(dplyr)
library(tidyr)


names <- read.table("features.txt")
names <- names[,2]

activities_id <- rbind(read.table("test/y_test.txt"), read.table("train/y_train.txt"))
names(activities_id) <- "activity_id"
activities_name <- read.table("activity_labels.txt")
for (i in activities_id[]){
        activities_id<- activities_name[i,2]
}

subject_id <- rbind(read.table("test/subject_test.txt"), read.table("train/subject_train.txt"))
names(subject_id) <- "subject_id"

training <- read.table("train/X_train.txt",col.names=names)

test <- read.table("test/X_test.txt",col.names=names)

data <- rbind(test,training)

data1 <- select(data,contains("mean"),contains("std"))

data2 <- cbind(subject_id,activities_id,data1)

data3 <- data2

sum(is.na(data2))



data3 <- data2 %>% group_by (subject_id,activities_id) %>% summarise_each(funs(mean))

