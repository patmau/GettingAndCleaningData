# Getting and Cleaning Data, Course Project:
# Human Activity Recognition using Smartphones

## Overview

Jorge L. Reyes-Ortiz _et al._ released a data set for [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data set was built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

The data provided by Reyes-Ortiz _et al._ is separated into two different data sets and distributed over multiple files.
The goal of this course project is to combine this data into a singe file which contains a _tidy_ data set that is easy to read into and process with _R_.


The data for this project was downloaded from here: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>


Make sure the analysis script `run_analysis.R` and the data folder `UCI HAR Dataset` are in the same directory.
To run the script, open an R console in this directory and type:
```R
source("run_analysis.R")
run_analysis()
```

This will produce a file named `HAR_tidy_means.txt`. To load and view this file in an R console:
```R
tidy <- read.table("HAR_tidy_means".txt")
View(tidy)
```
For more, see the [Codebook](./CodeBook.md)
