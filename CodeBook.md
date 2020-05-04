# Human Activity Recognition using Smartphones

## Overview

Human Activity Recoginition project site: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data set download: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The file "HAR_tidy_means.txt" contains a dataset of 180 observations (30 subjects, each performing 6 activities).
Each observation (or row) consists of a unique combination of a subject's ID and activity, plus 66 measurement variables.
Each of these 66 measurement variables corresponds to the mean (by person and activity) of a "feature" that is itself a mean or a standard deviation in the original data set.

## Table layout

| subject.id    | activity  | tBodyAcc.mean.X   | . . . | fBodyBodyGyroJerkMag.std |
|:---:          |:---:      |:---:              |:---:  |:---: |
| 1             | walking   | 0.2773308         | .     | -0.3816019 |
| .             | .         | .                 | .     | . |
| .             | .         | .                 | .     | . |


### Columns

* `subject.id` An identifier for the subject performing the experiment.

* `activity` An identifier for the activity the subject performed during the experiment. Possible values are `laying sitting standing walking walking.upstairs walking.downstairs`.

* `tBodyAcc.mean.X, etc.` Measurement variables ("features" in the original data set): The variable names result from composing text tokens that each represent a specific aspect of the measurement.
These tokens and their meaning are given in the table below.
<br>**Example:** `tBodyAcc.mean.X` indicates the mean acceleration of the subject's body in direction of the phone's X-axis.
<br>**Units:** It is not clear in which unit the measurement variables are given.
Measurements in the original data set are in units of "g" (gravity, 9.81 m/s^2) for acceleration, and rad/s for gyration.
These measurements were then processed into so-called "features" vectors, whose values were normalized to be bound by the interval [-1, 1].
Unfortunately, the documentation in the original data set is not sufficient to derive the units of the feature vectors.


| token     | Description |
|---        |--- |
| t (prefix)| measurement in the time domain |
| f (prefix)| measurement in the frequency domain |
| Body      | measurement related to a subject's body motion |
| Gravity   | measurement related to gravity |
| Jerk      | measurement related to sudden body movement |
| Acc       | measured by the phone's accelerometer |
| Gyro      | measured by the phone's gyroscope |
| Mag       | magnitude (Euclidian norm) of a 3-dimensional signal |
| mean      | measurement is a mean in the original data set |
| std       | measurement is a standard deviation in the original data set |
| X, Y, Z (suffix)   | measurement along the X-, Y-, or Z- axis of the phone's internal coordinate system |

**Note:** Some column headers contain a token "BodyBody". It is assumed here that this is a typo and should read as just "Body". The typo is not corrected in order to facilitate back-conversion of the column names to those used in the original data set.

## Processing steps

1. Feature indices and labels are read from the file "features.txt".
   Extract labels containing "mean()" or "std()" and their indices.
   Modify feature names by replacing "-" with ".", and remove parentheses.

2. Activity indices and labels are read from the file "activity_labels.txt".
   Modify activity labels: Replace separating white space (" ") by (".").

3. For the "test" data set in the respective subdirectory:
    1. Subject IDs are read from the file "subject_test.txt"
    2. Activity indices are read from the file "y_test.txt"
    3. Feature vectors are read from the file "X_test.txt". Feature vectors that represent a mean or a standard deviation get extracted.
    
    Data in these files is combined by row.
    
4. Analogous to step 3 for the "train" data set.

5. Combine the "test" and "train" data sets.

6. Replace activity indices by labels.

7. Compute means of all feature vectors by subject ID and by activity.

8. Write out the data to file "HAR_tidy_means.txt"

## Recovering original feature names

To recover the original feature names from the columns in "HAR_tidy_means.txt", do the following in an R console:

```R
har <- read.table("HAR_tidy_means.txt")
feat <- names(har)[-(1:2)]
feat <- gsub("\\.", "-", feat)
feat <- gsub("mean", "mean()", feat)
feat <- gsub("std", "std()", feat)
feat
```
