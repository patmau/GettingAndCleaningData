library(dplyr)

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
    usefulFeatureNames <- gsub("\\(\\)", "", usefulFeatureNames)
    
    ## activities
    ## 
    activityFile <- paste(dataDir, "activity_labels.txt", sep = "/")
    activityLabels <- read.table(activityFile)
    
    
    ## process files in dataset subdirectories
    ## 
    datasets = list("train" = "train", "test" = "test")
    
    tidy <- lapply(datasets, function(datasetName) {
        raw <- read_raw(datasetName)
        
        # combine subject, activity and dataset
        dataSet <- rep(datasetName, length(raw$subject))
        tidyInitial <- cbind(dataSet, raw$subject, raw$activity)
        colnames(tidyInitial) <- c("dataset", "subject.id", "activity")
        
        # extract interesting features and combine
        interestingFeatures <- raw$meas[, usefulIdx]
        colnames(interestingFeatures) <- usefulFeatureNames
        
        # get rid of possibly very large raw object
        rm(raw)
        
        cbind(tidyInitial, interestingFeatures)
    })
    
    tidyComplete = rbind(tidy$train, tidy$test)
    write.table(tidyComplete, file = "tidy_complete.txt")
}
