# Course Projet - Getting and cleaning data
This repository stores R scripts and some markdown files useful to explanation. Scripts allows to answer to "Getting and Cleaning Data" course project on Coursera.org. 

## Avalaible files
### run_analysis.R
This R script has to be runned in order to generate result.txt which is the result of treatments on Samsung data available [HERE](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

You can find the data description [HERE](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
To run the script, you have to download and unzip data on your working directory.

### result.txt
This text file is the result of treatments on data. It is described means on each standard deviation and means columns by subject and activity from raw data. You can load it by executing `read.table("result.txt", header=TRUE)`

### CodeBook.md
The CodeBook describes each variable present in the result file. 
