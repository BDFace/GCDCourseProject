Data obtained from site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Link to data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_anaysis.R works though the following steps to clean up the data ready for analysis by producing two output tables (mdf.txt and mdf_averaged.txt) that contain the data broken down by participants (subjects) and what they did (acitivity)
Step 1. reads the seperated test and train data and combines in three seperate table containing the results of the experiment (X), the subject (S) and the activity (Y). These three tables are then combined in one table (clean)
