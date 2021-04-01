# R code: Day 2

## Aspirin Data

aspirin <- c(rep(0, 10918), rep(1, 119))
n_a <- length(aspirin)
placebo <- c(rep(0, 10936), rep(1, 98))
n_p <- length(placebo)
theta <- c()
for(i in 1:1000){
  s_a <- sample(aspirin, n_a, replace = TRUE)
  s_p <- sample(placebo, n_p, replace = TRUE)
  theta[i] <- (sum(s_a) / n_a) / (sum(s_p) / n_p)
}
mean(theta)
quantile(theta, c(0.025, 0.975))

## Mice Data
library(arrangements) # for combinatorics 
# or library(gtools)
wgts <- c(82, 107, 93)

# 1.
mean(wgts)

# 2. and # 3. 
b_samples <- combinations(wgts, 3, replace=TRUE) # total number = 10
# Try
# permutations(wgts, 3, replace=TRUE) # total number = 27
b_samples
dim(b_samples)[1]

# 4.
b_means <- rowMeans(b_samples)
b_means

# 5.
mean(b_means)

# 6.
max(b_means)
max_index <- which.max(b_means)
b_samples[max_index,]

min(b_means)
which.min(b_means)
min_index <- which.min(b_means)
b_samples[min_index,]
