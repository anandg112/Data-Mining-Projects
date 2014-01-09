#loading credit data
credit.xy <- read.table("credit_data.txt", header = TRUE)
dim(credit.xy)

set.seed(123)

#selecting 80% of data as training data
train <- sample(1:885, 0.8*885)

#showing the number of cases per class for both training and test data
table(credit.xy$Fail[train])
table(credit.xy$Fail[-train])

#fitting logistic regression to training data and creating summary data
credit.glm <- glm(Fail~.-Id, family = binomial, data = credit.xy[train,])
summary(credit.glm)

#predicting if a firm will go bankrupt if the predicted probability is 
#P(Y=1|X=x) of bankruptcy is 0.5 or greater and creating a confusion matrix

yHat <- predict(credit.glm , credit.xy[-train, c(1,3:15)], type = "response")
table(credit.xy$Fail[-train], yHat >= 0.5)