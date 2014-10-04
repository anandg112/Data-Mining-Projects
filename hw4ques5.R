#HW 4 Question 5 - Anand Gautam
setwd("C:/Users/agautam/Desktop/Data Mining projects with R/HW4")
set.seed(123)
#using the letter confusion matrix from HW2 for this question

Chars <- read.table("az-5000.txt", header = TRUE) 
dim(Chars) 

train <- sample(1:5000, 4000) 

table(Chars$char[train]) 

char.priors <- c(rep(1/26, 26)) 

Char.lda <- lda(char ~., Chars, subset = train, prior = char.priors) 

Char.confusion <- table(Chars[-train, ]$char, predict(Char.lda, Chars[-train, ])$class)
Char.confusion

#setting diagonals of the matrix to be 0 and producing image with non-zero entries colored
diag(Char.confusion) <- 0
labelpos <- 0:25
labelpos_std <- labelpos/25
image(Char.confusion, col=heat.colors(4), axes=FALSE)
axis(1, labelpos_std, labels=LETTERS[1:26])
axis(2, labelpos_std, labels=LETTERS[1:26])