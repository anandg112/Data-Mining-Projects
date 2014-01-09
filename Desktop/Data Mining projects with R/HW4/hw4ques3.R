#HW 4 Question 3 - Anand Gautam
setwd("C:/Users/agautam/Desktop/Data Mining projects with R/HW4")
set.seed(123)

#Loading the letters data
char_dat <- read.table("az-5000.txt" , TRUE)

#Removing the first column of letters data frame
new_char_dat <- char_dat[,-1]
dim(new_char_dat)
head(new_char_dat,5)

#performing kmeans and determining the number of clusters
fit <- vector()
for (i in 2:26)
{
km.out <- kmeans(new_char_dat, centers=i, iter.max=26)
}

#average method hieracrhical clustering and showing the dendrogram with cluster index on each leaf
d <- dist(km.out$centers, method = "euclidean")
fit <- hclust(d, method="average")
plot(fit)

#creating a 26 x 26 matrix (letters by cluster numbers) by extracting cluster vector from km.out and 
#letter vector from character data set and populating the matrix using a for loop from 1 to 5000 
#for each character sample
 
letter_mat <- char_dat[,1]
num_cluster <- km.out$cluster 
initial_mat <- matrix(0,26,26)
rownames(initial_mat) <- LETTERS

for(k in 1:5000)
{ 
initial_mat[letter_mat[k], num_cluster[k]] <-  initial_mat[letter_mat[k], num_cluster[k]] + 1
}

#showing the dendogram with letters by getting the letter position where maximum of the 26 x 26 letter
#matrix occurs plotting the fit with the corresponding label
common_letter <- c()
for(i in 1:26)
{
common_letter[i] <- which.max(initial_mat[,i])
}

plot(fit, labels=LETTERS[common_letter])

