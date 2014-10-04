xy=read.table("az-5000.txt",header=TRUE)    #read data
set.seed(1)
sampleline=sample(nrow(xy),4000)
sampledata=xy[sampleline,]    #take the training data out
testline=-sampleline
testdata=xy[testline,]     #take the test data out
#Problem 1.b
chartonum=as.numeric(sampledata$char)   #convert the char column to an integer
ctonM=as.matrix(chartonum)
binaryM=matrix(0,nrow=nrow(ctonM),ncol=26)    #get the zero matrix
for(i in 1:4000)        #fill the zero matrix with 1 in suitable position to get binary Matrix
  {a=chartonum[i] 
     binaryM[i,a]=1}
sum(binaryM==1)    #check the result by counting the number of 1
#Problem 1.c
install.packages('nnet')    #install the package'nnet'
library(nnet)
#use nnet to fit feed-forward neural networks(size between 1 and 20)
prennet=list()
for (i in 1:20)
{
  prennet[[i]]=nnet(char~.,data=sampledata,size=i,maxit=1000)
}
#Problem 1.d
#for each nnet get the fitted value
fittedvalue=list()
for (i in 1:20)
{
  fittedvalue[[i]]=prennet[[i]]$fitted.values
}
install.packages('Metrics')
library(Metrics)
#get the mean square error from training data
mserror=0
for(i in 1:20)
      {mserror[i]=mse(binaryM,fittedvalue[[i]])}
#Problem 1.e
#get the binary matrix from test data
chartonum_test=as.numeric(testdata$char)
ctonM_test=as.matrix(chartonum_test)
binaryM_test=matrix(0,nrow=nrow(ctonM_test),ncol=26)
for(i in 1:1000)
{a=chartonum_test[i] 
 binaryM_test[i,a]=1}
sum(binaryM_test==1)   #check the result by counting the number of 1    
#use the predict command to compute the MSE for test set
pre_test=list()
for (i in 1:20)
      {
                 pre_test[[i]]=predict(prennet[[i]],testdata)
             }
mse_test=0
for (i in 1:20)
      {
         mse_test[i]=mse(binaryM_test,pre_test[[i]])
             }
plot(mse_test)    #plot the result of mse in test data
par(new=T)
plot(mserror,col="red",axes=F) #plot the result of mse in training data
