Data obtained from site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Link to data: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The working directory must be set to the folder containing the four txt files for activities, features, features_info and README and the test and train folders.

The run_analysis.R works though the following steps to clean up the data ready for analysis by producing two output tables (mdf.txt and mdf_averaged.txt) that contain the data broken down by participants (subjects) and what they did (acitivity)

Step 1. Reads the seperated test and train data and combines in three seperate tables containing the results of the experiment (X), the subject (S) and the activity (Y). These three tables are then combined in one table (clean).

Step 2. Reads in the features file and renames the column headings for the data (X). This table is then filtered for only column headings containing mean() or std().

Step 3. A new column in the activity table (Y) is added and the description of the activity added.

Step 4. The resulting tables are then recombined as in Step 1 but now they contain the activity description and the appropriate column names. This outputs a table into the working directory called 'mdf.txt'

Step 5. The size of a new dataframe is calculated based on the idea of providing averages for all Subjects for all Activities to replace the row by row analysis showing the same subject doing the same activity on several different rows. This is done by setting the size of the data.frame to be the number of Subjects times by the number of Activities. This data frame is then populated with the averages using a for loop. This outputs a table into the working directory called 'mdf_averaged.txt'.

Note. at most stages I have included rm() to declutter. These rm() commands can be removed if you want to keep the interim steps of the process in your workspace.
