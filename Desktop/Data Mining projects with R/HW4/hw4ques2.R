#HW 4 Question 2 - Anand Gautam
setwd("C:/Users/agautam/Desktop/Data Mining projects with R/HW4")
set.seed(1)

#Loading the "letters Data"
char_dat <- read.table("az-5000.txt" , TRUE)

#Removing the first column of matrix
new_char_dat <- char_dat[,-1]
dim(new_char_dat)
head(new_char_dat,5)

#performing kmeans and determining the number of clusters
fit <- vector()
for (i in 2:26)
{
km.out <- kmeans(new_char_dat, centers=i, iter.max=26)
fit[i] <- (1/i)*sum(kmeans(new_char_dat, centers=i)$withinss)
}
#plotting goodness of fit vs. number of clusters(K)
par(mfrow=c(2,1))
plot(1:26, fit, type="b", xlab="Number of Clusters", ylab="Goodness of fit(Withinss)")

#performing kmeans from 15...26 and determining the number of clusters
fit2 <- vector()
for (i in 15:26)
{
 fit2[i] <- (1/i)*sum(kmeans(new_char_dat, centers=i)$withinss)
}
#plotting goodness of fit vs. number of clusters(K)
plot(1:26, fit2, type="b", xlab="Number of Clusters", ylab="Goodness of fit(Withinss)")

#The 23rd letter (W) might suggest number of natural clusters. This is because after plotting the K from 15
#to 26, there is an elbow in the shape of the graph at 23, suggesting that as the number of clusters.



