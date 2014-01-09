#HW 4 Question 4 - Anand Gautam
setwd("C:/Users/agautam/Desktop/Data Mining projects with R/HW4")
set.seed(1)

#Loading the movies data and creating a summary
library(arules)
movies_dat <- read.transactions("ratingsAsBasket.txt", format = "basket", sep=NULL)
inspect(movies_dat)
summary(movies_dat)
#The most frequent item is the Matrix (movieID - 4712) with 4729 ratings of "High"
#The mininmum number of movies rated by one user is
#The number of "baskets" is 

#building the association rules from the movies dataset
rules <- apriori(movies_dat, parameter = list(supp = 0.1, conf = 0.7, target = "rules"))
summary(rules)
top_ten <- head(rules,10)
inspect(top_ten)

#finding all the rules with lift greater than 3.
rules.sub <- subset(rules, subset = lift > 3)
inspect(rules.sub)
summary(rules.sub)
 
