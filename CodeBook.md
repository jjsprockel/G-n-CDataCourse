=================================================================================
Getting and Cleaning Data Course Project
by John Sprockel

Date: July 18, 2020
=================================================================================

In this codebook I describe the variables of the final project of the Getting and Cleaning Data Course

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

** Reference:
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.


>>Variables List:

"subject"  
    Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

"activity" 
    Each person performed six activities:
    1 WALKING
    2 WALKING_UPSTAIRS
    3 WALKING_DOWNSTAIRS
    4 SITTING
    5 STANDING
    6 LAYING

"meanx"
  The mean of the 561-feature vector with time and frequency domain variables.

"stdevx" 
  The standard desviation of the 561-feature vector with time and frequency domain variables.


"meanaccx", "meanacy", "meanaccz"
  The mean of triaxial acceleration from the accelerometer with the estimated body acceleration (in 3 axis: x, y, z).

"stdevaccx", "stdevaccy", "stdevaccz"
  The standard desviation of triaxial acceleration from the accelerometer with the estimated body acceleration (in 3 axis: x, y, z).


"meangyrox", "meangyroy", "meangyroz"
  The mean of triaxial Angular velocity from the gyroscope (in 3 axis: x, y, z).

"stdevgyrox", "stdevgyroy", "stdevgyroz"
  The standard desviation of triaxial Angular velocity from the gyroscope (in 3 axis: x, y, z).


"meantotaccx", "meantotacy", "meantotaccz"
  The mean of triaxial acceleration from the accelerometer with total acceleration (in 3 axis: x, y, z).

"stdevtotaccx", "stdevtotaccy", "stdevtotaccz"
  The standard desviation of of triaxial acceleration from the accelerometer with total acceleration (in 3 axis: x, y, z).

"activity_subject"
  In the tidy dataset, the combination of the 2 variables for do the summary