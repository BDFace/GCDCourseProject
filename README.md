GCDCourseProject
================

Data Science. Getting and cleaning data. Course Project

. Download and unzip the data from the following link and put in an appropriate place on you local machine: 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'

. Set your working directory to the top level of this folder (Note. it should be called 'UCI HAR Dataset')

. Open the run_analysis.R and you can copy and paste the code directly in 'R' or 'R Studio' to run. Alternativly you can put the R file into the UCI HAR Dataset and run 'source("run_analysis.R")'

. The script will output two files into your working directory (mdf.txt and mdf_averaged.txt) and put these two files into your R working space along with an additional 'clean' table which shows the original step of cleaning the data in that it contains the combined test adn training data before any further work has been done on it by the script.

. To read the files in R use read.table("mdf.txt") and read.table("mdf_averaged.txt") which will give you two data frames. The first contains the cleaned data including both test and taining data and the subject and the activity (mdf.txt) and the second contains the data averaged by individual subjects and activities.
