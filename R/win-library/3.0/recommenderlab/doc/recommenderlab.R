### R code from vignette source 'recommenderlab.Rnw'
### Encoding: ISO8859-1

###################################################
### code chunk number 1: recommenderlab.Rnw:60-63
###################################################
options(scipen=3, digits=4, prompt="R> ", eps=FALSE, width=75)
### for sampling
set.seed(1234)


###################################################
### code chunk number 2: recommenderlab.Rnw:1012-1013
###################################################
library("recommenderlab")


###################################################
### code chunk number 3: recommenderlab.Rnw:1021-1026
###################################################
m <- matrix(sample(c(as.numeric(0:5), NA), 50, 
    replace=TRUE, prob=c(rep(.4/6,6),.6)), ncol=10,
    dimnames=list(user=paste("u", 1:5, sep=''), 
	item=paste("i", 1:10, sep='')))
m


###################################################
### code chunk number 4: recommenderlab.Rnw:1033-1036
###################################################
r <- as(m, "realRatingMatrix")
r
#as(r,"dgCMatrix")


###################################################
### code chunk number 5: recommenderlab.Rnw:1041-1042
###################################################
identical(as(r, "matrix"),m)


###################################################
### code chunk number 6: recommenderlab.Rnw:1050-1052
###################################################
as(r, "list")
head(as(r, "data.frame"))


###################################################
### code chunk number 7: recommenderlab.Rnw:1065-1067
###################################################
r_m <- normalize(r)
r_m


###################################################
### code chunk number 8: recommenderlab.Rnw:1073-1075 (eval = FALSE)
###################################################
## image(r, main = "Raw Ratings")
## image(r_m, main = "Normalized Ratings")


###################################################
### code chunk number 9: image1
###################################################
print(image(r, main = "Raw Ratings"))


###################################################
### code chunk number 10: image2
###################################################
print(image(r_m, main = "Normalized Ratings"))


###################################################
### code chunk number 11: recommenderlab.Rnw:1108-1110
###################################################
r_b <- binarize(r, minRating=4)
as(r_b, "matrix")


###################################################
### code chunk number 12: recommenderlab.Rnw:1122-1124
###################################################
data(Jester5k)
Jester5k


###################################################
### code chunk number 13: recommenderlab.Rnw:1132-1134
###################################################
r <- sample(Jester5k, 1000) 
r


###################################################
### code chunk number 14: recommenderlab.Rnw:1141-1144
###################################################
rowCounts(r[1,])
as(r[1,], "list")
rowMeans(r[1,])


###################################################
### code chunk number 15: hist1
###################################################
hist(getRatings(r), breaks=100)


###################################################
### code chunk number 16: hist2
###################################################
hist(getRatings(normalize(r)), breaks=100)


###################################################
### code chunk number 17: hist3
###################################################
hist(getRatings(normalize(r, method="Z-score")), breaks=100)


###################################################
### code chunk number 18: hist4
###################################################
hist(rowCounts(r), breaks=50)


###################################################
### code chunk number 19: hist5
###################################################
hist(colMeans(r), breaks=20)


###################################################
### code chunk number 20: recommenderlab.Rnw:1231-1232
###################################################
recommenderRegistry$get_entries(dataType = "realRatingMatrix")


###################################################
### code chunk number 21: recommenderlab.Rnw:1240-1242
###################################################
r <- Recommender(Jester5k[1:1000], method = "POPULAR")
r


###################################################
### code chunk number 22: recommenderlab.Rnw:1246-1248
###################################################
names(getModel(r))
getModel(r)$topN


###################################################
### code chunk number 23: recommenderlab.Rnw:1263-1265
###################################################
recom <- predict(r, Jester5k[1001:1002], n=5)
recom


###################################################
### code chunk number 24: recommenderlab.Rnw:1270-1271
###################################################
as(recom, "list")


###################################################
### code chunk number 25: recommenderlab.Rnw:1277-1280
###################################################
recom3 <- bestN(recom, n = 3)
recom3
as(recom3, "list")


