setwd("C:/Users/agautam/Desktop/Data Mining projects with R/HW4")
set.seed(1)
platform = "windows"
rfhome = "C:/Program Files/R/R-3.0.2/rulefit3"
source("C:/Program Files/R/R-3.0.2/rulefit3/rulefit.r")
library(akima, lib.loc=rfhome)
library(gdata)

#reading the diamond data file 
diamond <- read.xls("Diamond_Data.xls", sheet="Raw Data", perl="C:/strawberry/perl/bin/perl.exe")
head(diamond,5)

summary(diamond)
#showing the distribution of Diamond cuts and prices
hist(diamond$Price, col="blue1", xlab="Diamond Prices", ylab="Frequency", main="Distribution of diamond prices", labels=TRUE)
hist(as.numeric(diamond$Cut), col="blue1", xlab="Types of cut", ylab="Frequency", main="Distribution of diamond cuts", labels=TRUE)

#number_items is size(5/6 of "diamond" data) for training data.
number_items <- (5/6) * nrow(diamond)
indexes <- sample(1:nrow(diamond), number_items, replace = FALSE)
training_data <- diamond[indexes,]
test_data <- diamond[-indexes,]

#Choosing the x attributes and the response variable
x <- training_data[,2:8]
y <- training_data$Price

#specifying the categorical variables
cat_var <- c("Cut", "Color", "Clarity", "Polish", "Symmetry", "Report")

#running the rulefit command
rfmod <- rulefit(x, y, cat.vars=cat_var, rfmode="regress",  test.reps=10, test.fract=0.1)
rfmodinfo(rfmod)

rules(beg=1, end=10, x)

#finding the top three most important variables in determining the diamond's price
vi <- varimp(range=1:3, col="blue")

#specifying x attributes and the response variable for test data
test_data_x <- test_data[,2:8]
test_data_y <-test_data[,9]
#predicting diamond price on test data
yhat <- rfpred(test_data_x)

#calculating average absolute error on test set
abs.test.ensemble <- 1/1000*sum(abs(test_data_y - yhat))
print(abs.test.ensemble)

# loading rpart library
library(rpart)
#converting appropriate x attributes to factors
training_data[,3] <- as.factor(training_data[,3])
training_data[,4] <- as.factor(training_data[,4])
training_data[,5] <- as.factor(training_data[,5])
training_data[,6] <- as.factor(training_data[,6])
training_data[,7] <- as.factor(training_data[,7])
training_data[,8] <- as.factor(training_data[,8])

# fitting a decision tree to training data and plotting complexity parameter
diamond.rpc <- rpart(Price~., method = "anova", data = training_data, cp=0.0001)
plotcp(diamond.rpc)

#getting the optimal cp value from cp table to prune the tree
cp_val <- diamond.rpc$cptable
print(cp_val)

#pruning the tree
diamond.prune <- prune(diamond.rpc, cp = 0.0001)

#plotting the pruned tree
plot(diamond.prune)
plot(diamond.prune, branch = 0.4, uniform = T)
text(diamond.prune, use.n = F, digits=3, pretty=0)

#converting appropriate x attributes to factors
test_data[,3] <- as.factor(test_data[,3])
test_data[,4] <- as.factor(test_data[,4])
test_data[,5] <- as.factor(test_data[,5])
test_data[,6] <- as.factor(test_data[,6])
test_data[,7] <- as.factor(test_data[,7])
test_data[,8] <- as.factor(test_data[,8])

#predicting diamond prices on test set with decision tree method
prune_pred <- predict(diamond.prune, test_data, type = "vector")
#calculating absolute average error on test set with decsion tree method 
abs.test.tree <- 1/1000*sum(abs(test_data$Price - prune_pred))
print(abs.test.tree)