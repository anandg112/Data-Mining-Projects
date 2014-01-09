#QUes 3
#Group 17: Akankshi Rastogi and Anand Gautam

#Loading the data "Credit_Data". 
credit_Data <- read.table("credit_data.txt" , TRUE)

#"number_items" is size(80% of data "credit_Data") for training data.
number_items <- 0.8 * nrow(credit_Data)

#Variable "indexes" holds the row index values randomly selected for training data.
indexes <- sample(1:nrow(credit_Data), number_items, replace = FALSE)

#"training_Data_Credit" is the training data mapped from the index values from data "Credit_Data"
training_Data_Credit <- credit_Data[ indexes,]

#"test_Data_Credit" is test data mapped from the negation of the index values(which was selected for "training_Data_Credit") from data "credit_Data".
test_Data_Credit <- credit_Data[- indexes,]

#Number of cases per class in "training_Data_Credit".
casePerClass_training <-table(training_Data_Credit$Fail)
casePerClass_training

#Number of cases per class in "test_Data_Credit".
casePerClass_test_Data <- table(test_Data_Credit$Fail)
casePerClass_test_Data


#a)------Logistic Regression for training data.------

glm.fit_training <- glm(Fail~Leverage + CumulProfit + Liquid + OverDueDebt + WorkCap + OperProfit + ShortDebt + GuarDebt + StateLag+FiscalLag + InFinan + Links + CapStruct, family =binomial, data=training_Data_Credit)
glm.fit_training

#Most Important Predictor Variables: Liquid, CumulProfit, Links and ShortDebt.
#As these varibles have higgest negative and positive values respectively.


#b) Yes, the signs are what we expected. 
#Liquidity and cumulative profit have large negative magnitude coefficients (0 = not fail) demonstrating their importance in the model for not failing as they are measuring cash +marketable securities and reserves + retained earning respectively over total assets.
#On the other hand, links and short-term debt have large positive coefficients (1= failed) demonstrating their importance in the model for failing as they are measuring financial obligations from other companies and level of short-term financial debt over total assets respectively


#c)-----Confusion Matrix for test data------
#Logistic Regression for test data.
glm.fit_test <- glm(Fail~Leverage + CumulProfit + Liquid + OverDueDebt + WorkCap + OperProfit + ShortDebt + GuarDebt + StateLag+FiscalLag + InFinan + Links + CapStruct, family =binomial, data=test_Data_Credit)


#Predicting probability for bankruptcy.
glm.probs <- predict(glm.fit_test, type="response")
glm.pred <- rep("Active(Not Fail)",177)
glm.pred[glm.probs > 0.5] = "Not Active(Fail)"

#Creating the Confusion matrix.
confusionMatrix_test_3 <- table(glm.pred, test_Data_Credit$Fail)
confusionMatrix_test_3

#Calculating Accuracy of test data (used in Ques 4).
Accuracy_test_3 <- sum(diag(confusionMatrix_test_3))/sum(confusionMatrix_test_3)
Accuracy_test_3
