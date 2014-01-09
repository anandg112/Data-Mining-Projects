#Ques 4
#Group 17: Akankshi Rastogi and Anand Gautam

#a)-----Regularized Regresion on "training_Data_credit"------

#Formula for Function Model (all other variables except "ID").
formula <- as.formula(Fail~Leverage + CumulProfit + Liquid + OverDueDebt + WorkCap + OperProfit + ShortDebt + GuarDebt + StateLag+ FiscalLag + InFinan + Links + CapStruct)

#Matrix of predictor variables.
x <- model.matrix(formula, training_Data_Credit)[,-1]

#Response Variable.
y <- training_Data_Credit$Fail

#Plotting the Cross-validation curve.
library(glmnet)
cv.out <- cv.glmnet (x, y, alpha =1, family="binomial")
plot(cv.out )

#Binomial deviance is the error which minimizes the log(lambda) in the cross validation curve.
#The minimum value for binomial deviance is shown by the dotted lines at -6. At -6, the error is minimum, after this point, error begins to increase and at -4, the error increases exponentially.


#b)------Printing the coefficients------

#Retriving best lamda value.
bestlam =cv.out$lambda.min
coef(cv.out, lambda=bestlam)

#The Lasso Model reduces the number of preditor varibles, so it is eaiser to interpret.
#Like here OperProfit, GuarDebt and FiscalLag are reduced to zero where as in logistic regression these variable were negligibly affecting the model.

#c)------ Predicting on the "test_Data_Credit" using Lasso Model.-------
#Matrix of predictor variables.
x_test <- model.matrix(formula, test_Data_Credit)[,-1]

#Response Variable.
y_test <- test_Data_Credit$Fail

grid <- 10^ seq (10,-2, length =100)
lasso.mod.test <- glmnet(x_test, y_test, alpha=1, lambda=grid, family="binomial")

lasso.prob.test <- predict(lasso.mod.test, s=bestlam , x_test)
lasso.pred.test <- rep("Active(Not Fail)",177)
lasso.pred.test[lasso.prob.test > 0.5] = "Not Active(Fail)"

#Creating the Confusion matrix.
confusionMatrix_test_4 <- table(lasso.pred.test, test_Data_Credit$Fail)
confusionMatrix_test_4

#Calculating Accuracy of test data (used in Ques 4).
Accuracy_test_4 <- sum(diag(confusionMatrix_test_4))/sum(confusionMatrix_test_4)
Accuracy_test_4
#