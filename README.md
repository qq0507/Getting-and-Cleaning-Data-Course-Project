# Getting and Cleaning Data Course Week 4 Project Assignment

## Background

The project is created for the peer review of week 4 project assignment for the purpose of demonstrating the ability to collect, work with and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Source Data Information

The experiments have been carried out with 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

More information can be found at the data source website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for this project can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Attribute Information

For each record in the dataset it provides:

-Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
-Triaxial Angular velocity from the gyroscope.
-A 561-feature vector with time and frequency domain variables.
-Its activity label.
-An identifier of the subject who carried out the experiment.

## Install

The project requires the dplyr package.


## The Information about Creating the Tidydata Dataset

The project includes four files: README.md, Codebook.md, run_analysis.R, tidydata.txt.

-The README explains the analysis files are clear and understandable.
-The Codebook provides description of the variables,the data and any transformations to get the tidydata.
-The run_analysis is the R script used to create the tidydata.txt.
-The tidydata.txt is created by running the run_analysis.R script.