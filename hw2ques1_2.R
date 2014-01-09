#loading character data and looking at dimension of char data 
set.seed(123)
Chars <- read.table("az-5000.txt", header = TRUE)
dim(Chars)

#randomly selecting 80% of data for training
train <- sample(1:5000, 4000)

#showing the number of cases per class
table(Chars$char[train])

#creating a vector of prior probabilities equal to 1/26 for each class
char.priors <- c(rep(1/26, 26))

#running linear discriminant analysis on training data with equal priors above
Char.lda <- lda(char ~., Chars, subset = train, prior = char.priors)

#printing confusion matrix on the test data
Char.confusion <- table(Chars[-train,]$char, predict(Char.lda, Chars[-train,])$class)
Char.confusion

#computing which character had the best/worst performance
for (i in seq(1,26)) {
cat (row.names(Char.confusion)[i], " ")
cat (Char.confusion[i,i]/sum(Char.confusion[i,]), "\n")
}
#Character "P" had the best performance

#computing accuracy on training and test set
length(which(predict(Char.lda, Chars[-train,])$class == Chars[-train,]$char))
794/1000 #or 79.4%
 
length(which(predict(Char.lda, Chars[train,])$class == Chars[train,]$char))
3156/4000 #or 78.9%

