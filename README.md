# G-n-CDataCourse
=================================================================================
Getting and Cleaning Data Course Project
=================================================================================
This is the final proyect of Getting and Cleaning Data Course in coursera

The goal of this proyect is to prepare tidy data that can be used for later analysis. You will be required to submit: 
1) a tidy data set as described below, 
2) a link to a Github repository with your script for performing the analysis, and 
3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.

=================================================================================
Steps carried out:
1. Files are downloaded and assigned to different tables
2. The respective names are assigned to the activities
3. The averages and standard deviations of each set of measurements are obtained.
4. The names of each of the variables in the table are changed
5. The training and testing tables are merged into one
6. The final table is grouped by activity and then by subject
7. Averages are obtained for each of the two measurements
8. Rename the first column to match the two tables
9. Join the two tables with the results of each group

The final table is: finaltable.csv
it contains the mean of each measurement

The independent tidy data set with the average of each variable for each activity and each subject is:
summarytidytable.csv