# Getting and Cleaning Data, Course Project:
# Human Activity Recognition using Smartphones

## Overview

Jorge L. Reyes-Ortiz _et al._ released a data set for [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The data set was built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors.

The data provided by Reyes-Ortiz _et al._ is separated into two different data sets and distributed over multiple files.
The goal of this course project is to combine this data, extract means and standard deviations of measurements, and finally produce a singe file which contains a _tidy_ data set that is easy to read into and process with R.


## Perform the analysis

The script `run_analysis.R` in this repository performs this analysis.

### Requirements

- The script requires the following R packages: `dplyr, reshape2`.
- Input data can be downloaded here: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>.
- The script `run_analysis.R` and the data folder `UCI HAR Dataset` (obtained from unpacking the downloaded archive) must be located in the same directory.

### Run the script

In the directory where `run_analysis.R` and the data folder `UCI HAR Dataset` are located, open an R console and type:
```R
source("run_analysis.R")
run_analysis()
```

The script will produce a file named `HAR_tidy_means.txt`. To load and view this file in the R console:
```R
tidy <- read.table("HAR_tidy_means".txt")
View(tidy)
```

See the [Codebook](./CodeBook.md) in this repository for information about variables in `HAR_tidy_means.txt` and how the original data set was processed.

