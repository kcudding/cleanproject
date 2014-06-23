cleanproject
============

Reads in raw data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Program uses an archived set at 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Program downloads and unzips the data to a directory called "proj", which is created 
if it does not previously exist. Code then merges the subject identifier and activity 
code with the 561 measurements for both the training data set and the test data 
set, and provides column labels, producing a single dataframe.

Program then selects only mean and standard deviation of measurements, and takes the 
average of these measures grouped by activity type (WALKING, WALKING_UPSTAIRS,
WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). This column labels of this summarized 
dataset are tidyed up by removing awkward characters such as dashes and parentheses, 
and by including the full terms "time" and "frequency"
in the names. Code than writes the summary data to a new file called tidyset.txt.  