###################################################
### code chunk number 26: recommenderlab.Rnw:1288-1291
###################################################
recom <- predict(r, Jester5k[1001:1002], type="ratings")
recom
as(recom, "matrix")[,1:10]


###################################################
### code chunk number 27: recommenderlab.Rnw:1311-1313
###################################################
e <- evaluationScheme(Jester5k[1:1000], method="split", train=0.9, given=15)
e


###################################################
### code chunk number 28: recommenderlab.Rnw:1319-1324
###################################################
r1 <- Recommender(getData(e, "train"), "UBCF")
r1

r2 <- Recommender(getData(e, "train"), "IBCF")
r2


###################################################
### code chunk number 29: recommenderlab.Rnw:1331-1335
###################################################
p1 <- predict(r1, getData(e, "known"), type="ratings")
p1
p2 <- predict(r2, getData(e, "known"), type="ratings")
p2


###################################################
### code chunk number 30: recommenderlab.Rnw:1341-1347
###################################################
error <- rbind(
  calcPredictionError(p1, getData(e, "unknown")),
  calcPredictionError(p2, getData(e, "unknown"))
)
rownames(error) <- c("UBCF","IBCF")
error


###################################################
### code chunk number 31: recommenderlab.Rnw:1360-1363
###################################################
scheme <- evaluationScheme(Jester5k[1:1000], method="cross", k=4, given=3,
    goodRating=5)
scheme


###################################################
### code chunk number 32: recommenderlab.Rnw:1370-1372
###################################################
results <- evaluate(scheme, method="POPULAR", n=c(1,3,5,10,15,20))
results


###################################################
### code chunk number 33: recommenderlab.Rnw:1383-1384
###################################################
getConfusionMatrix(results)[[1]]


###################################################
### code chunk number 34: recommenderlab.Rnw:1396-1397
###################################################
avg(results)


###################################################
### code chunk number 35: roc1
###################################################
plot(results, annotate=TRUE)


###################################################
### code chunk number 36: precrec1
###################################################
plot(results, "prec/rec", annotate=TRUE)


###################################################
### code chunk number 37: recommenderlab.Rnw:1442-1455
###################################################
scheme <- evaluationScheme(Jester5k[1:1000], method="split", train = .9, 
    k=1, given=20, goodRating=5)
scheme

algorithms <- list(
        "random items" = list(name="RANDOM", param=NULL),
        "popular items" = list(name="POPULAR", param=NULL),
        "user-based CF" = list(name="UBCF", param=list(method="Cosine", 
		nn=50, minRating=5))
        )

## run algorithms
results <- evaluate(scheme, algorithms, n=c(1, 3, 5, 10, 15, 20))


###################################################
### code chunk number 38: recommenderlab.Rnw:1460-1461
###################################################
results


###################################################
### code chunk number 39: recommenderlab.Rnw:1467-1469
###################################################
names(results)
results[["user-based CF"]]


###################################################
### code chunk number 40: roc2
###################################################
plot(results, annotate=c(1,3), legend="topleft")


###################################################
### code chunk number 41: precrec2
###################################################
plot(results, "prec/rec", annotate=3)


###################################################
### code chunk number 42: recommenderlab.Rnw:1510-1521
###################################################
Jester_binary <- binarize(Jester5k, minRating=5)
Jester_binary <- Jester_binary[rowCounts(Jester_binary)>20]
Jester_binary
scheme_binary <- evaluationScheme(Jester_binary[1:1000], method="split", train=.9, k=1, given=20)
scheme_binary

algorithms_binary <- list(
        "random items" = list(name="RANDOM", param=NULL),
        "popular items" = list(name="POPULAR", param=NULL),
        "user-based CF" = list(name="UBCF", param=list(method="Jaccard", nn=50))
        )


###################################################
### code chunk number 43: recommenderlab.Rnw:1524-1525
###################################################
results_binary <- evaluate(scheme_binary, algorithms_binary, n=c(1,3,5,10,15,20))


###################################################
### code chunk number 44: roc3
###################################################
plot(results_binary, annotate=c(1,3), legend="bottomright")


