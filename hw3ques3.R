setwd("C:/Users/agautam/Desktop/Data Mining projects with R/HW3")
set.seed(1)
data=read.table("house_type_data.txt",header=TRUE,sep=",")
data$age=as.factor(data$age)
data$sex=as.factor(data$sex)
data$ms=as.factor(data$ms)
data$edu=as.factor(data$edu)
data$ocu=as.factor(data$ocu)
data$inc=as.factor(data$inc)
data$ba=as.factor(data$ba)
data$di=as.factor(data$di)
data$hhs=as.factor(data$hhs)
data$hs=as.factor(data$hs)
data$hs2=as.factor(data$hs2)
data$eth=as.factor(data$eth)
data$lang=as.factor(data$lang)

num=0.9*nrow(data)
num

training=sample(nrow(data),num) 
trainingdata=data[training,]
test=-training
testdata=data[test,]
sum(is.na(data))
sum(is.na(trainingdata))

#Problem 3.a
install.packages('rpart')
library(rpart)
ctree=rpart(ht~.,data=trainingdata,method="class",cp=0.0001)
#Problem 3.b
plotcp(ctree)
print(ctree$cptable)
which.min(ctree$cptable[,"xerror"])
#Problem 3.c
pruned_tree=prune(ctree,cp=0.0014077426)
plot(pruned_tree)
#Problem 3.d
plot(pruned_tree,compress=TRUE,uniform=TRUE,margin=0.2)
text(pruned_tree,all=TRUE,pretty=0,splits=TRUE,use.n=TRUE)
#Problem 3.f
ctree_test=rpart(ht~.,data=testdata,method="class",cp=0.0001)
plotcp(ctree_test)
print(ctree_test$cptable)
which.min(ctree_test$cptable[,"xerror"])
pretree=predict(pruned_tree,testdata,type="class")
httest=testdata$ht
confusionM=table(pretree,httest)
sum(diag(confusionM))
sum(confusionM)
accuracy=sum(diag(confusionM))/sum(confusionM)
accuracy
