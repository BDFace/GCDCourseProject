Data obtained from site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Link to data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, they captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the TRAINING data and 30% the TEST data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 



The working directory must be set to the folder containing the four txt files for activities, features, features_info and README and the test and train folders.

The run_analysis.R works though the following steps to clean up the data ready for analysis by producing two output tables (mdf.txt and mdf_averaged.txt) that contain the data broken down by participants (subjects) and what they did (acitivity)

Step 1. Reads the seperated test and train data and combines in three seperate tables containing the results of the experiment (X), the subject (S) and the activity (Y). These three tables are then combined in one table (clean) which is 10,299 obs of 563 variables including all the measured variables, the activity and the subject.

Step 2. Reads in the features file and renames the column headings for the data (X). This table is then filtered for only column headings containing mean() or std().

Step 3. A new column in the activity table (Y) is added and the description of the activity added.

Step 4. The resulting tables are then recombined as in Step 1 but now they contain the activity description and the appropriate column names. This outputs a table into the working directory called 'mdf.txt'

Step 5. The size of a new dataframe is calculated based on the idea of providing averages for all Subjects for all Activities to replace the row by row analysis showing the same subject doing the same activity on several different rows. This is done by setting the size of the data.frame to be the number of Subjects times by the number of Activities. This data frame is then populated with the averages using a for loop. This outputs a table into the working directory called 'mdf_averaged.txt'. This table has 180 obs as it only contains one row for each subject's actvity.

Note. at most stages I have included rm() to declutter. These rm() commands can be removed if you want to keep the interim steps of the process in your workspace.
