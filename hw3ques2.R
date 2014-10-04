setwd("C:/Users/agautam/Desktop/Data Mining projects with R/HW3")
set.seed(1)
library(e1071)
#Loading the data "spam Data". 
spam <- read.csv("spam.csv" , TRUE)

#"number_items" is size(85% of data "spam.csv") for training data.
number_items <- 0.85 * nrow(spam)

#Variable "indexes" holds the row index values randomly selected for training data.
indexes <- sample(1:nrow(spam), number_items, replace = FALSE)

#"training_data" is the training data mapped from the index values from spam data
training_data <- spam[ indexes,]

#"test_data" is test data mapped from the negation of the index values from spam data.
test_data <- spam[- indexes,]

tuning_indexes <- sample(1:nrow(training_data), size= 500,replace=FALSE)

tuning_data <- spam[tuning_indexes, ]

grid_cost <- seq(10,100,length=10)
grid_gamma <-seq(0.000001,0.001,length=10)

tuning_x <- model.matrix(type~.,tuning_data)[,-1]
tuning_y <- tuning_data$type
tune.out <- tune.svm(tuning_x,tuning_y,data=tuning_data, kernel="radial", gamma=grid_gamma, cost=grid_cost)
summary(tune.out)
#The best parameters were gamma= 0.000778 and cost = 90. The best error rate was 8.2%.

training_x <- model.matrix(type~., training_data)[,-1]
training_y <- training_data$type
train_svm <- svm(training_x,training_y,kernel="radial", gamma=0.00078, cost=90)
summary(train_svm)
#There are 815 support vectors

test_x <- model.matrix(type~.,test_data)[,-1]
test_y <- test_data$type
test_svm <- svm(test_x, test_y, kernel="radial", gamma=0.00078, cost=90)
test_pred <- predict(test_svm, test_x)
summary(test_pred)
confusion_mat <- table(test_pred, test_data$type)
accuracy <- sum(diag(confusion_mat))/sum(confusion_mat)
accuracy
#Accuracy is 94.3% on test data. (399+253)/(399+253+25+14).
