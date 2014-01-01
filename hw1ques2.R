housing_data <- read.csv("housetype_data.txt", header=TRUE)
dim(housing_data)
head(housing_data, 5)

attributeHist <- function(attribute){

if(attribute=='ht'){
hist_plot <- hist(housing_data$ht)
if(sum(is.na(housing_data$ht > 0))){
mis_val <- sum(is.na(housing_data$ht))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='sex'){
hist_plot <- hist(housing_data$sex)
if(sum(is.na(housing_data$sex > 0))){
mis_val <- sum(is.na(housing_data$sex))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='age'){
hist_plot <- hist(housing_data$age)
if(sum(is.na(housing_data$age > 0))){
mis_val <- sum(is.na(housing_data$age))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='edu'){
hist_plot <- hist(housing_data$edu)
if(sum(is.na(housing_data$edu > 0))){
mis_val <- sum(is.na(housing_data$edu))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='ocu'){
hist_plot <- hist(housing_data$ocu)
if(sum(is.na(housing_data$ocu > 0))){
mis_val <- sum(is.na(housing_data$ocu))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='inc'){
hist_plot <- hist(housing_data$inc)
if(sum(is.na(housing_data$inc > 0))){
mis_val <- sum(is.na(housing_data$inc))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='ba'){
hist_plot <- hist(housing_data$ba)
if(sum(is.na(housing_data$ba > 0))){
mis_val <- sum(is.na(housing_data$ba))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='di'){
hist_plot <- hist(housing_data$di)
if(sum(is.na(housing_data$di > 0))){
mis_val <- sum(is.na(housing_data$di))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='hs'){
hist_plot <- hist(housing_data$hs)
if(sum(is.na(housing_data$hs > 0))){
mis_val <- sum(is.na(housing_data$hs))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='hs2'){
hist_plot <- hist(housing_data$hs2)
if(sum(is.na(housing_data$hs2 > 0))){
mis_val <- sum(is.na(housing_data$hs2))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='hhs'){
hist_plot <- hist(housing_data$hhs)
if(sum(is.na(housing_data$hhs > 0))){
mis_val <- sum(is.na(housing_data$hhs))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='eth'){
hist_plot <- hist(housing_data$eth)
if(sum(is.na(housing_data$eth > 0))){
mis_val <- sum(is.na(housing_data$eth))
sprintf("There are %i missing values", mis_val)
}
}

else if(attribute=='lang'){
hist_plot <- hist(housing_data$lang)
if(sum(is.na(housing_data$lang > 0))){
mis_val <- sum(is.na(housing_data$lang))
sprintf("There are %i missing values", mis_val)
}
}

else{
print("There is no such attribute.")
}
}