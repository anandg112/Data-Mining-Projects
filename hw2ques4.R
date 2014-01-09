#loading credit data
credit.xy <- read.table("credit_data.txt", header = TRUE)
dim(credit.xy)

set.seed(123)

#selecting 80% of data as training data
train <- sample(1:885, 0.8*885)

# refactoring credit data frame as a matrix and mapping y (response variables)
#values from 0/1 to -1/1
x <- as.matrix(credit.xy[train, 3:15])
y <- 2*credit.xy$Fail[train]-1

#fitting regularized logistic regression to training data and plotting cross
#validation curve
credit.glmnet <- cv.glmnet(x, y, family = "binomial")
plot(credit.glmnet)
#Error decreases between lambda min and lambda max and starts 
#flattening out after about 10 predictors have non-zero coefficients.

#passing the best lambda value to coefficient function
beta <- coef(credit.glmnet, lambda = credit.glmnet$lambda.1se)
print(beta)
#Three predictors, OperProfit, FiscalLag and InFinan are
#equal to zero.

#predicting on test set, creating confusion matrix and calculating accuracy
x.test <- as.matrix(credit.xy[-train, c(3:15)])
y.test <- credit.xy$Fail[-train]

yHat <- as.numeric(predict(credit.glmnet, x.test, type = "class", lambda = credit.glmnet$lambda.1se))
conf_mat <- table(y.test, yHat)

accuracy <- sum(diag(conf_mat))/sum(conf_mat)
