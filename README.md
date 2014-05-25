Course Project - Getting and Cleaning Data (Coursera)
========================================================

This project was completed for the course mentioned above.


# Methodology

* Data was downloaded manually to a folder on local machine where it was unzipped to a folder 'data' located in the main working folder.

* The r script includes operations that were completed on the data. These were as follows:-

Part 1 - Read data into R. Merged the train and test set data. Also merged the subject and activity type fields. Also read in feature names for all of the 561 features (column headings)

Part 2 - Extracted specific measurements (only concerned with features relating to mean() and std()). Regular expression used for this purpose.

Part 3 - Added descriptive activity names to rows

Part 4 - Appropriately labelled the dataset with descriptive names (this was actually completed in Part 1 of the code but I am mentioning it here to avoid any confusion).

Part 5 - This part was to create a tidy dataset with average for each activity/subject. This has not been completed in full. Sample exported to .txt file
