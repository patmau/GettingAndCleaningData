library(dplyr)
library(reshape2)

run_analysis <- function() {
    
    dataDir <- "UCI HAR Dataset"

    ## function to read data files in subdirectories
    ##     
    read_raw <- function(dataset) {
        filePrefix = list("subject" = "subject_", "meas" = "X_", "activity" = "y_")
        
        print(paste("Reading raw files for dataset:", dataset))
        rawData = lapply(filePrefix, function(prefix) {
            filename <- paste(prefix, dataset, ".txt", sep = "")
            pathToFile <- paste(dataDir, dataset, filename, sep = "/")
            print(pathToFile)
            read.table(pathToFile)
        })
        print("")

        rawData
    }
    
    ## read feature file and extract names containing "mean()" or "std()"
    ## 
    featureFile <- paste(dataDir, "features.txt", sep = "/")
    features <- read.table(featureFile, stringsAsFactors = FALSE)
    
    usefulFeatureIdx <- grep("mean\\(\\)|std\\(\\)", features[, 2])
    usefulFeatureNames <- features[usefulFeatureIdx, 2]
    # remove parentheses
    usefulFeatureNames <- gsub("\\(\\)", "", usefulFeatureNames) 
    
    ## activities
    ## 
    activityFile <- paste(dataDir, "activity_labels.txt", sep = "/")
    activityLabels <- read.table(activityFile)
    activityLabels <- gsub("_", ".", tolower(activityLabels[, 2]))
    activityLabels <- gsub("stairs", "", activityLabels)
    
    
    ## process files in dataset subdirectories
    ## 
    datasets = list("train" = "train", "test" = "test")
    
    tidy <- lapply(datasets, function(datasetName) {
        raw <- read_raw(datasetName)
        
        # combine subject, activity and dataset
        dataSet <- rep(datasetName, length(raw$subject))
        tidyInitial <- cbind(dataSet, raw$subject, raw$activity)
        colnames(tidyInitial) <- c("dataset", "subject.id", "activity")
        
        # descriptive activities
        tidyInitial <- mutate(tidyInitial, activity = factor(activity, labels = activityLabels, ordered = TRUE))
        
        # extract interesting features and combine
        interestingFeatures <- raw$meas[, usefulFeatureIdx]
        colnames(interestingFeatures) <- usefulFeatureNames
        
        # get rid of large raw object
        rm(raw)
        
        cbind(tidyInitial, interestingFeatures)
    })
    
    tidyComplete <- rbind(tidy$train, tidy$test)
    
    ## average by activity and by subject
    meltComplete <- melt(tidyComplete, id.vars = names(tidyComplete[1:3]))
    tidyAverages <- dcast(meltComplete, subject.id + activity ~ variable, mean, drop = FALSE)
    
    write.table(tidyAverages, file = "tidy_averages.txt")
}
