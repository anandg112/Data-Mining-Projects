Data-Mining-Projects
====================

Project files from COEN 281 - Data Mining and Pattern Recognition

This repository contains project files from Data Mining & Pattern Recognition (COEN 281) at Santa Clara University. Please install the required R packages before using the files (i.e. MASS, glmnet, rpart, nnet, e1071).

hw1ques2.R - The dataset “housetype_data.txt” represents an extract from a commercial marketing database created from questionnaires filled out by shopping mall customers in the San Francisco Bay area. attributeHist function takes the name of an attribute, such as “age", finds the corresponding column in the table, and produces the histogram. By default, it puts the long attribute name into the title and on the horizontal axis. If the attribute contains “missing values” (represented as NA in the data), a message with the missing count is printed.

HW2 - The file “AZ-5000.txt” contains 5000 lowercase character samples that have been preprocessed i.e. - raw images were scaled to fit in a 128x128 box and resampled to keep 9 coordinate pairs only. Additionally, the coordinate’s values were further normalized to lie between 0.0 and 1.0. Each character is thus represented by 18 real values. The class labels are given by the first value in each row.

hw2ques1_2.R - The data is loaded onto R using the read.table command. 80% of the training data is selected as training data. Number of cases per class is shown by using the table command. A vector of prior probabilities equal to 1/26 is created for each class. Linear discriminant analysis (LDA) is run on the training data with equal priors from above. A confusion matrix is created on the test data with table and predict command. This is a 26x26 matrix with diagonal elements equal to correct classifications and off-diagonal elements equal to mistakes.

hw2ques3.R - “credit_data.txt” contains information about the financial characteristics of 885 firms which applied for a bank loan. The sample command is used to randomly select 80% of the data for training. The table command is used to show the number of cases per class in the training and test data set. Glm command is used to fit a logistic regression to predict which firms will go bankrupt. A confusion matrix is created to predict if a firm will go bankrupt if the predicted probability P(Y = 1 | X
= x) of bankruptcy is 0.5 or greater.

hw2ques4.R - Glmnet fits the penalized logistic regression models using the lasso. In this file, regularized model is compared to the unregularized model when applied to the credit data. cv.glmnet is used to fit the regularized logistic regression to the credit training data. Cross-validation curve is plotted. The best lambda value is retrieved and passed to the coef() function to retrieve the corresponding coefficient vector. The predict function with the same value of lambda is used to predict on the test data set. A confusion matrix is produced.

hw3ques1.R - The file “AZ-5000.txt” contains 5000 lowercase character samples that have been preprocessed. It is used again with 80/20 split between train and test data. We want to use 18 input features, 8 hidden units and 26 output units. R library nnet is used to fit feed-forward neural networks with size between 1-20. Mean square error is computed by subtracting the fitted value returned by nnet from the targetMatrix(binaryM). The predict command is used to compute MSE for the test set. Lastly, results are plotted for MSE for training and test dataset.

hw3ques2.R - The “spam.csv” data, collected at HP Labs, contains information on 4601 e-mails which were classified as spam or non-spam. Each e-mail is described by 57 variables indicating the frequency of certain words and characters in the message. 15% of data is used for testing. From the training dataset, a smaller random sample size of 500 is used for "tuning". The tune.svm command is used from R library e1071 to conduct a grid search for the best values of lambda and cost. Summary command is used to extract the best parameters. Final model is trained on all the training data. Finally, a confusion matrix is created for test dataset and accuracy is reported.

hw3ques3.R - The dataset “housetype_data.txt” represents an extract from a commercial marketing database created from questionnaires filled out by shopping mall customers in the San Francisco Bay area.