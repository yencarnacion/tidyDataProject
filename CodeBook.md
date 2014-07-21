## The Code Book

* Information about the data for this project

    The data for this project comes from:

    Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

    It was sourced from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

* Study Design

    Experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity was captured at a constant rate of 50Hz.  For more information, see the README.txt file in the zip file reference above.

* Information about the variables for this project

    The features in the original database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. Those signals were used to estimate variables of a feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    * tBodyAcc-XYZ
    * tGravityAcc-XYZ
    * tBodyAccJerk-XYZ
    * tBodyGyro-XYZ
    * tBodyGyroJerk-XYZ
    * tBodyAccMag
    * tGravityAccMag
    * tBodyAccJerkMag
    * tBodyGyroMag
    * tBodyGyroJerkMag
    * fBodyAcc-XYZ
    * fBodyAccJerk-XYZ
    * fBodyGyro-XYZ
    * fBodyAccMag
    * fBodyAccJerkMag
    * fBodyGyroMag
    * fBodyGyroJerkMag

    From the above signals, the following set of variables were estimated in the original database:

    * mean(): Mean value
    * std(): Standard deviation
    * mad(): Median absolute deviation 
    * max(): Largest value in array
    * min(): Smallest value in array
    * sma(): Signal magnitude area
    * energy(): Energy measure. Sum of the squares divided by the number of values. 
    * iqr(): Interquartile range 
    * entropy(): Signal entropy
    * arCoeff(): Autorregresion coefficients with Burg order equal to 4
    * correlation(): correlation coefficient between two signals
    * maxInds(): index of the frequency component with largest magnitude
    * meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    * skewness(): skewness of the frequency domain signal 
    * kurtosis(): kurtosis of the frequency domain signal 
    * bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
    * angle(): Angle between to vectors.

4. Summary choices that were made on the original data:

    To create the tidy dataset the following was done:

    * The measurements on the mean and standard deviation were extracted from the data. 
    * Descriptive activity names to name the activities in the data set were used. 
    * The data set was labeled with descriptive variable names. 
    * The tidy data set was created with the average of each variable for each activity and each subject. 
    * The R script that generates the tidy data was tested with R version 3.1.0