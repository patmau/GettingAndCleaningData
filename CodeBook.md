# Human Activity Recognition using Smartphones

## Table layout

| subject.id    | activity  | tBodyAcc.mean.X   | . . . | fBodyBodyGyroJerkMag.std |
|:---:          |:---:      |:---:              |:---:  |:---: |
| 1             | walking   | 0.2773308         | .     | -0.3816019 |
| .             | .         | .                 | .     | . |
| .             | .         | .                 | .     | . |


## Variables

* `subject.id` An identifier for the subject performing the experiment.

* `activity` An identifier for the activity the subject performed during the experiment. Possible values are `laying sitting standing walking walking.upstairs walking.downstairs`.

* `tBodyAcc.mean.X, etc.` Measurement variables ("Features" in the original data set): The variable names result from composing text tokens that each represent a specific aspect of the measurement.
These tokens and their meaning are given in the table below.
<br>**Example:** `tBodyAcc.mean.X` indicates the mean acceleration of the subject's body in direction of the phone's X-axis.
<br>**Units:** It is not clear in which unit the measurement variables are given.
Measurements in the original data set are in units of "g" (gravity, 9.81 m/s^2) for acceleration, and rad/s for gyration.
These measurements were then processed into so-called "features" vectors, whose values were normalized to be bound by the interval [-1, 1].
Unfortunately, the documentation in the original data set is not sufficient to derive the units of the feature vectors.


| token     | Description |
|---        |--- |
| t (prefix)| as prefix: measurement in the time domain |
| f (prefix)| as prefix: measurement in the frequency domain |
| Body      | measurement related to a subject's body motion |
| Gravity   | measurement related to gravity |
| Jerk      | measurement related to sudden body movement |
| Acc       | measured by the phone's accelerometer |
| Gyro      | measured by the phone's gyroscope |
| Mag       | magnitude (Euclidian norm) of a 3-dimensional signal |
| mean      | measurement is a mean in the original data set |
| std       | measurement is a standard deviation in the original data set |
| X, Y, Z (suffix)   | as suffix: measurement along the X-, Y-, or Z- axis of the phone's internal coordinate system |

**Note:** Some column headers contain a token "BodyBody". It is assumed here that this is a typo and should read as just "Body". The typo is not corrected in order to facilitate back-conversion of the column names to those used in the original data set.


