CodeBook of the Getting and Cleaning Data project
This file explains the content of the final dataset obtained and the various steps that were made in order to arrive at the final form.

The raw data was obtained from the file in line 1 of the file run_analysis.R, the file was unzipped and the resulting folder set as a working directory.

Four R packages were loaded (they were previously installed) in order to work with the data.

Descriptive names for the 561 variable contained in the various datasets were loaded from the "features.txt" file into a vector called "names" in two steps. The second step was necessary because the "features.txt" included an index for the variables that is not necessary for the variable names needed.

From line 15 to line 20 in the run_analysis.R file a vector is created with the ID of the activities performed by the participants of the experiment and the numeric ID is replaced with their descriptive version found in the file "activity_labels.txt".

Line 22 creates a vector with the ID of the subjects who performed the activities.

Line 23 names the vector as "subject_id"

From line 25 to line 29 a unique dataset is created with 561 variables and 10299 rows containig the values recorded for all the subjects participating in the experiment. The column names are the names contained in the "names" vector created earlier.


The dataset called "data1" selects only those variables containing a mean or standard deviation of the different existing variables.

The dataset called "data2" adds the two columns in the beginning of "data1" to serve as subject ID and activity description

The dataset is checked for any NA values.

The last code line creates a new tidy dataset that computes the mean of the columns by activity and subject. This dataset has 88 variables and 180 rows.
