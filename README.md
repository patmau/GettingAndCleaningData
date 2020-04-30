# Getting and Cleaning Data: Course Project

## Human Activity Recognition using Smartphones

More details about the project: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The data for this project was downloaded from here: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


Make sure the anaylis script `run_analysis.R` and the data folder `UCI HAR Dataset` are in the same directory.
To run the script, open an R console in this directory and type:
```R
source("run_analysis.R")
run_analysis()
```

This will produce a file named `tidy_averages.txt`. To load and view this file in an R console:
```R
tidy <- read.table("tidy_averages.txt")
View(tidy)
```
For more, see the [Codebook](./CodeBook.md)
