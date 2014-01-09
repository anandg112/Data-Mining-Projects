#Ques 2
#Group 17: Akankshi Rastogi and Anand Gautam

#a)-----Creating vector for prior probabilities.----- 
priorProbabilities <- c(rep (1/26 , 26))


#b)-----Linear Discriminant Analysis on training data "trainingData_az5000"-----
library(MASS)
lda.fit_training <- lda (char~. , prior = priorProbabilities, data = trainingData_az5000)



#c)-----Confusion Matrix for test data "testData_az5000"------ 

#"testData_az5000" is test data mapped from the negation of the index values(which was selected for "trainingData_az5000") from data "az5000".
testData_az5000 <- az5000[-indexes,]

#Linear Discriminant Analysis on test data "testData_az5000".
lda.fit_test <- lda(char~. , prior = priorProbabilities, data = testData_az5000 )

#Predicting the class of the samples from the "testData_az5000".
lda.pred_test <- predict (lda.fit_test , testData_az5000)

#Creating the Confusion matrix.
confusionMatrix_test <- table (lda.pred_test$class , testData_az5000$char)
confusionMatrix_test

#Character having best performance -- "s".
#Character having worst performance -- "x".


#d)-----Calculating Accuracy.------

#For test data "testData_az5000",
Accuracy_test <- sum(diag(confusionMatrix_test))/sum(confusionMatrix_test)
Accuracy_test




#For training Data "trainingData_az5000"

#Predicting the class of the samples from the "trainingData_az5000".
lda.pred_training <- predict (lda.fit_training , trainingData_az5000)

#Creating the Confusion matrix.
confusionMatrix_training <- table (lda.pred_training$class , trainingData_az5000$char)

Accuracy_training <- sum(diag(confusionMatrix_training))/sum(confusionMatrix_training)
Accuracy_training
 

