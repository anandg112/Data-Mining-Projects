prior_w1 <- 0.5
prior_w2 <- 0.25
prior_w3 <- 0.25

w_vector <- c(prior_w1, prior_w3, prior_w3, prior_w2)

x <- c(0.6, 0.1, 0.9, 1.1)

prob_seq1 <- (dnorm(x, 0, 1))*w_vector
prob_seq2 <- (dnorm(x, 0.5, 1))*w_vector
prob_seq3 <- (dnorm(x, 1, 1))*w_vector
