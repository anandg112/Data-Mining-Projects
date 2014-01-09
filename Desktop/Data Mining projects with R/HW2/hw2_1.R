#Ques 1
#Group 17: Akankshi Rastogi and Anand Gautam

#a)-----Loading the data "az5000" in R.------
az5000 <- read.table("az-5000.txt", header=TRUE)

#Showing the first and last rows of data "az5000".
head(az5000, n=1)
tail(az5000, n=1)


#b)-----Selecting  the training data from data "az500"------

#"number_items" is size(80% of data "az5000") for training data.
number_items <- 0.8 * nrow(az5000)

#Variable "indexes" holds the row index values randomly selected for training data.
indexes <- sample(1:nrow(az5000), number_items, replace = FALSE)

#"trainingData_az5000" is the training data mapped from the index values from data "az5000"
trainingData_az5000 <- az5000[indexes,]

#c)----Showing Number of cases per class.-----
table(trainingData_az5000$char)



  
