df1<- data.frame(x=c(3,4,2,3), y=c(4,6,6,8))
df2<-data.frame(x=c(3,1,5,3), y=c(0,-2,-2,-4))

sumx <- sum(df1$x)
sumy <- sum(df1$y)

u1 <-((1/dim(df1)[1]*data.frame(sumx, sumy)))

sumx <- sum(df2$x)
sumy <- sum(df2$y)

u2 <-((1/dim(df2)[1]*data.frame(sumx, sumy)))

mat_i <- matrix(c(0,0,0,0),nrow=2, ncol=2, byrow=TRUE)

for(i in 1:4){
mat1 <- matrix(c(df1$x[i]-u1$sumx, df1$y[i]-u1$sumy), nrow=2, ncol=1, byrow=TRUE)
mat_t <- t(mat1)
mat_f <- mat1%*%mat_t
mat_i = mat_f + mat_i
new_mat_i = (1/dim(df1)[1])*mat_i
}

#tried computing for sigma 2 but it is not giving the right output
sig_i_2 <- matrix(c(0,0,0,0),nrow=2, ncol=2, byrow=TRUE)

for(i in 1:4){
mat1 <- matrix(c(df2$x[i]-u2$sumx, df2$y[i]-u2$sumy), nrow=2, ncol=1, byrow=TRUE)
mat_t <- t(mat1)
mat_f <- mat1%*%mat_t
sig_i_2 = mat_f + sig_i_2
new_sig_i_2 = (1/dim(df2)[1])*mat_i
}

