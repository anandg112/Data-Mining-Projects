Data-Mining-Projects
====================

Project files from COEN 281

This repository contains project files from Data Mining & Pattern Recognition (COEN 281). Please install the required R packages before using the files (i.e. rpart, nnet, e1071).

HW1 - The dataset “housetype.data” represents an extract from a commercial marketing database created from questionnaires filled out by shopping mall customers in the San Francisco Bay area.

hw1ques2.R - attributeHist function takes the name of an attribute, such as “age", finds the corresponding column in the table, and produces the histogram. By default, it puts the long attribute name into the title and on the horizontal axis. If the attribute contains “missing values” (represented as NA in the data), a message with the missing count is printed.

HW2 - The file “az-5000.txt” contains 5000 lowercase character samples that have been preprocessed i.e. - raw images were scaled to fit in a 128x128 box and resampled to keep 9 coordinate pairs only. Additionally, the coordinate’s values were further normalized to lie between 0.0 and 1.0. Each character is thus represented by 18 real values. The class labels are given by the first value in each row.

hw2ques1_2.R - The data is loaded onto 
