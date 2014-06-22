cleanproject
============

Reads in raw data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Code uses an archived set at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Code merges the subject identifier and activity code with the 561 measurements 
for both the training data set and the test data set, producing a single dataframe 
for all the data.

Then selects only mean and standard deviation of measurements, takes the average of
these by activity, and writes to a new file called tidyset.txt.

